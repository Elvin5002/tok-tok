import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tok_tok/utils/constants/app_colors.dart';

class StoryItems extends StatelessWidget {
  const StoryItems({
    super.key,
    required this.highlight,
    required this.imagePath,
  });

  final String highlight;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.red,
                width: 4,
              ),
            ),
            child: CircleAvatar(
              radius: 50,
              child: ClipOval(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        5.verticalSpace,
        Text(
          highlight,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }
}
