import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tok_tok/presentation/screens/account_details/widgets/bottom_sheet_buttons.dart';
import 'package:tok_tok/utils/constants/app_colors.dart';

class AllBottomSheetButtons extends StatelessWidget {
  const AllBottomSheetButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        24.verticalSpace,
        const BottomSheetButtons(
          text: "Report...",
          icon: Icons.report,
          textColor: AppColors.gradientRed,
          iconColor: AppColors.gradientRed,
        ),
        const BottomSheetButtons(
          text: "Block",
          icon: Icons.block,
          textColor: AppColors.black,
          iconColor: AppColors.black,
        ),
        const BottomSheetButtons(
          text: "About this Account",
          icon: Icons.person_2_outlined,
          textColor: AppColors.black,
          iconColor: AppColors.black,
        ),
        const BottomSheetButtons(
          text: "Restrict",
          icon: Icons.delete_outline_outlined,
          textColor: AppColors.black,
          iconColor: AppColors.black,
        ),
        const BottomSheetButtons(
          text: "Hide Your Story",
          icon: Icons.hide_source,
          textColor: AppColors.black,
          iconColor: AppColors.black,
        ),
        const BottomSheetButtons(
          text: "Copy Profile URL",
          icon: Icons.copy,
          textColor: AppColors.black,
          iconColor: AppColors.black,
        ),
        const BottomSheetButtons(
          text: "Share This Profile",
          icon: Icons.share,
          textColor: AppColors.black,
          iconColor: AppColors.black,
        ),
      ],
    );
  }
}
