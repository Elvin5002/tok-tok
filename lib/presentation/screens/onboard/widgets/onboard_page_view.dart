import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../cubits/onboard/onboard_cubit.dart';
import '../../../../utils/constants/app_colors.dart';
import 'onboard_item_view.dart';

class OnboardPageView extends StatelessWidget {
  const OnboardPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnboardCubit>();
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
                onPageChanged: (index) {
                  if (index == cubit.onboardItems.length - 1) {
                    cubit.isLastPage.add(true);
                  } else {
                    cubit.isLastPage.add(false);
                  }
                },
                controller: cubit.pageController,
                itemCount: cubit.onboardItems.length,
                itemBuilder: (_, index) {
                  return OnboardItem(
                    onboardModel: cubit.onboardItems[index],
                  );
                }),
          ),
          40.verticalSpace,
          SmoothPageIndicator(
            controller: cubit.pageController,
            count: cubit.onboardItems.length,
            effect: ExpandingDotsEffect(
              dotHeight: 6.h,
              dotWidth: 6.w,
              spacing: 12.w,
              dotColor: AppColors.grey300,
              activeDotColor: AppColors.primary400,
            ),
          )
        ],
      ),
    );
  }
}
