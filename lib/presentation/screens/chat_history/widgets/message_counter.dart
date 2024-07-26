import 'package:flutter/material.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_paddings.dart';

class MessageCounter extends StatelessWidget {
  const MessageCounter({
    super.key,
    required this.count,
  });

  final int count;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Padding(
        padding: AppPaddings.h8 + AppPaddings.v2,
        child: Text(
          '$count',
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
