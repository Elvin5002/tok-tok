import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tok_tok/utils/extensions/navigation_extension.dart';

import '../../../../cubits/onboard/onboard_cubit.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_strings.dart';
import '../../../widgets/custom_button.dart';
import '../../welcome/welcome_screen.dart';

class OnboardButtonsView extends StatelessWidget {
  const OnboardButtonsView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnboardCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: StreamBuilder<bool>(
          stream: cubit.isLastPage.stream,
          builder: (context, snapshot) {
            return Column(
              children: [
                if (snapshot.data == true) 72.verticalSpace,
                CustomButton(
                  text: snapshot.data == true
                      ? AppStrings.getStarted
                      : AppStrings.next,
                  onPressed: () {
                    if (snapshot.data == true) {
                      context.removeAll(const WelcomeScreen());
                    } else {
                      cubit.nextPage();
                    }
                  },
                ),
                if (snapshot.data != true) ...[
                  12.verticalSpace,
                  CustomButton(
                    text: AppStrings.skip,
                    onPressed: () {
                      context.to(const WelcomeScreen());
                    },
                    backgroundColor: AppColors.primary100,
                    textColor: AppColors.primary,
                  ),
                ]
              ],
            );
          }),
    );
  }
}
