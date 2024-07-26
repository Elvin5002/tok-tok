import 'package:flutter/material.dart';
import 'package:tok_tok/utils/constants/app_colors.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "julia_adaline",
      style: TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.w700,
        fontSize: 24,
      ),
    );
  }
}
