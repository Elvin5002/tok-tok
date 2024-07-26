import 'package:flutter/material.dart';
import '../../widgets/custom_appbar.dart';
import 'widget/bottom_view.dart';
import '../../../utils/constants/app_strings.dart';
import '../../../utils/extensions/sizedbox_extension.dart';
import 'widget/top_view.dart';
import '../../../utils/constants/app_paddings.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppPaddings.a24,
        child: Column(
          children: [
            const CustomAppbar(title: AppStrings.forgotTxt),
            10.h,
            const TopView(),
            20.h,
            const BottomView(),
          ],
        ),
      ),
    );
  }
}
