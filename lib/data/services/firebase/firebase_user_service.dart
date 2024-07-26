import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseUserService {
  Future<void> addUser(
    User user,
    String? username,
    String? about,
    String? phone,
    String? birthday,
  ) async {
    log('User: ${user.toString()}');
    log('username: $username');
    log('about: $about');
    log('phone: $phone');
    final deviceToken = await FirebaseMessaging.instance.getToken();
    log('DEVICE TOKEN: $deviceToken');
    await FirebaseFirestore.instance.collection('users').doc(user.uid).set(
      {
        'userId': user.uid,
        'email': user.email,
        'fullname': user.displayName,
        'username': username,
        'phone': phone,
        'photo': user.photoURL,
        'about': about,
        'birthday': birthday,
        'deviceToken': deviceToken,
      },
      SetOptions(merge: true),
    );
  }
}
