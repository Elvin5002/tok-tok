import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../cubits/chat/chat_cubit.dart';
import '../../../utils/constants/app_paddings.dart';
import '../../../utils/extensions/string_extensions.dart';
import 'widgets/chat_buble.dart';
import 'widgets/chat_header.dart';
import 'widgets/chat_input_and_send_button.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final chatCubit = context.read<ChatCubit>();
    return Scaffold(
      appBar: const ChatHeader(),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('chats')
              .doc(chatCubit.peerId.chatDocId)
              .collection('chats')
              .orderBy('time', descending: true)
              .snapshots(),
          builder: (_, snapshot) {
            final docs = snapshot.data?.docs ?? [];
            return Skeletonizer(
              enabled: !snapshot.hasData,
              child: ListView.separated(
                reverse: true,
                controller: chatCubit.scrollController,
                separatorBuilder: (_, i) => 16.verticalSpace,
                itemCount: docs.length,
                padding: AppPaddings.a16,
                itemBuilder: (_, i) {
                  final docId = docs[i].id;
                  final chatData = docs[i].data();
                  bool isMe = (chatData['senderId'] as String).isMe;
                  if (!isMe) {
                    FirebaseFirestore.instance
                        .collection('chats')
                        .doc(chatCubit.peerId.chatDocId)
                        .collection('chats')
                        .doc(docId)
                        .set(
                      {'isSeen': true},
                      SetOptions(merge: true),
                    );

                    FirebaseFirestore.instance
                        .collection('chats')
                        .doc(chatCubit.peerId.chatDocId)
                        .set(
                      {'isSeen': true},
                      SetOptions(merge: true),
                    );
                  }
                  return ChatBuble(
                    isMe: isMe,
                    chatData: chatData,
                  );
                },
              ),
            );
          }),
      bottomNavigationBar: const ChatInputAndSendButton(),
    );
  }
}
