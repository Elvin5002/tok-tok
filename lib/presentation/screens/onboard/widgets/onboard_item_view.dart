import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/models/local/onboard_model.dart';
import '../../../../utils/constants/app_colors.dart';

class OnboardItem extends StatelessWidget {
  const OnboardItem({super.key, required this.onboardModel});

  final OnboardModel onboardModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          80.verticalSpace,
          SizedBox(
            height: 0.4.sh,
            width: 0.7.sw,
            child: Image.asset(
              onboardModel.image,
            ),
          ),
          const Spacer(),
          Text(
            onboardModel.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32.sp,
              height: 1.1.h,
              fontWeight: FontWeight.w700,
              color: AppColors.grey900,
            ),
          ),
          20.verticalSpace,
          Text(
            onboardModel.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.grey700,
              height: 1.4.h,
              letterSpacing: 0.2,
            ),
          ),
        ],
      ),
    );
  }
}
