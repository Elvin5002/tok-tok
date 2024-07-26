import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tok_tok/presentation/screens/account_details/widgets/custom_buttons.dart';
import 'package:tok_tok/utils/constants/app_colors.dart';

class FollowMessageButtons extends StatelessWidget {
  const FollowMessageButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        20.horizontalSpace,
        const CustomButtons(
          backgroundColor: AppColors.gradientRed,
          foregroundColor: AppColors.white,
          icon: Icon(Icons.person_add),
          buttonText: "Follow",
        ),
        20.horizontalSpace,
        const CustomButtons(
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.gradientRed,
          icon: Icon(Icons.message),
          buttonText: "Message",
        ),
        20.horizontalSpace,
      ],
    );
  }
}
