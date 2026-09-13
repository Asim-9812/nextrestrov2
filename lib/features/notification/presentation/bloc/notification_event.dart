import 'package:equatable/equatable.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object?> get props => [];
}

class GetNotificationsEvent extends NotificationEvent {
  final int userId;
  const GetNotificationsEvent(this.userId);

  @override
  List<Object?> get props => [userId];
}

class GetUnreadCountEvent extends NotificationEvent {
  final int userId;
  const GetUnreadCountEvent(this.userId);

  @override
  List<Object?> get props => [userId];
}

class MarkAsReadEvent extends NotificationEvent {
  final int userId;
  final int notificationId;
  const MarkAsReadEvent({required this.userId, required this.notificationId});

  @override
  List<Object?> get props => [userId, notificationId];
}

class MarkAllReadEvent extends NotificationEvent {
  final int userId;
  const MarkAllReadEvent(this.userId);

  @override
  List<Object?> get props => [userId];
}
