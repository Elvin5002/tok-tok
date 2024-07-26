
import 'package:flutter/material.dart';
import 'package:tok_tok/utils/constants/app_colors.dart';
import 'package:tok_tok/utils/constants/app_radiuses.dart';

class AppBorders {
  AppBorders._();

 static const defaultInputBorder = OutlineInputBorder(
    borderRadius: AppRadiuses.a10,
    borderSide: BorderSide(
      color: AppColors.gray
    ),
  );

  static const checkboxBorder = BorderSide(
    color: AppColors.primary,
    width: 2
  );

  static const errorInputBorder = OutlineInputBorder(
    borderRadius: AppRadiuses.a10,
    borderSide: BorderSide(color: Colors.red),
  );

  static final inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(color: AppColors.gray),
  );

  static final focusedBorder = inputBorder.copyWith(
    borderSide: const BorderSide(color: AppColors.primary, width: 2),
  );
}