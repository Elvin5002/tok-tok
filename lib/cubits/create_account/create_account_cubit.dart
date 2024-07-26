import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../data/contracts/firebase_auth_contract.dart';
import '../../data/contracts/firebase_user_contract.dart';

part 'create_account_state.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  CreateAccountCubit(
    this._firebaseAuthContract,
    this._firebaseUserContract,
  ) : super(CreateAccountInitial());

  final FirebaseAuthContract _firebaseAuthContract;
  final FirebaseUserContract _firebaseUserContract;

  BehaviorSubject<bool> isVisible = BehaviorSubject<bool>.seeded(false);
  BehaviorSubject<bool> isClicked = BehaviorSubject<bool>.seeded(false);
  BehaviorSubject<bool> checkValue = BehaviorSubject<bool>.seeded(false);
  BehaviorSubject<int> changeColor = BehaviorSubject<int>.seeded(0);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void register() async {
    try {
      emit(CreateAccountLoading());
      final user = await _firebaseAuthContract.register(
        emailController.text,
        passwordController.text,
      );
      await _firebaseUserContract.addUser(user, null, null, null, null);
      emit(CreateAccountSuccess());
    } on FirebaseAuthException catch (e) {
      emit(CreateAccountError(e.message ?? 'Undefined error'));
    } catch (e, s) {
      log('Error: $e');
      log('Error: $s');
      emit(CreateAccountError('$e'));
    }
  }

  @override
  Future<void> close() {
    isVisible.close();
    isClicked.close();
    checkValue.close();
    changeColor.close();
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
