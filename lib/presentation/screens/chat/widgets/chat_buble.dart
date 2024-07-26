import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_paddings.dart';
import '../../../../utils/extensions/timestamp_extensions.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({
    super.key,
    required this.isMe,
    required this.chatData,
  });

  final bool isMe;
  final Map<String, dynamic> chatData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            padding: AppPaddings.a10,
            margin: EdgeInsets.only(
              left: isMe ? 60 : 0,
              right: isMe ? 0 : 60,
            ),
            decoration: BoxDecoration(
              color: isMe ? AppColors.primary200 : AppColors.grey300,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(isMe ? 16 : 0),
                topRight: Radius.circular(isMe ? 0 : 16),
                bottomLeft: const Radius.circular(16),
                bottomRight: const Radius.circular(16),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    chatData['messageText'],
                    style: TextStyle(
                      color: AppColors.grey900,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                10.horizontalSpace,
                Text(
                  (chatData['time'] as Timestamp).hM,
                  style: TextStyle(
                    color: AppColors.grey200,
                    fontSize: 14.sp,
                  ),
                ),
                6.horizontalSpace,
                if (isMe)
                  Icon(
                    Icons.check,
                    size: 20,
                    color: chatData['isSeen']
                        ? AppColors.primary
                        : AppColors.grey300,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
