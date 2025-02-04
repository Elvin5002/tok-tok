import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthContract {
  Stream<User?> checkUser();
  Future<User> register(String email, String password);
  Future<User> login(String email, String password);
  Future<bool> logout();
}
