import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:tok_tok/utils/constants/app_assets.dart';
import 'package:tok_tok/utils/extensions/navigation_extension.dart';
import 'package:tok_tok/utils/helpers/pager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 3000))
        .whenComplete(() => context.replace(Pager.auth));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Center(child: SvgPicture.asset(AppAssets.splashImage)),
            80.verticalSpace,
            Lottie.asset(
              AppAssets.loadingAnim,
              height: 150.h,
              width: 150.w,
            ),
          ],
        ),
      ),
    );
  }
}
