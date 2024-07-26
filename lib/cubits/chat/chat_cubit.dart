import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tok_tok/data/models/remote/request/notification_request.dart'
    as fcm_request;

import '../../data/contracts/firebase_notification_contract.dart';
import '../../utils/extensions/string_extensions.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(
    this.user,
    this._firebaseNotificationContract,
  ) : super(ChatInitial());

  final Map<String, dynamic> user;
  final FirebaseNotificationContract _firebaseNotificationContract;

  String get currentUid => FirebaseAuth.instance.currentUser!.uid;

  String get peerId => user['userId'];

  final messageController = TextEditingController();
  final scrollController = ScrollController();

  void sendMessage() async {
    try {
      final message = messageController.text;
      messageController.clear();
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        await FirebaseFirestore.instance
            .collection('chats')
            .doc(peerId.chatDocId)
            .collection('chats')
            .add({
          'senderId': currentUid,
          'recieverId': peerId,
          'time': Timestamp.now(),
          'messageText': message,
          'isSeen': false,
        });

        await FirebaseFirestore.instance
            .collection('chats')
            .doc(peerId.chatDocId)
            .set({
          'senderId': currentUid,
          'recieverId': peerId,
          'time': Timestamp.now(),
          'messageText': message,
          'isSeen': false,
          'members': FieldValue.arrayUnion([currentUid, peerId]),
        });

        final currentDeviceToken = await FirebaseMessaging.instance.getToken();

        final notificationRequest = fcm_request.NotificationRequest(
          message: fcm_request.Message(
            token: '${user['deviceToken']}',
            data: fcm_request.Data(
              senderId: currentUid,
              senderToken: currentDeviceToken!,
            ),
            notification: fcm_request.Notification(
              title: FirebaseAuth.instance.currentUser!.displayName!,
              body: message,
            ),
          ),
        );

        final isSent = await _firebaseNotificationContract
            .sendNotification(notificationRequest);
        if (!isSent) log('Error occured while sending notification');
      } else {
        log('Please check your internet connection');
      }
    } catch (e) {
      log('Error sending message: $e');
    }
  }

  @override
  Future<void> close() {
    messageController.dispose();
    return super.close();
  }
}
