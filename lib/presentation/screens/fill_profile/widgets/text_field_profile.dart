import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/app_borders.dart';
import '../../../../utils/constants/app_colors.dart';


class TextFieldProfile extends StatefulWidget {
  const TextFieldProfile({
    super.key,
    this.hint,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.enablePasswordToggle = false,
    this.prefixIconColor = AppColors.grey500,
    this.suffixIconColor = AppColors.grey500,
  });



  final String? hint;
  final String? label;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool enablePasswordToggle;
  final Color? prefixIconColor;
  final Color? suffixIconColor;

  @override
  State<TextFieldProfile> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<TextFieldProfile> {
  bool isObsecure = true;

  void toggleObscure() {
    isObsecure = !isObsecure;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
              filled: true,
              border: AppBorders.inputBorder,
              enabledBorder: AppBorders.inputBorder,
              disabledBorder: AppBorders.inputBorder,
              focusedBorder: AppBorders.focusedBorder,
              errorBorder: AppBorders.errorInputBorder,
              focusedErrorBorder: AppBorders.focusedBorder,
              hintStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.4.h,
                  letterSpacing: 0.2.w),
              prefixIconColor: WidgetStateColor.resolveWith((states) {
                if (states.contains(WidgetState.focused)) {
                  return AppColors.primary;
                }
                return widget.prefixIconColor!;
              }),
              suffixIconColor: WidgetStateColor.resolveWith((states) {
                if (states.contains(WidgetState.focused)) {
                  return AppColors.primary;
                }
                return widget.suffixIconColor!;
              }),
              fillColor: WidgetStateColor.resolveWith((states) {
                if (states.contains(WidgetState.focused)) {
                  return AppColors.primary.withAlpha(8);
                }
                return AppColors.lightGray;
              }))),
      child: TextFormField(
        controller: widget.controller,
        obscureText: !widget.enablePasswordToggle ? false : isObsecure,
        validator: widget.validator,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: widget.hint,
          labelText: widget.label,
          suffixIcon: Icon(widget.suffixIcon)
        ),
      ),
    );
  }
}
