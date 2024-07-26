import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants/app_borders.dart';
import '../../utils/constants/app_colors.dart';
import '../../utils/constants/app_radiuses.dart';
import '../../utils/constants/app_strings.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
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
    this.enabled = true,
    this.focusNode, this.onChanged,
  });

  const CustomTextField.password({
    super.key,
    this.hint = AppStrings.passwordPlaceHolder,
    this.label,
    this.prefixIcon,
    this.controller,
    this.validator,
    this.prefixIconColor = AppColors.grey500,
    this.suffixIconColor = AppColors.grey500,
    this.enabled = true,
    this.focusNode, this.onChanged,
  })  : enablePasswordToggle = true,
        suffixIcon = null;

  final String? hint;
  final String? label;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final bool enablePasswordToggle;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final bool enabled;
  final void Function(String)? onChanged;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
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
        focusNode: widget.focusNode,
        obscureText: !widget.enablePasswordToggle ? false : isObsecure,
        validator: widget.validator,
        keyboardType: TextInputType.text,
        enabled: widget.enabled,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            left: 20,
            right: 12,
            top: 20,
            bottom: 20,
          ),
          hintText: widget.hint,
          labelText: widget.label,
          prefixIcon: widget.enablePasswordToggle
              ? const Icon(Icons.lock_rounded)
              : widget.prefixIcon != null
                  ? Icon(widget.prefixIcon)
                  : null,
          suffixIcon: widget.enablePasswordToggle
              ? InkWell(
                  borderRadius: AppRadiuses.a10,
                  onTap: () => toggleObscure(),
                  child: Icon(
                    isObsecure
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded,
                  ),
                )
              : Icon(widget.suffixIcon),
        ),
      ),
    );
  }
}
