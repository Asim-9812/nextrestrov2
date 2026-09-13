import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../order/presentation/pages/my_orders_page.dart';
import '../../../profile/presentation/pages/settings_page.dart';
import '../../domain/notification_model.dart';
import '../widgets/notification_tile.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../order/presentation/pages/order_details_page.dart';
import '../../../order/presentation/bloc/order_bloc.dart';
import '../../../profile/presentation/pages/settings_page.dart';
import '../bloc/notification_bloc.dart';
import '../bloc/notification_event.dart';
import '../bloc/notification_state.dart';
import '../widgets/notification_tile.dart';
import '../../domain/entities/notification_entity.dart';
import 'package:intl/intl.dart';
import '../../../../injection_container.dart' as di;

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  @override
  void initState() {
    super.initState();
    context.read<NotificationBloc>().add(GetNotificationsEvent());
  }

  Map<String, List<NotificationEntity>> _groupNotifications(List<NotificationEntity> notifications) {
    final Map<String, List<NotificationEntity>> groups = {};
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    for (var notification in notifications) {
      final date = DateTime(notification.createdDate.year, notification.createdDate.month, notification.createdDate.day);
      String key;
      if (date == today) {
        key = 'Today';
      } else if (date == yesterday) {
        key = 'Yesterday';
      } else {
        key = DateFormat('MMM dd, yyyy').format(date);
      }

      if (!groups.containsKey(key)) {
        groups[key] = [];
      }
      groups[key]!.add(notification);
    }
    return groups;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Notifications',
          style: AppTextStyles.h2.copyWith(
            color: AppColors.primary, 
            fontWeight: FontWeight.w900,
            fontSize: 18,
          ),
        ),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: () {
              context.read<NotificationBloc>().add(MarkAllReadEvent());
            },
            child: const Text(
              'Mark all as read',
              style: TextStyle(color: AppColors.primary, fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
          if (state is NotificationLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is NotificationLoaded) {
            if (state.notifications.isEmpty) {
              return _buildEmptyState();
            }

            final grouped = _groupNotifications(state.notifications);
            final keys = grouped.keys.toList();

            return RefreshIndicator(
              onRefresh: () async {
                context.read<NotificationBloc>().add(GetNotificationsEvent());
              },
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: keys.length,
                itemBuilder: (context, index) {
                  final groupKey = keys[index];
                  final groupNotifications = grouped[groupKey]!;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 10),
                        child: Text(
                          groupKey,
                          style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
                        ),
                      ),
                      ...groupNotifications.map((n) => NotificationTile(
                        notification: n,
                        onTap: () {
                          if (!n.isRead) {
                            context.read<NotificationBloc>().add(MarkAsReadEvent(n.notificationId));
                          }
                          
                          if (n.referenceId != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (context) => di.sl<OrderBloc>(),
                                  child: OrderDetailsPage(orderId: n.referenceId!),
                                ),
                              ),
                            );
                          }
                        },
                      )),
                    ],
                  );
                },
              ),
            );
          }

          if (state is NotificationError) {
            return Center(child: Text(state.message));
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.notifications_off_outlined, size: 80, color: Colors.grey.shade300),
          AppSizes.gapH16,
          Text(
            'No notifications yet',
            style: TextStyle(color: Colors.grey.shade400, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.notifications_off_outlined, size: 80, color: Colors.grey.shade300),
          AppSizes.gapH16,
          Text(
            'No notifications yet',
            style: TextStyle(color: Colors.grey.shade400, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
