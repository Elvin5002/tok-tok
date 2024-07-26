import 'package:firebase_auth/firebase_auth.dart';

import '../contracts/firebase_user_contract.dart';
import '../services/firebase/firebase_user_service.dart';

class FirebaseUserRepository implements FirebaseUserContract {
  const FirebaseUserRepository(this._firebaseUserService);

  final FirebaseUserService _firebaseUserService;

  @override
  Future<void> addUser(
    User user,
    String? username,
    String? about,
    String? phone,
    String? birthday,
  ) =>
      _firebaseUserService.addUser(
        user,
        username,
        about,
        phone,
        birthday,
      );

  @override
  Future<void> getAllUsers() {
    // TODO: implement getAllUsers
    throw UnimplementedError();
  }

  @override
  Future<void> getUser(String uid) {
    // TODO: implement getUser
    throw UnimplementedError();
  }
}
