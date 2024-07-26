import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/constants/app_assets.dart';
import '../../../utils/helpers/pager.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FirebaseAuth.instance.currentUser == null
        ? Pager.createAccount
        : FutureBuilder(
            future: FirebaseFirestore.instance
                .collection('users')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .get(),
            builder: (_, snapshot) {
              if (!snapshot.hasData) {
                return Scaffold(
                  body: Center(
                    child: Lottie.asset(
                      AppAssets.loadingAnim,
                      height: 150.h,
                      width: 150.w,
                    ),
                  ),
                );
              }
              final docExist = snapshot.data!.exists;
              return docExist ? Pager.home : Pager.createAccount;
            },
          );
  }
}
