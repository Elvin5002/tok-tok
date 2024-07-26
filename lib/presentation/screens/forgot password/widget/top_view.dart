import 'package:flutter/material.dart';
import 'package:tok_tok/utils/constants/app_assets.dart';
import 'package:tok_tok/utils/constants/app_paddings.dart';
import 'package:tok_tok/utils/constants/app_strings.dart';
import 'package:tok_tok/utils/extensions/sizedbox_extension.dart';

class TopView extends StatelessWidget {
const TopView({ super.key });

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Padding(
          padding: AppPaddings.a24,
          child: Center(
            child: SizedBox(
              width: 250,
              height: 170,
              child: Image.asset(AppAssets.frame),
            ),
          ),
        ),
        20.h,
        const Text(AppStrings.resetTxt),
      ],
    );
  }
}