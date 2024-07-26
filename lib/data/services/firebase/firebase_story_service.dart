import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseStoryService {
  Stream<DocumentSnapshot<Map<String, dynamic>>> getCurrentUserStory() =>
      FirebaseFirestore.instance
          .collection('statuses')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .snapshots();

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllUsersStories() =>
      FirebaseFirestore.instance
          .collection('statuses')
          .where('uid', isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots();

  Future<QuerySnapshot<Map<String, dynamic>>> getAnyUserStory(String userId) =>
      FirebaseFirestore.instance
          .collection('statuses')
          .doc(userId)
          .collection('statuses')
          .get();
}
