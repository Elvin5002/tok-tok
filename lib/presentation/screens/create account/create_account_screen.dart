import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tok_tok/utils/helpers/snacks.dart';

import '../../../cubits/create_account/create_account_cubit.dart';
import '../../../utils/constants/app_assets.dart';
import '../../../utils/constants/app_borders.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_paddings.dart';
import '../../../utils/constants/app_strings.dart';
import '../../../utils/extensions/navigation_extension.dart';
import '../../../utils/helpers/pager.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_social_button.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/divider_text.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateAccountCubit>();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: AppPaddings.h24,
        child: SingleChildScrollView(
          child: Column(
            children: [
              44.verticalSpace,
              Text(
                AppStrings.createAccountTitle,
                style: TextStyle(
                    fontWeight: FontWeight.w700, fontSize: 40.sp, height: 1.1),
              ),
              67.verticalSpace,
              CustomTextField(
                hint: 'Email',
                controller: cubit.emailController,
                prefixIcon: Icons.mail,
                suffixIconColor: AppColors.grey500,
                prefixIconColor: AppColors.grey500,
              ),
              20.verticalSpace,
              CustomTextField.password(
                controller: cubit.passwordController,
                suffixIconColor: AppColors.grey500,
                prefixIconColor: AppColors.grey500,
              ),
              22.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  StreamBuilder<Object>(
                    stream: cubit.checkValue.stream,
                    builder: (context, snapshot) {
                      return Checkbox(
                        value: cubit.checkValue.value,
                        onChanged: (val) => cubit.checkValue.value = val!,
                        side: AppBorders.checkboxBorder,
                        activeColor: AppColors.primary,
                      );
                    },
                  ),
                  const Text(AppStrings.rememberTxt),
                ],
              ),
              20.verticalSpace,
              BlocConsumer<CreateAccountCubit, CreateAccountState>(
                listener: (context, state) {
                  if (state is CreateAccountSuccess) {
                    context.removeAll(Pager.fillProfile);
                  } else if (state is CreateAccountError) {
                    Snacks.error(context, state.errorMessage);
                  }
                },
                builder: (_, state) => CustomButton(
                  text: AppStrings.signUp,
                  backgroundColor: Colors.white,
                  textColor: AppColors.primary,
                  isLoading: state is CreateAccountLoading,
                  onPressed: () => cubit.register(),
                ),
              ),
              68.verticalSpace,
              const DividerText(
                text: AppStrings.otherLoginTxt,
              ),
              20.verticalSpace,
              Padding(
                padding: EdgeInsets.only(
                  right: 24.0.r,
                  bottom: 48.0.r,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomSocialButton(
                      icon: SvgPicture.asset(AppAssets.facebook),
                      onTap: () {},
                    ),
                    CustomSocialButton(
                      icon: SvgPicture.asset(AppAssets.google),
                      onTap: () {},
                    ),
                    CustomSocialButton(
                      icon: SvgPicture.asset(AppAssets.apple),
                      onTap: () {},
                    ),
                    120.verticalSpace,
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(AppStrings.alreadyTxt),
                  5.horizontalSpace,
                  TextButton(
                    onPressed: () => context.replace(Pager.loginAccount),
                    child: const Text(
                      AppStrings.signIn,
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
