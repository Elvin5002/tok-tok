import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tok_tok/utils/constants/app_borders.dart';
import 'package:tok_tok/utils/constants/app_colors.dart';

class OtpCodeInput extends StatelessWidget {
const OtpCodeInput({ super.key, this.controller, required this.fill, this.onTap });

  final TextEditingController? controller;
  final bool fill;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context){
    return SizedBox(
      width: 64.0,
      height: 64.0,
      child: TextField(
        decoration: InputDecoration(
          border: AppBorders.inputBorder,
          focusedBorder: AppBorders.focusedBorder,
          fillColor: AppColors.lightPink,
          filled: fill
        ),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        onTap: onTap,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}