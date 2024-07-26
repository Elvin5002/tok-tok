
import 'package:flutter/material.dart';
import 'package:tok_tok/utils/constants/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();
  static const countryTextStyle =  TextStyle(
    fontFamily: 'Urbanist',
    fontSize: 16,
    fontWeight: FontWeight.w500
  );
  static const countryCodeStyle =  TextStyle(
    fontFamily: 'Urbanist',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.countryCodeColor
  );
  static const appbarTextStyle =  TextStyle(
    fontFamily: 'Urbanist',
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.black
  );
}