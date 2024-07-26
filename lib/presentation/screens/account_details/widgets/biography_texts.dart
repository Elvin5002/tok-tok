import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_strings.dart';
import 'account_details_text.dart';

class BiographyTexts extends StatelessWidget {
  const BiographyTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: AccountDetailsText(
            text: AppStrings.accountName,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Center(
          child: AccountDetailsText(
            text: AppStrings.accountProfession,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        10.verticalSpace,
        const AccountDetailsText(
          text: AppStrings.loremIpsum,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        10.verticalSpace,
        const Center(
          child: Text(
            "www.yourdomain.com",
            style: TextStyle(
              color: AppColors.gradientBlue,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
