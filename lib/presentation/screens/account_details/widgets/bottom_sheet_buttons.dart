import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tok_tok/utils/constants/app_colors.dart';

class BottomSheetButtons extends StatelessWidget {
  const BottomSheetButtons({
    super.key,
    required this.text,
    required this.icon,
    required this.textColor,
    required this.iconColor,
  });

  final String text;
  final IconData icon;
  final Color textColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          elevation: 0,
        ),
        onPressed: () {},
        child: Row(
          children: [
            Icon(
              icon,
              color: iconColor,
            ),
            20.horizontalSpace,
            Text(
              text,
              style: TextStyle(
                  color: textColor, fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
