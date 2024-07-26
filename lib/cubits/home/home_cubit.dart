import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/contracts/firebase_story_contract.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._firebaseStoryContract) : super(HomeInitial());

  final FirebaseStoryContract _firebaseStoryContract;

  String get currentUserId => FirebaseAuth.instance.currentUser!.uid;

  Stream<DocumentSnapshot<Map<String, dynamic>>> getCurrentUserStory() =>
      _firebaseStoryContract.getCurrentUserStory();

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllUsersStories() =>
      _firebaseStoryContract.getAllUsersStories();

  Future<void> updateUserStatus(bool isOnline) async {
    await FirebaseFirestore.instance.collection('users').doc(currentUserId).set(
      {
        'isOnline': isOnline,
        'lastSeenTime': Timestamp.now(),
      },
      SetOptions(merge: true),
    );
  }
}
