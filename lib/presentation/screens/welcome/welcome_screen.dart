import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tok_tok/presentation/widgets/custom_button.dart';
import 'package:tok_tok/presentation/widgets/custom_social_button.dart';
import 'package:tok_tok/presentation/widgets/divider_text.dart';
import 'package:tok_tok/utils/constants/app_assets.dart';
import 'package:tok_tok/utils/constants/app_colors.dart';
import 'package:tok_tok/utils/constants/app_strings.dart';
import 'package:tok_tok/utils/extensions/navigation_extension.dart';
import 'package:tok_tok/utils/helpers/pager.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            30.verticalSpace,
            Center(child: Image.asset(AppAssets.welcome)),
            40.verticalSpace,
            Text(
              AppStrings.letsYouIn,
              style: TextStyle(
                color: AppColors.grey900,
                fontWeight: FontWeight.w700,
                fontSize: 40.sp,
                // height: 1.1
              ),
            ),
            40.verticalSpace,
            CustomSocialButton.text(
              onTap: () {},
              icon: SvgPicture.asset(AppAssets.facebook),
              text: AppStrings.continueWithFacebook,
            ),
            16.verticalSpace,
            CustomSocialButton.text(
              onTap: () {},
              icon: SvgPicture.asset(AppAssets.google),
              text: AppStrings.continueWithGoogle,
            ),
            16.verticalSpace,
            CustomSocialButton.text(
              onTap: () {},
              icon: SvgPicture.asset(AppAssets.apple),
              text: AppStrings.continueWithApple,
            ),
            24.verticalSpace,
            const DividerText(text: "or"),
            24.verticalSpace,
            CustomButton(
                text: AppStrings.signInWithPassword,
                onPressed: () {
                  context.to(Pager.loginAccount);
                }),
            40.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(AppStrings.dontHaveAccount),
                const SizedBox(width: 5.0),
                TextButton(
                  onPressed: () {
                    context.to(Pager.createAccount);
                  },
                  child: const Text(
                    AppStrings.signUp,
                    style: TextStyle(color: AppColors.primary),
                  ),
                )
              ],
            ),
            24.verticalSpace
          ],
        ),
      ),
    );
  }
}
