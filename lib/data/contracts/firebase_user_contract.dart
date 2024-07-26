import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseUserContract {
  Future<void> addUser(
    User user,
    String? username,
    String? about,
    String? phone,
    String? birthday,
  );

  Future<void> getUser(String uid);

  Future<void> getAllUsers();
}
