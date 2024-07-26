part of 'story_cubit.dart';

@immutable
sealed class StoryState {}

final class StoryInitial extends StoryState {}

final class StoryLoading extends StoryState {}

final class StorySuccess extends StoryState {}

final class StoryFailure extends StoryState {}
