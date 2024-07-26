import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../cubits/home/home_cubit.dart';
import '../../../../utils/constants/app_assets.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_strings.dart';
import '../../../../utils/extensions/navigation_extension.dart';
import '../../../../utils/helpers/pager.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    return SliverAppBar(
      backgroundColor: AppColors.white,
      surfaceTintColor: Colors.transparent,
      snap: true,
      floating: true,
      leading: Padding(
        padding: EdgeInsets.only(left: 24.w, top: 8.h, bottom: 8.h),
        child: SvgPicture.asset(AppAssets.logo),
      ),
      title: Text(
        AppStrings.appName,
        style: TextStyle(
            fontWeight: FontWeight.w700, fontSize: 24.sp, height: 1.2.h),
      ),
      actions: [
        IconButton(
          onPressed: () => context.to(Pager.users),
          icon: SvgPicture.asset(AppAssets.users),
        ),
        IconButton(
          onPressed: () async {
            await homeCubit.updateUserStatus(false);
            await FirebaseAuth.instance.signOut().then(
                  (_) => context.removeAll(Pager.loginAccount),
                );
          },
          icon: SvgPicture.asset(AppAssets.heart),
        ),
        IconButton(
          onPressed: () => context.to(Pager.chatHistory),
          icon: SvgPicture.asset(AppAssets.chat),
        ),
      ],
    );
  }
}
