import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff000000);
  static const Color primary = Color(0xffFF4D67);
  static const Color lightPink = Color(0xfffff1f3);
  static const Color gray = Color.fromARGB(255, 149, 145, 145);
  static const Color lightGray = Color(0xfffafafa);
  static const Color primary400 = Color(0xffFF7185);
  static const Color primary350 = Color(0xffFF8A9B);
  static const Color primary300 = Color(0xffFF94A4);
  static const Color primary200 = Color(0xffFFB8C2);
  static const Color primary100 = Color(0xFFFFEDF0);
  static const Color secondary = Color(0xffFFD300);
  static const Color grey900 = Color(0xff212121);
  static const Color grey700 = Color(0xff616161);
  static const Color grey500 = Color(0xff9E9E9E);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey200 = Color(0xFFEEEEEE);
  static const countryCodeColor = Color(0xffBDBDBD);
  static const Color gradientBlue = Color(0xFF246BFD);
  static const Color gradientRed = Color(0xFFFF4D67);
  static const Color dark = Color(0xff1A1B22);

  static const gradient =
      LinearGradient(colors: [primary, AppColors.primary350]);
}
