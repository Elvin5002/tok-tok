import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tok_tok/utils/extensions/navigation_extension.dart';
import 'package:tok_tok/utils/helpers/pager.dart';

import '../../../cubits/home/home_cubit.dart';
import '../../../utils/constants/app_colors.dart';
import 'widgets/feed_card/feeds_view.dart';
import 'widgets/home_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  late final HomeCubit _homeCubit;

  @override
  void initState() {
    _homeCubit = context.read<HomeCubit>();
    WidgetsBinding.instance.addObserver(this);
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

    _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // App killed
    FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message?.data}');

      if (message?.notification != null) {
        print(
            'Message also contained a notification: ${message!.notification}');
        context.to(Pager.chatHistory);
        context.to(Pager.chat({
          "userId": message.data["senderId"],
          "deviceToken": message.data["senderToken"],
        }));
      }
    });

    // App resumed
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? message) {
      print('Opened Message data: ${message?.data}');

      if (message?.notification != null) {
        print(
            'Opened Message also contained a notification: ${message?.notification}');
        context.to(Pager.chatHistory);
        context.to(Pager.chat({
          "userId": message?.data["senderId"],
          "deviceToken": message?.data["senderToken"],
        }));
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future _firebaseMessagingBackgroundHandler(RemoteMessage? message) async {
    print("Handling a background message: ${message?.messageId}");
    print(message?.notification?.title);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        log('RESUMED');
        _homeCubit.updateUserStatus(true);
        break;
      default:
        log('INACTIVE');
        _homeCubit.updateUserStatus(false);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        slivers: [
          const HomeAppBar(),
          const FeedsView(),
          SliverToBoxAdapter(
            child: 30.verticalSpace,
          )
        ],
      ),
    );
  }
}
