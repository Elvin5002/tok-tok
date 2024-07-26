import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/constants/app_assets.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/extensions/timestamp_extensions.dart';
import '../../../widgets/profile_photo.dart';

class StoryHeader extends StatelessWidget {
  const StoryHeader({
    super.key,
    required this.story,
  });

  final QueryDocumentSnapshot<Map<String, dynamic>> story;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      child: ListTile(
        leading: ProfilePhoto(
          radius: 24,
          url: story['userPhoto'],
        ),
        title: Text(
          story['name'],
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          (story['uploadTime'] as Timestamp).timeAgo,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 14,
          ),
        ),
        trailing: GestureDetector(
          onTap: () {
            log('message dots');
          },
          child: SvgPicture.asset(
            AppAssets.moreCircle,
            colorFilter:
                const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
