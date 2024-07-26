import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirebaseStoryContract {
  Stream<DocumentSnapshot<Map<String, dynamic>>> getCurrentUserStory();
  Stream<QuerySnapshot<Map<String, dynamic>>> getAllUsersStories();
  Future<QuerySnapshot<Map<String, dynamic>>> getAnyUserStory(String userId);
}
