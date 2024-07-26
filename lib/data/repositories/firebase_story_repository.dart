import 'package:cloud_firestore/cloud_firestore.dart';

import '../contracts/firebase_story_contract.dart';
import '../services/firebase/firebase_story_service.dart';

class FirebaseStoryRepository implements FirebaseStoryContract {
  const FirebaseStoryRepository(this._firebaseStoryService);

  final FirebaseStoryService _firebaseStoryService;

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getAllUsersStories() =>
      _firebaseStoryService.getAllUsersStories();

  @override
  Stream<DocumentSnapshot<Map<String, dynamic>>> getCurrentUserStory() =>
      _firebaseStoryService.getCurrentUserStory();

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getAnyUserStory(String userId) =>
      _firebaseStoryService.getAnyUserStory(userId);
}
