import 'package:firebase_auth/firebase_auth.dart';

extension StringExtensions on String {
  String get chatDocId {
    final currentUid = FirebaseAuth.instance.currentUser!.uid;
    if (hashCode >= currentUid.hashCode) {
      return '${this}_$currentUid';
    }
    return '${currentUid}_$this';
  }

  bool get isMe => FirebaseAuth.instance.currentUser!.uid == this;
}
