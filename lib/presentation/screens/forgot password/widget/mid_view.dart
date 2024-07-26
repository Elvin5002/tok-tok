import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tok_tok/utils/constants/app_paddings.dart';
import '../../../../utils/constants/app_radiuses.dart';
import '../../../../utils/extensions/context_extensions.dart';
import '../../../../utils/extensions/sizedbox_extension.dart';

class MidView extends StatelessWidget {
const MidView({ super.key, required this.color, required this.image, required this.title, required this.text, this.onTap });

  final Color color;
  final String image;
  final String title;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.fullWidth,
        height: 115,
        decoration: BoxDecoration(
          borderRadius: AppRadiuses.a20,
          border: Border.all(color: color)
        ),
        child: Padding(
          padding: AppPaddings.a24,
          child: Row(
            children: [
              SvgPicture.asset(image),
              10.w,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  7.h,
                  Text(text, style: const TextStyle(fontWeight: FontWeight.bold),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}