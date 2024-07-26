import 'package:flutter/material.dart';
import '../../widgets/custom_appbar.dart';
import '../../../utils/extensions/navigation_extension.dart';
import '../../../utils/helpers/pager.dart';
import '../../widgets/custom_button.dart';
import 'widgets/mid_view.dart';
import '../../../utils/constants/app_paddings.dart';
import '../../../utils/constants/app_strings.dart';

class VerificationScreen extends StatelessWidget {
const VerificationScreen({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Padding(
        padding: AppPaddings.h30b30,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomAppbar(title: AppStrings.verificationTxt),
            const MidView(),
            CustomButton(
              text: AppStrings.verifyTxt,
              onPressed: () {
                context.to(Pager.createPassword);
              },
            )
          ],
        ),
      ),
    );
  }
}