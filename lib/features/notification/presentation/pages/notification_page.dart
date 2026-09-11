import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../order/presentation/pages/my_orders_page.dart';
import '../../../profile/presentation/pages/settings_page.dart';
import '../../domain/notification_model.dart';
import '../widgets/notification_tile.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _categories = [
    {'label': 'All', 'icon': Icons.grid_view},
    {'label': 'Orders', 'icon': Icons.inventory_2_outlined},
    {'label': 'Offers', 'icon': Icons.local_offer_outlined},
    {'label': 'Updates', 'icon': Icons.notifications_none_outlined},
    {'label': 'Community', 'icon': Icons.groups_outlined},
  ];

  late List<NotificationModel> _allNotifications;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _categories.length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) return;
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });

    _allNotifications = [
      NotificationModel(
        id: '1',
        title: 'Your order is on the way!',
        description: 'Good news! Your order #DA89823HNND has been shipped and is on the way.',
        time: '10:32 AM',
        type: NotificationType.order,
        actionText: 'Track order >>',
        onAction: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyOrdersPage()),
          );
        },
      ),
      NotificationModel(
        id: '2',
        title: 'Extra 15% off storewide',
        description: 'Don\'t miss out on the special offer on all the pet products till May 31.',
        time: '10:32 AM',
        type: NotificationType.offer,
      ),
      NotificationModel(
        id: '3',
        title: 'Your review was helpful',
        description: 'Somebody thought your review of the product was helpful. Keep helping others by reviewing your other products.',
        time: '10:32 AM',
        type: NotificationType.community,
      ),
      NotificationModel(
        id: '4',
        title: 'Order delivered successfully!',
        description: 'Your order #D21637DGASGD has been delivered. We hope your pet loves it.',
        time: '10:32 AM',
        type: NotificationType.order,
      ),
      NotificationModel(
        id: '5',
        title: 'System Update',
        description: 'We have updated our terms of service to better serve you and your pets.',
        time: 'Yesterday',
        type: NotificationType.update,
      ),
    ];
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<NotificationModel> _getFilteredNotifications() {
    if (_selectedIndex == 0) return _allNotifications;
    
    NotificationType targetType;
    switch (_selectedIndex) {
      case 1: targetType = NotificationType.order; break;
      case 2: targetType = NotificationType.offer; break;
      case 3: targetType = NotificationType.update; break;
      case 4: targetType = NotificationType.community; break;
      default: return _allNotifications;
    }
    
    return _allNotifications.where((n) => n.type == targetType).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _getFilteredNotifications();

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
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: AppColors.primary, size: 28),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Stay updated with your app',
              style: TextStyle(color: Colors.black87, fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ),
          AppSizes.gapH24,
          _buildCustomTabBar(),
          AppSizes.gapH12,
          Expanded(
            child: Container(
              color: Colors.white,
              child: filtered.isEmpty 
                ? _buildEmptyState()
                : ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    children: [
                      if (filtered.any((n) => n.time != 'Yesterday')) ...[
                        const Text(
                          'Today',
                          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
                        ),
                        const SizedBox(height: 20),
                        ...filtered.where((n) => n.time != 'Yesterday').map((n) => NotificationTile(notification: n)),
                      ],
                      if (filtered.any((n) => n.time == 'Yesterday')) ...[
                        const SizedBox(height: 10),
                        const Text(
                          'Yesterday',
                          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
                        ),
                        const SizedBox(height: 20),
                        ...filtered.where((n) => n.time == 'Yesterday').map((n) => NotificationTile(notification: n)),
                      ],
                      const SizedBox(height: 30),
                    ],
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomTabBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      decoration: BoxDecoration(
        color: const Color(0xFFF0F7FC),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TabBar(
        controller: _tabController,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(width: 4.0, color: AppColors.primary),
          insets: EdgeInsets.zero,
        ),
        dividerColor: Colors.transparent,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey.shade600,
        labelPadding: EdgeInsets.zero,
        tabs: _categories.map((cat) {
          final index = _categories.indexOf(cat);
          final isSelected = _selectedIndex == index;
          return Tab(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(cat['icon'], size: 24),
                const SizedBox(height: 4),
                Text(
                  cat['label'],
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
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
