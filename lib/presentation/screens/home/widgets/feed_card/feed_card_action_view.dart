import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../utils/constants/app_assets.dart';
import '../../../../../utils/constants/app_colors.dart';

class FeedCardActionView extends StatefulWidget {
  const FeedCardActionView({super.key});

  @override
  State<FeedCardActionView> createState() => _FeedCardActionViewState();



}

class _FeedCardActionViewState extends State<FeedCardActionView> {
  bool isHeartClicked = false;
  bool isBookmarkClicked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              setState(() {
                isHeartClicked = !isHeartClicked;
              });
            },
            icon: SvgPicture.asset(
              isHeartClicked ? AppAssets.heartFilled : AppAssets.heart,
            )),
        Text(
          "44,389",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              height: 1.4.h,
              color: AppColors.grey900),
        ),
        24.horizontalSpace,
        IconButton(onPressed: () {}, icon: SvgPicture.asset(AppAssets.chat)),
        Text(
          "26,376",
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              height: 1.4.h,
              color: AppColors.grey900),
        ),
        24.horizontalSpace,
        IconButton(onPressed: () {}, icon: SvgPicture.asset(AppAssets.send)),
        const Spacer(),
        IconButton(
            onPressed: () {
              setState(() {
                isBookmarkClicked = !isBookmarkClicked;
              });
            },
            icon: SvgPicture.asset(isBookmarkClicked
                ? AppAssets.bookmarkFilled
                : AppAssets.bookmark)),
      ],
    );
  }
}
