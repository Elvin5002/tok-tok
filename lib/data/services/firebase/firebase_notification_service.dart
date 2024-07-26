import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:tok_tok/data/models/remote/request/notification_request.dart';
import '../../../utils/constants/firebase_constants.dart';

class FirebaseNotificationService {
  Future<String> getAccessToken() async {
    final scopes = [
      'https://www.googleapis.com/auth/userinfo.email',
      'https://www.googleapis.com/auth/firebase.database',
      'https://www.googleapis.com/auth/firebase.messaging',
    ];

    http.Client client = await auth.clientViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(FirebaseConstants.json),
      scopes,
    );

    auth.AccessCredentials accessCredentials =
        await auth.obtainAccessCredentialsViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(FirebaseConstants.json),
      scopes,
      client,
    );

    client.close();

    return accessCredentials.accessToken.data;
  }

  Future<bool> sendNotification(NotificationRequest notificationRequest) async {
    try {
      final accessToken = await getAccessToken();
      final url = Uri.parse(
          'https://fcm.googleapis.com/v1/projects/${FirebaseConstants.projectId}/messages:send');

      final header = {
        'Authorization': 'Bearer $accessToken',
      };

      log('Request BODY: ${notificationRequest.toJson()}');

      final response = await http.post(
        url,
        headers: header,
        body: jsonEncode(notificationRequest.toJson()),
      );

      return response.statusCode == 200;
    } catch (e, s) {
      log('Error fcm: $e');
      log('Error fcm StackTrace: $s');
      return false;
    }
  }
}
