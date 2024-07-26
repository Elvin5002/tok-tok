import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tok_tok/presentation/screens/onboard/widgets/onboard_buttons_view.dart';
import 'package:tok_tok/presentation/screens/onboard/widgets/onboard_page_view.dart';

import '../../../utils/constants/app_colors.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          const OnboardPageView(),
          40.verticalSpace,
          const OnboardButtonsView(),
          40.verticalSpace
        ],
      ),
    );
  }
}
