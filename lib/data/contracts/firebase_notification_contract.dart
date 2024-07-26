import '../models/remote/request/notification_request.dart';

abstract class FirebaseNotificationContract {
  Future<bool> sendNotification(NotificationRequest notificationRequest);
}
