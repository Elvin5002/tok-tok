import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'my_story_avatar.dart';
import 'user_story_list.dart';

class StoryLayout extends StatelessWidget {
  const StoryLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: SizedBox(
        height: 104.h,
        child: Row(
          children: [
            const MyStoryAvatar(),
            8.horizontalSpace,
            const UserStoryList(),
          ],
        ),
      ),
    );
  }
}
