import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_state.dart';
import '../../../order/presentation/pages/order_details_page.dart';
import '../../../order/presentation/bloc/order_bloc.dart';
import '../bloc/notification_bloc.dart';
import '../bloc/notification_event.dart';
import '../bloc/notification_state.dart';
import '../widgets/notification_tile.dart';
import '../../domain/entities/notification_entity.dart';
import '../../../../injection_container.dart' as di;

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
    _refreshNotifications();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _refreshNotifications() {
    final authState = context.read<AuthBloc>().state;
    int? userId;
    if (authState is Authenticated) {
      userId = authState.user.userId;
    } else if (authState is ProfileLoaded) {
      userId = authState.user.userId;
    }

    if (userId != null) {
      context.read<NotificationBloc>().add(GetNotificationsEvent(userId));
    }
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
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, authState) {
              int? userId;
              if (authState is Authenticated) userId = authState.user.userId;
              if (authState is ProfileLoaded) userId = authState.user.userId;

              return TextButton(
                onPressed: userId == null ? null : () {
                  context.read<NotificationBloc>().add(MarkAllReadEvent(userId!));
                },
                child: const Text(
                  'Mark all as read',
                  style: TextStyle(color: AppColors.primary, fontSize: 12, fontWeight: FontWeight.bold),
                ),
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          _buildCustomTabBar(),
          Expanded(
            child: BlocBuilder<NotificationBloc, NotificationState>(
              builder: (context, state) {
                if (state is NotificationLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is NotificationLoaded) {
                  var notifications = state.notifications;
                  
                  // Filter based on selected tab
                  if (_tabController.index == 1) {
                    notifications = notifications.where((n) => !n.isRead).toList();
                  }

                  if (notifications.isEmpty) {
                    return _buildEmptyState();
                  }

                  final grouped = _groupNotifications(notifications);
                  final keys = grouped.keys.toList();

                  return RefreshIndicator(
                    onRefresh: () async {
                      _refreshNotifications();
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
                                final authState = context.read<AuthBloc>().state;
                                int? userId;
                                if (authState is Authenticated) userId = authState.user.userId;
                                if (authState is ProfileLoaded) userId = authState.user.userId;

                                if (!n.isRead && userId != null) {
                                  context.read<NotificationBloc>().add(MarkAsReadEvent(
                                    userId: userId,
                                    notificationId: n.notificationId,
                                  ));
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
          ),
        ],
      ),
    );
  }

  Widget _buildCustomTabBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 45,
      decoration: BoxDecoration(
        color: AppColors.primaryLightest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.primary,
        ),
        dividerColor: Colors.transparent,
        labelColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.tab,
        unselectedLabelColor: AppColors.primary,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
        tabs: const [
          Tab(text: 'All'),
          Tab(text: 'Unread'),
        ],
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
          const Text(
            'No notifications yet',
            style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
