import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tok_tok/utils/constants/app_colors.dart';

class CustomButtons extends StatelessWidget {
  const CustomButtons({
    super.key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.icon,
    required this.buttonText,
  });

  final Color backgroundColor;
  final Color foregroundColor;
  final Icon icon;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: AppColors.gradientRed,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(40.0),
          ),
        ),
        onPressed: () {},
        child: Row(
          children: [
            icon,
            20.horizontalSpace,
            Text(
              buttonText,
            ),
          ],
        ),
      ),
    );
  }
}
