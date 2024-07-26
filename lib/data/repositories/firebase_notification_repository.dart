import '../contracts/firebase_notification_contract.dart';
import '../models/remote/request/notification_request.dart';
import '../services/firebase/firebase_notification_service.dart';

class FirebaseNotificationRepository implements FirebaseNotificationContract {
  const FirebaseNotificationRepository(this._firebaseNotificationService);

  final FirebaseNotificationService _firebaseNotificationService;

  @override
  Future<bool> sendNotification(NotificationRequest notificationRequest) =>
      _firebaseNotificationService.sendNotification(notificationRequest);
}
