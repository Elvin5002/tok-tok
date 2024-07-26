import 'package:get_it/get_it.dart';

import 'cubits/create_account/create_account_cubit.dart';
import 'cubits/home/home_cubit.dart';
import 'cubits/story/story_cubit.dart';
import 'data/contracts/firebase_auth_contract.dart';
import 'data/contracts/firebase_notification_contract.dart';
import 'data/contracts/firebase_story_contract.dart';
import 'data/contracts/firebase_user_contract.dart';
import 'data/repositories/firebase_auth_repository.dart';
import 'data/repositories/firebase_notification_repository.dart';
import 'data/repositories/firebase_story_repository.dart';
import 'data/repositories/firebase_user_repository.dart';
import 'data/services/firebase/firebase_auth_service.dart';
import 'data/services/firebase/firebase_notification_service.dart';
import 'data/services/firebase/firebase_story_service.dart';
import 'data/services/firebase/firebase_user_service.dart';

final locator = GetIt.I;

void setupLocator() {
  // Services
  locator.registerLazySingleton(() => FirebaseAuthService());
  locator.registerLazySingleton<FirebaseAuthContract>(
      () => FirebaseAuthRepository(locator()));

  locator.registerLazySingleton(() => FirebaseUserService());
  locator.registerLazySingleton<FirebaseUserContract>(
      () => FirebaseUserRepository(locator()));

  locator.registerLazySingleton(() => FirebaseStoryService());
  locator.registerLazySingleton<FirebaseStoryContract>(
      () => FirebaseStoryRepository(locator()));

  locator.registerLazySingleton(() => FirebaseNotificationService());
  locator.registerLazySingleton<FirebaseNotificationContract>(
      () => FirebaseNotificationRepository(locator()));

  // Cubits
  locator.registerFactory(() => CreateAccountCubit(locator(), locator()));
  locator.registerFactory(() => HomeCubit(locator()));
  locator.registerFactory(() => StoryCubit(locator()));
}
