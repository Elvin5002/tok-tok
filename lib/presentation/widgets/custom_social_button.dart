import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tok_tok/utils/extensions/context_extensions.dart';

import '../../utils/constants/app_colors.dart';

class CustomSocialButton extends StatelessWidget {
  const CustomSocialButton({
    super.key,
    required this.onTap,
    required this.icon,
  }) : text = null;

  const CustomSocialButton.text({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
  });

  final void Function() onTap;
  final Widget icon;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Material(
        color: AppColors.white,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(width: 1.w, color: AppColors.grey200)),
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            height: 60.h,
            width: context.fullWidth,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon,
                  if (text != null)
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          text!,
                          maxLines: 1,
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: AppColors.grey900,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            height: 1.4.h,
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
