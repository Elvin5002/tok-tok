import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../utils/constants/app_assets.dart';
import '../../utils/constants/app_colors.dart';
import '../../utils/extensions/context_extensions.dart';
import '../../utils/extensions/widget_state_property_all_extension.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.backgroundColor = AppColors.primary,
    this.textColor = AppColors.white,
    required this.onPressed,
    this.isLoading = false,
  });

  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final void Function()? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: Size(context.fullWidth, 60.h).toWspAll,
        backgroundColor: backgroundColor.toWspAll,
      ),
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? Lottie.asset(
              AppAssets.loadingAnim,
              height: 48.r,
              width: 48.r,
            )
          : Text(
              text,
              style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                  height: 1.4),
            ),
    );
  }
}
