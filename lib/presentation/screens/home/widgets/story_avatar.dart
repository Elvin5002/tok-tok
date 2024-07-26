import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/app_colors.dart';

class StoryAvatar extends StatelessWidget {
  const StoryAvatar({
    super.key,
    required this.isAllStatusSeen,
    required this.onTap,
    required this.story,
  });

  final bool isAllStatusSeen;
  final void Function() onTap;
  final Map<String, dynamic> story;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40.r,
              backgroundColor: isAllStatusSeen == true
                  ? AppColors.primary400
                  : AppColors.grey300,
              child: CircleAvatar(
                radius: 36.r,
                backgroundImage: NetworkImage(story['photo']),
              ),
            ),
            4.verticalSpace,
            Flexible(
              child: Text(
                story['name'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.grey900,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  height: 1.4.h,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
