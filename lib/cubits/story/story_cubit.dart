import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_view/story_view.dart';

import '../../data/contracts/firebase_story_contract.dart';

part 'story_state.dart';

class StoryCubit extends Cubit<StoryState> {
  StoryCubit(this._firebaseStoryContract) : super(StoryInitial()) {
    replyFocusNode.addListener(() {
      controller.pause();
    });
  }

  final FirebaseStoryContract _firebaseStoryContract;

  List<QueryDocumentSnapshot<Map<String, dynamic>>>? allStories;

  late final controller = StoryController();
  late final replyController = TextEditingController();
  late final pageController = PageController();

  final replyFocusNode = FocusNode();

  void getAnyUserStory(String userId) async {
    try {
      emit(StoryLoading());
      final storyDoc = await _firebaseStoryContract.getAnyUserStory(userId);
      allStories = storyDoc.docs;
      emit(StorySuccess());
    } catch (e, s) {
      log('Error: $e');
      log('StackTrace: $s');
      emit(StoryFailure());
    }
  }

  void reply() {
    replyController.clear();
    replyController.text = '';
    controller.play();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllUsersStories(story) =>
      FirebaseFirestore.instance
          .collection('statuses')
          .startAtDocument(story)
          .snapshots();

  @override
  Future<void> close() {
    controller.dispose();
    pageController.dispose();
    return super.close();
  }
}
