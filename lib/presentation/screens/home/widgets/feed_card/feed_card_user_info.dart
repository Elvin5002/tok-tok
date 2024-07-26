import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../utils/constants/app_assets.dart';
import '../../../../../utils/constants/app_colors.dart';

class FeedCardUserInfo extends StatelessWidget {
  const FeedCardUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 24.r,
          backgroundImage: const NetworkImage(
            "https://coolmaterial.com/wp-content/uploads/2017/04/Vienna-Kendall.jpg",
          ),
        ),
        16.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "anny_wilson",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                    height: 1.4.h,
                    color: AppColors.grey900),
              ),
              Text(
                "Marketing Coordinator",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                    height: 1.2.h,
                    color: AppColors.grey700),
              )
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AppAssets.moreCircle),
        ),
      ],
    );
  }
}
