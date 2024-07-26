import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../cubits/forgot_password/forgot_password_cubit.dart';
import 'custom_input.dart';

class OtpCodeView extends StatelessWidget {
const OtpCodeView({ super.key });

  @override
  Widget build(BuildContext context){
    final cubit = context.read<ForgotPasswordCubit>();
    return StreamBuilder<Object>(
      stream: cubit.changeColor.stream,
      builder: (context, snapshot) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            OtpCodeInput(
              fill: cubit.changeColor.value == 1? true: false,
              onTap: () => cubit.changeColor.value = 1,
            ),
            OtpCodeInput(
              fill: cubit.changeColor.value == 2? true: false,
              onTap: () => cubit.changeColor.value = 2,
            ),
            OtpCodeInput(
              fill: cubit.changeColor.value == 3? true: false,
              onTap: () => cubit.changeColor.value = 3,
            ),
            OtpCodeInput(
              fill: cubit.changeColor.value == 4? true: false,
              onTap: () => cubit.changeColor.value = 4,
            )
          ],
        );
      }
    );
  }
}