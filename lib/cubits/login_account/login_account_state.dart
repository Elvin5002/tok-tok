part of 'login_account_cubit.dart';

@immutable
sealed class LoginAccountState {}

final class LoginAccountInitial extends LoginAccountState {}

final class LoginAccountLoading extends LoginAccountState {}

final class LoginAccountSuccess extends LoginAccountState {}

final class LoginAccountError extends LoginAccountState {
  LoginAccountError(this.errorMessage);

  final String errorMessage;
}