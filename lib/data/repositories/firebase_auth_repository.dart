import 'package:firebase_auth/firebase_auth.dart';
import 'package:tok_tok/data/contracts/firebase_auth_contract.dart';

import '../services/firebase/firebase_auth_service.dart';

class FirebaseAuthRepository implements FirebaseAuthContract {
  const FirebaseAuthRepository(this._firebaseAuthService);

  final FirebaseAuthService _firebaseAuthService;

  @override
  Future<User> login(String email, String password) async =>
      _firebaseAuthService.login(email, password);

  @override
  Future<User> register(String email, String password) =>
      _firebaseAuthService.register(email, password);

  @override
  Future<bool> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Stream<User?> checkUser() => _firebaseAuthService.checkUser();
}
