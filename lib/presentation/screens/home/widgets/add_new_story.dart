import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/constants/app_assets.dart';
import '../../../../utils/constants/app_colors.dart';

class AddNewStory extends StatelessWidget {
  const AddNewStory({
    super.key,
    required this.onTap,
    this.story,
  });

  final void Function() onTap;
  final Map<String, dynamic>? story;

  @override
  Widget build(BuildContext context) {
    final storyPhoto = story?['photo'];
    final userPhoto = FirebaseAuth.instance.currentUser!.photoURL;
    log('userPhotooo: $userPhoto');
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40.r,
              backgroundImage: storyPhoto == null && userPhoto == null
                  ? const AssetImage(AppAssets.defaultAvatar) as ImageProvider
                  : NetworkImage(
                      storyPhoto ?? userPhoto,
                    ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: SvgPicture.asset(AppAssets.plus),
              ),
            ),
            4.verticalSpace,
            Flexible(
              child: Text(
                "You",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.grey900,
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
