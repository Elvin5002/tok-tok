import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tok_tok/cubits/forgot_password/forgot_password_cubit.dart';
import 'package:tok_tok/utils/constants/app_colors.dart';

import '../../utils/constants/app_borders.dart';
import '../../utils/constants/app_radiuses.dart';

class CustomInput extends StatelessWidget {
  const CustomInput(
      {super.key,
      this.hint,
      this.label,
      this.prefix,
      required this.isObsecure,
      this.suffix,
      this.controller,
      this.validator
  });

  final String? hint;
  final String? label;
  final IconData? prefix;
  final bool isObsecure;
  final IconData? suffix;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgotPasswordCubit>();
    return StreamBuilder<Object>(
      stream: cubit.isVisible.stream,
      builder: (context, snapshot) {
        return TextFormField(
          controller: controller,
          obscureText: cubit.isVisible.value ? false : isObsecure,
          validator: validator,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            border: AppBorders.inputBorder,
            enabledBorder: AppBorders.inputBorder,
            disabledBorder: AppBorders.inputBorder,
            focusedBorder: AppBorders.inputBorder,
            errorBorder: AppBorders.errorInputBorder,
            focusedErrorBorder: AppBorders.focusedBorder,
            fillColor: AppColors.lightGray,
            filled: true,
            hintText: hint,
            labelText: label,
            prefixIcon: Icon(prefix),
            suffixIcon: isObsecure
                ? InkWell(
                    borderRadius: AppRadiuses.a10,
                    onTap: () => cubit.isVisible.value = !cubit.isVisible.value,
                    child: Icon(
                      !cubit.isVisible.value
                          ? Icons.visibility_rounded
                          : Icons.visibility_off_rounded,
                    ),
                  )
                : Icon(suffix),
          ),
        );
      }
    );
  }
}
