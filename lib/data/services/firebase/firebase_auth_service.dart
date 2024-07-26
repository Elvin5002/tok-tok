import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseAuthService {
  Future<User> register(String email, String password) async {
    final userCredentials =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return userCredentials.user!;
  }

  Future<User> login(String email, String password) async {
    final userCredentials =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final deviceToken = await FirebaseMessaging.instance.getToken();
    log('DEVICE TOKEN: $deviceToken');
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userCredentials.user!.uid)
        .set(
      {
        'deviceToken': deviceToken,
      },
      SetOptions(merge: true),
    );

    return userCredentials.user!;
  }

  Stream<User?> checkUser() => FirebaseAuth.instance.authStateChanges();
}
