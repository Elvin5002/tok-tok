import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

extension StringExtensions on Timestamp {
  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(toDate());
    return timeago.format(now.subtract(difference));
  }

  String get lastSeenTime {
    final now = DateTime.now();
    final difference = now.difference(toDate());
    if (difference.inHours < 24) {
      return DateFormat('HH:mm').format(toDate());
    }
    return timeago.format(now.subtract(difference));
  }

  String get hM {
    final date = toDate();
    return '${date.hour}:${date.minute}';
  }
}
