class NotificationRequest {
  final Message message;

  NotificationRequest({
    required this.message,
  });

  factory NotificationRequest.fromJson(Map<String, dynamic> json) =>
      NotificationRequest(
        message: Message.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
      };
}

class Message {
  final String token;
  final Notification notification;
  final Data data;

  Message({
    required this.token,
    required this.notification,
    required this.data,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        token: json["token"],
        notification: Notification.fromJson(json["notification"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "notification": notification.toJson(),
        "data": data.toJson(),
      };
}

class Data {
  final String senderId;
  final String senderToken;

  Data({
    required this.senderId,
    required this.senderToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        senderId: json["senderId"],
        senderToken: json["senderToken"],
      );

  Map<String, dynamic> toJson() => {
        "senderId": senderId,
        "senderToken": senderToken,
      };
}

class Notification {
  final String title;
  final String body;

  Notification({
    required this.title,
    required this.body,
  });

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "body": body,
      };
}
