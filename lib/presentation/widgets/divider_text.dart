import 'package:flutter/material.dart';

import '../../utils/constants/app_colors.dart';

class DividerText extends StatelessWidget {
  const DividerText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            thickness: 2,
            indent: 10,
            endIndent: 16,
            color: AppColors.grey200,
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              height: 1.4,
              color: AppColors.grey700),
        ),
        const Expanded(
          child: Divider(
            thickness: 2,
            indent: 16,
            endIndent: 10,
            color: AppColors.grey200,
          ),
        ),
      ],
    );
  }
}
