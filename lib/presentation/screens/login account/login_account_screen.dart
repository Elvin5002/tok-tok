import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../cubits/login_account/login_account_cubit.dart';
import '../../../utils/constants/app_assets.dart';
import '../../../utils/constants/app_borders.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_paddings.dart';
import '../../../utils/constants/app_strings.dart';
import '../../../utils/extensions/navigation_extension.dart';
import '../../../utils/extensions/sizedbox_extension.dart';
import '../../../utils/helpers/pager.dart';
import '../../../utils/helpers/snacks.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_social_button.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/divider_text.dart';

class LoginAccountScreen extends StatelessWidget {
  const LoginAccountScreen({super.key});

  final bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginAccountCubit>();
    return Scaffold(
      body: Padding(
        padding: AppPaddings.a24,
        child: SingleChildScrollView(
          child: Column(
            children: [
              80.h,
              const Text(
                AppStrings.loginAccountTitle,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 40.0,
                ),
              ),
              67.h,
              CustomTextField(
                controller: cubit.email,
                prefixIcon: Icons.email_rounded,
                prefixIconColor: AppColors.grey500,
                hint: AppStrings.emailPlaceHolder,
              ),
              20.h,
              CustomTextField.password(
                controller: cubit.password,
              ),
              22.h,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                      }),
                  const Text(AppStrings.rememberTxt)
                ],
              ),
              40.h,
              BlocConsumer<LoginAccountCubit, LoginAccountState>(
                listener: (context, state) {
                  if (state is LoginAccountSuccess) {
                    context.removeAll(Pager.home);
                  } else if (state is LoginAccountError) {
                    Snacks.error(context, state.errorMessage);
                  }
                },
                builder: (_, state) => CustomButton(
                  text: AppStrings.signIn,
                  isLoading: state is LoginAccountLoading,
                  onPressed: () => cubit.login(),
                ),
              ),
              77.h,
              const DividerText(
                text: AppStrings.otherLoginTxt,
              ),
              30.h,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomSocialButton(
                      icon: SvgPicture.asset(AppAssets.facebook),
                      onTap: () {},
                    ),
                    14.w,
                    CustomSocialButton(
                      icon: SvgPicture.asset(AppAssets.google),
                      onTap: () {},
                    ),
                    14.w,
                    CustomSocialButton(
                      icon: SvgPicture.asset(AppAssets.apple),
                      onTap: () {},
                    ),
                    120.h,
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(AppStrings.dontHaveAccount),
                  const SizedBox(width: 5.0),
                  TextButton(
                    onPressed: () => context.to(Pager.createAccount),
                    child: const Text(
                      AppStrings.signUp,
                      style: TextStyle(color: AppColors.primary),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
