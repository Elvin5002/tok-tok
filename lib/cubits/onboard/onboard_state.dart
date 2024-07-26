part of 'onboard_cubit.dart';

@immutable
sealed class OnboardState {}

final class OnboardInitial extends OnboardState {}

final class OnboardPageUpdated extends OnboardState {
  OnboardPageUpdated({required this.lastPage});

  final bool lastPage;
}
