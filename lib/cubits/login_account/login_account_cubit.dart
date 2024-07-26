import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tok_tok/data/contracts/firebase_auth_contract.dart';
import 'package:tok_tok/data/contracts/firebase_user_contract.dart';

part 'login_account_state.dart';

class LoginAccountCubit extends Cubit<LoginAccountState> {
  LoginAccountCubit(this._firebaseUserContract, this._firebaseAuthContract)
      : super(LoginAccountInitial());
  final FirebaseAuthContract _firebaseUserContract;
  final FirebaseUserContract _firebaseAuthContract;

  BehaviorSubject<bool> isVisible = BehaviorSubject<bool>.seeded(false);
  BehaviorSubject<bool> isClicked = BehaviorSubject<bool>.seeded(false);
  BehaviorSubject<bool> checkValue = BehaviorSubject<bool>.seeded(false);
  BehaviorSubject<int> changeColor = BehaviorSubject<int>.seeded(0);
  final email = TextEditingController();
  final password = TextEditingController();
  late User userCredentials;

  Future<void> login() async {
    emit(LoginAccountLoading());
    try {
      await _firebaseUserContract.login(email.text, password.text);
      emit(LoginAccountSuccess());
      print("success");
    } catch (e) {
      emit(LoginAccountError("Error occured"));
    }
  }

 

  @override
  Future<void> close() {
    return super.close();
  }
}
