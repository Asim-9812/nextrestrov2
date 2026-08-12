import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../domain/notification_model.dart';

class NotificationTile extends StatelessWidget {
  final NotificationModel notification;

  const NotificationTile({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FA),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildIcon(),
          AppSizes.gapW16,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        notification.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      notification.time,
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  notification.description,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 11.5,
                    height: 1.5,
                  ),
                ),
                if (notification.actionText != null) ...[
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: notification.onAction,
                    child: Text(
                      notification.actionText!,
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w900,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    Color bgColor;
    IconData iconData;
    Color iconColor;

    switch (notification.type) {
      case NotificationType.order:
        bgColor = const Color(0xFFEDE7FF);
        iconData = Icons.inventory_2;
        iconColor = AppColors.primary;
        break;
      case NotificationType.offer:
        bgColor = const Color(0xFFD6F6E1);
        iconData = Icons.percent;
        iconColor = const Color(0xFF27AE60);
        break;
      case NotificationType.update:
        bgColor = const Color(0xFFFFECEB);
        iconData = Icons.notifications_none;
        iconColor = const Color(0xFFEB5757);
        break;
      case NotificationType.community:
        bgColor = const Color(0xFFFFE5D9);
        iconData = Icons.star;
        iconColor = const Color(0xFFF2994A);
        break;
    }

    // Dynamic icon for delivered orders to match screenshot
    if (notification.title.toLowerCase().contains('delivered')) {
       iconData = Icons.local_shipping;
       bgColor = const Color(0xFFE8E1FF);
    }

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
      ),
      child: Icon(iconData, color: iconColor, size: 20),
    );
  }
}
