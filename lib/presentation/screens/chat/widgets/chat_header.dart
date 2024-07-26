import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../cubits/chat/chat_cubit.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/extensions/timestamp_extensions.dart';
import '../../../widgets/profile_photo.dart';

class ChatHeader extends StatelessWidget implements PreferredSizeWidget {
  const ChatHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final chatCubit = context.read<ChatCubit>();
    return AppBar(
      leadingWidth: 32,
      title: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(chatCubit.user['userId'])
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox.shrink();
            }
            final user = snapshot.data!.data()!;
            return Row(
              children: [
                ProfilePhoto(
                  radius: 25,
                  url: user['photo'],
                ),
                16.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user['fullname']),
                    Text(
                      user['isOnline']
                          ? 'Online'
                          : (user['lastSeenTime'] as Timestamp).lastSeenTime,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: AppColors.grey500,
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
