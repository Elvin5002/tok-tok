import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_paddings.dart';
import '../../../utils/extensions/list_extensions.dart';
import '../../../utils/extensions/navigation_extension.dart';
import '../../../utils/extensions/string_extensions.dart';
import '../../../utils/extensions/timestamp_extensions.dart';
import '../../../utils/helpers/pager.dart';
import '../../../utils/helpers/string_helpers.dart';
import '../../widgets/profile_photo.dart';
import 'widgets/message_counter.dart';

class ChatHistoryPage extends StatefulWidget {
  const ChatHistoryPage({super.key});

  @override
  State<ChatHistoryPage> createState() => _ChatHistoryPageState();
}

class _ChatHistoryPageState extends State<ChatHistoryPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat History')),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chats')
            .where('members',
                arrayContains: FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          final docs = snapshot.data?.docs ?? [];
          return Skeletonizer(
            enabled: !snapshot.hasData,
            child: ListView.separated(
              itemCount: docs.length,
              separatorBuilder: (_, i) => 16.verticalSpace,
              itemBuilder: (_, i) {
                final lastMessage = docs[i].data();
                return StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .doc(
                        FirebaseAuth.instance.currentUser!.uid !=
                                lastMessage['senderId']
                            ? lastMessage['senderId']
                            : lastMessage['recieverId'],
                      )
                      .snapshots(),
                  builder: (context, snapshot) {
                    final user = snapshot.data?.data();
                    String docId = chatMemberDocId(
                        lastMessage['members'][0], lastMessage['members'][1]);
                    log('DOCID: $docId');
                    return ListTile(
                      leading: Skeletonizer(
                        enableSwitchAnimation: true,
                        enabled: !snapshot.hasData,
                        child: ProfilePhoto(url: user?['photo']),
                      ),
                      title: Text('${user?['fullname']}'),
                      subtitle: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if ((lastMessage['senderId'] as String).isMe)
                            Icon(
                              Icons.check,
                              size: 20,
                              color: lastMessage['isSeen']
                                  ? AppColors.primary
                                  : AppColors.grey300,
                            ),
                          2.horizontalSpace,
                          Flexible(
                            child: Text(
                              '${lastMessage['messageText']}',
                              overflow: TextOverflow.ellipsis,
                              style: (lastMessage['senderId'] as String).isMe
                                  ? TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.normal,
                                    )
                                  : TextStyle(
                                      fontSize:
                                          lastMessage['isSeen'] ? 16.sp : 18.sp,
                                      fontWeight: lastMessage['isSeen']
                                          ? FontWeight.normal
                                          : FontWeight.bold,
                                    ),
                            ),
                          ),
                        ],
                      ),
                      trailing: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('chats')
                            .doc(docId)
                            .collection('chats')
                            .where('isSeen', isEqualTo: false)
                            .snapshots(),
                        builder: (context, snapshot) {
                          final list = snapshot.data?.docs;
                          if (!snapshot.hasData || list.isEmptyOrNull) {
                            return const SizedBox.shrink();
                          }

                          final count = snapshot.data!.docs.length;
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                (lastMessage['time'] as Timestamp).hM,
                                style: TextStyle(
                                  color: AppColors.grey700,
                                  fontSize: 14.sp,
                                ),
                              ),
                              4.verticalSpace,
                              if (!(lastMessage['senderId'] as String).isMe)
                                MessageCounter(count: count),
                            ],
                          );
                        },
                      ),
                      contentPadding: AppPaddings.a10,
                      horizontalTitleGap: 0,
                      onTap: () => context.to(Pager.chat(user!)),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}


// FCM

// !Time over count
// !before message text (tick)
// !online/offline
// !short text with 3 dots
// !if sender is me dont count message
