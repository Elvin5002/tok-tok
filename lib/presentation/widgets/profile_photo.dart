import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants/app_assets.dart';
import '../../utils/constants/app_colors.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({
    super.key,
    this.showEdit = false,
    this.radius = 60,
    this.url,
    this.onTap,
  });

  final bool showEdit;
  final double radius;
  final String? url;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
            radius: radius.r,
            backgroundColor: AppColors.primary200,
            foregroundImage: url != null
                ? NetworkImage(url!)
                : const AssetImage(
                    AppAssets.defaultAvatar,
                  ) as ImageProvider,
          ),
        ),
        if (showEdit)
          Positioned(
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: onTap,
              child: Image.asset(
                AppAssets.editIcon,
                height: 24,
                width: 24,
              ),
            ),
          ),
      ],
    );
  }
}
