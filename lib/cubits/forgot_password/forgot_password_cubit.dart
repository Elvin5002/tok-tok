import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordInitial());

  BehaviorSubject<bool> isVisible = BehaviorSubject<bool>.seeded(false);
  BehaviorSubject<bool> isClicked = BehaviorSubject<bool>.seeded(false);
  BehaviorSubject<bool> checkValue = BehaviorSubject<bool>.seeded(false);
  BehaviorSubject<int> changeColor = BehaviorSubject<int>.seeded(0);

  @override
  Future<void> close() {
    isVisible.close();
    isClicked.close();
    checkValue.close();
    changeColor.close();
    return super.close();
  }
}
