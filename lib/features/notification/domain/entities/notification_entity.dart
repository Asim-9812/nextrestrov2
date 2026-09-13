import 'package:equatable/equatable.dart';

class NotificationEntity extends Equatable {
  final int notificationId;
  final int userId;
  final int notificationType;
  final String title;
  final String message;
  final int? referenceId;
  final bool isRead;
  final DateTime createdDate;
  final DateTime? readDate;

  const NotificationEntity({
    required this.notificationId,
    required this.userId,
    required this.notificationType,
    required this.title,
    required this.message,
    this.referenceId,
    required this.isRead,
    required this.createdDate,
    this.readDate,
  });

  @override
  List<Object?> get props => [
        notificationId,
        userId,
        notificationType,
        title,
        message,
        referenceId,
        isRead,
        createdDate,
        readDate,
      ];
}
