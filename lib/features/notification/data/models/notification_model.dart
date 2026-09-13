import '../../domain/entities/notification_entity.dart';

class NotificationModel extends NotificationEntity {
  const NotificationModel({
    required super.notificationId,
    required super.userId,
    required super.notificationType,
    required super.title,
    required super.message,
    super.referenceId,
    required super.isRead,
    required super.createdDate,
    super.readDate,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      notificationId: json['notificationId'] ?? 0,
      userId: json['userId'] ?? 0,
      notificationType: json['notificationType'] ?? 0,
      title: json['title'] ?? '',
      message: json['message'] ?? '',
      referenceId: json['referenceId'],
      isRead: json['isRead'] ?? false,
      createdDate: json['createdDate'] != null 
          ? DateTime.parse(json['createdDate']) 
          : DateTime.now(),
      readDate: json['readDate'] != null 
          ? DateTime.parse(json['readDate']) 
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'notificationId': notificationId,
      'userId': userId,
      'notificationType': notificationType,
      'title': title,
      'message': message,
      'referenceId': referenceId,
      'isRead': isRead,
      'createdDate': createdDate.toIso8601String(),
      'readDate': readDate?.toIso8601String(),
    };
  }
}
