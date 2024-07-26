import 'package:flutter/material.dart';
import '../../../../utils/extensions/sizedbox_extension.dart';
import '../../../../utils/constants/app_strings.dart';
import 'counter.dart';
import 'inputs_view.dart';

class MidView extends StatelessWidget {
const MidView({ super.key });

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        const Text(AppStrings.sendCodeTxt),
        20.h,
        const OtpCodeView(),
        20.h,
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.resendCodeTxt,
            ),
            Counter(),
          ],
        ),
      ],
    );
  }
}