import 'package:flutter/material.dart';

enum NotificationType { order, offer, update, community }

class NotificationModel {
  final String id;
  final String title;
  final String description;
  final String time;
  final NotificationType type;
  final String? actionText;
  final VoidCallback? onAction;

  NotificationModel({
    required this.id,
    required this.title,
    required this.description,
    required this.time,
    required this.type,
    this.actionText,
    this.onAction,
  });
}
