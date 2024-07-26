import 'package:flutter/material.dart';
import 'package:tok_tok/utils/constants/app_assets.dart';
import 'package:tok_tok/utils/constants/app_paddings.dart';

class ImageView extends StatelessWidget {
const ImageView({ super.key });

  @override
  Widget build(BuildContext context){
    return Padding(
          padding: AppPaddings.a24,
          child: Center(
            child: SizedBox(
              width: 250,
              height: 200,
              child: Image.asset(AppAssets.newPass),
            ),
          ),
    );
  }
}