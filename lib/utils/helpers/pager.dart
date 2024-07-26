import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/chat/chat_cubit.dart';
import '../../cubits/create_account/create_account_cubit.dart';
import '../../cubits/fill/user_info_cubit.dart';
import '../../cubits/forgot_password/forgot_password_cubit.dart';
import '../../cubits/home/home_cubit.dart';
import '../../cubits/login_account/login_account_cubit.dart';
import '../../cubits/onboard/onboard_cubit.dart';
import '../../cubits/story/story_cubit.dart';
import '../../locator.dart';
import '../../presentation/screens/account_details/account_details.dart';
import '../../presentation/screens/auth/auth_page.dart';
import '../../presentation/screens/chat/chat_page.dart';
import '../../presentation/screens/chat_history/chat_history_page.dart';
import '../../presentation/screens/create%20account/create_account_screen.dart';
import '../../presentation/screens/create%20password/create_password_screen.dart';
import '../../presentation/screens/fill_profile/fill_profile.dart';
import '../../presentation/screens/forgot%20password/forgot_password_screen.dart';
import '../../presentation/screens/home/home_screen.dart';
import '../../presentation/screens/login%20account/login_account_screen.dart';
import '../../presentation/screens/onboard/onboard_screen.dart';
import '../../presentation/screens/splash/splash_screen.dart';
import '../../presentation/screens/story_screen/story_screen.dart';
import '../../presentation/screens/users/users_page.dart';
import '../../presentation/screens/verification/verification_screen.dart';
import '../../presentation/screens/welcome/welcome_screen.dart';

class Pager {
  Pager._();

  static Widget get splash => const SplashScreen();

  static Widget get accountDetails => const AccountDetails();

  static Widget get onboard => BlocProvider(
        create: (context) => OnboardCubit(),
        child: const OnboardScreen(),
      );

  static Widget get welcome => const WelcomeScreen();

  static Widget get forgotPassword => BlocProvider(
        create: (context) => ForgotPasswordCubit(),
        child: const ForgotPasswordScreen(),
      );

  static Widget get verification => BlocProvider(
        create: (context) => ForgotPasswordCubit(),
        child: const VerificationScreen(),
      );

  static Widget get createPassword => BlocProvider(
        create: (context) => ForgotPasswordCubit(),
        child: const CreatePasswordScreen(),
      );
  static Widget get fillProfile => BlocProvider(
        create: (context) => UserInfoCubit(locator())..getEmail(),
        child: const FillProfile(),
      );

  static Widget get createAccount => BlocProvider<CreateAccountCubit>(
        create: (_) => locator(),
        child: const CreateAccountScreen(),
      );

  static Widget get loginAccount => BlocProvider(
        create: (context) => LoginAccountCubit(locator(), locator()),
        child: const LoginAccountScreen(),
      );

  static Widget get auth => const AuthPage();

  static Widget get home => BlocProvider<HomeCubit>(
        create: (_) => locator()..updateUserStatus(true),
        child: const HomeScreen(),
      );

  static Widget story(story) => BlocProvider<StoryCubit>(
        create: (context) => locator(),
        child: StoryScreen(story: story),
      );

  static Widget get users => const UsersPage();

  static Widget chat(Map<String, dynamic> user) => BlocProvider(
        create: (_) => ChatCubit(user, locator()),
        child: const ChatPage(),
      );

  static Widget get chatHistory => const ChatHistoryPage();
}
