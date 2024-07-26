import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../cubits/forgot_password/forgot_password_cubit.dart';
import '../../../../utils/constants/app_borders.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/extensions/sizedbox_extension.dart';
import '../../../widgets/custom_input.dart';
import '../../../../utils/constants/app_strings.dart';

class InputsView extends StatelessWidget {
  const InputsView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgotPasswordCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(AppStrings.newPassTxt),
        20.h,
        const CustomInput(
          isObsecure: true,
          prefix: Icons.lock,
          hint: AppStrings.passTxt,
        ),
        20.h,
        const CustomInput(
          isObsecure: true,
          prefix: Icons.lock,
          hint: AppStrings.passTxt,
        ),
        20.h,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<Object>(
              stream: cubit.checkValue.stream,
              builder: (context, snapshot) {
                return Checkbox(
                  value: cubit.checkValue.value,
                  onChanged: (val) {
                    cubit.checkValue.value = val!;
                  },
                  side: AppBorders.checkboxBorder,
                  activeColor: AppColors.primary,
                );
              }
            ),
            const Text(AppStrings.rememberTxt)
          ],
        ),
      ],
    );
  }
}
