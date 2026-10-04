import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/widgets/app_product_image.dart';
import '../../../../injection_container.dart' as di;
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_state.dart';
import '../../../order/data/datasources/order_remote_data_source.dart';
import '../../../order/data/models/order_detail_model.dart';
import '../../data/models/admin_order_model.dart';

class AdminOrdersPage extends StatefulWidget {
  const AdminOrdersPage({super.key});

  @override
  State<AdminOrdersPage> createState() => _AdminOrdersPageState();
}

class _AdminOrdersPageState extends State<AdminOrdersPage> {
  bool _isLoading = true;
  String? _errorMessage;
  List<AdminOrderModel> _allOrders = [];

  String _selectedFilter = 'All';
  final List<String> _filters = [
    'All',
    'Pending',
    'Confirmed',
    'Out for Delivery',
    'Cancelled',
    'Delivered',
  ];

  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _fetchOrders();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _fetchOrders() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final orders = await di.sl<OrderRemoteDataSource>().getAdminOrderList();
      if (!mounted) return;
      setState(() {
        _allOrders = orders;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _errorMessage = e.toString().replaceAll('Exception: ', '');
        _isLoading = false;
      });
    }
  }

  List<AdminOrderModel> get _filteredOrders {
    return _allOrders.where((order) {
      // 1. Status Filter
      if (_selectedFilter != 'All') {
        if (_selectedFilter == 'Pending' && order.orderStatus != 1) return false;
        if (_selectedFilter == 'Confirmed' && order.orderStatus != 2) return false;
        if (_selectedFilter == 'Out for Delivery' && order.orderStatus != 3) return false;
        if (_selectedFilter == 'Cancelled' && order.orderStatus != 4) return false;
        if (_selectedFilter == 'Delivered' && order.orderStatus != 5) return false;
      }

      // 2. Search Query Filter
      if (_searchQuery.trim().isNotEmpty) {
        final q = _searchQuery.trim().toLowerCase();
        final matchesId = order.orderId.toString().contains(q);
        final matchesName = order.customerName.toLowerCase().contains(q);
        final matchesPhone = order.phone.toLowerCase().contains(q);
        final matchesEmail = order.email.toLowerCase().contains(q);
        final matchesCity = (order.city ?? '').toLowerCase().contains(q);
        final matchesAddress = (order.address ?? '').toLowerCase().contains(q);

        return matchesId || matchesName || matchesPhone || matchesEmail || matchesCity || matchesAddress;
      }

      return true;
    }).toList();
  }

  int _getUserId() {
    final authState = context.read<AuthBloc>().state;
    if (authState is Authenticated) {
      return authState.user.userId;
    }
    return 0;
  }

  Future<void> _handleUpdateStatus(AdminOrderModel order, int newStatus) async {
    Navigator.pop(context); // Close bottom sheet
    _showLoadingDialog();

    try {
      final currentUserId = _getUserId();
      final dataSource = di.sl<OrderRemoteDataSource>();

      if (newStatus == 4) {
        // Cancelled -> Use separate cancelOrder API (@cancelOrder)
        await dataSource.cancelOrder(
          orderId: order.orderId,
          updatedBy: currentUserId,
        );
      } else {
        // Confirmed (2), Out for Delivery (3), Delivered (5) -> Use changeOrderStatus API (@changeOrderStatus)
        await dataSource.updateOrderStatus(
          orderId: order.orderId,
          orderStatus: newStatus,
          updatedBy: currentUserId,
        );
      }

      if (!mounted) return;
      Navigator.pop(context); // Close loading dialog

      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Order #${order.orderId} updated successfully.'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );

      // Refresh list
      _fetchOrders();
    } catch (e) {
      if (!mounted) return;
      Navigator.pop(context); // Close loading dialog

      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update order: ${e.toString().replaceAll('Exception: ', '')}'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  void _showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Updating order status...'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showUpdateStatusSheet(AdminOrderModel order) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Update Order #${order.orderId}',
                    style: AppTextStyles.h3.copyWith(fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                'Select new status for this order:',
                style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary),
              ),
              const SizedBox(height: 16),

              // Option 2: Confirmed
              if (order.orderStatus != 2)
                _buildStatusOptionTile(
                  title: 'Mark as Confirmed',
                  subtitle: 'Order is accepted and under processing',
                  icon: Icons.check_circle_outline_rounded,
                  color: Colors.blue,
                  onTap: () => _handleUpdateStatus(order, 2),
                ),

              // Option 3: Out for Delivery
              if (order.orderStatus != 3)
                _buildStatusOptionTile(
                  title: 'Mark as Out for Delivery',
                  subtitle: 'Items are dispatched for customer delivery',
                  icon: Icons.local_shipping_outlined,
                  color: Colors.purple,
                  onTap: () => _handleUpdateStatus(order, 3),
                ),

              // Option 5: Delivered
              if (order.orderStatus != 5)
                _buildStatusOptionTile(
                  title: 'Mark as Delivered',
                  subtitle: 'Order has been successfully delivered',
                  icon: Icons.task_alt_rounded,
                  color: Colors.green,
                  onTap: () => _handleUpdateStatus(order, 5),
                ),

              // Option 4: Cancel Order (Separate API)
              if (order.orderStatus != 4)
                _buildStatusOptionTile(
                  title: 'Cancel Order',
                  subtitle: 'Cancel order via cancel endpoint (@cancelOrder)',
                  icon: Icons.cancel_outlined,
                  color: Colors.red,
                  onTap: () => _handleUpdateStatus(order, 4),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStatusOptionTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: color, size: 24),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 14),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
        ),
        trailing: Icon(Icons.arrow_forward_ios_rounded, size: 14, color: color),
      ),
    );
  }

  void _showOrderDetailsSheet(AdminOrderModel order) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) {
        return DraggableScrollableSheet(
          initialChildSize: 0.8,
          maxChildSize: 0.95,
          minChildSize: 0.5,
          expand: false,
          builder: (context, scrollController) {
            return _buildOrderDetailsContent(order, scrollController);
          },
        );
      },
    );
  }

  Widget _buildOrderDetailsContent(AdminOrderModel order, ScrollController scrollController) {
    return FutureBuilder<OrderDetailModel>(
      future: di.sl<OrderRemoteDataSource>().getOrderById(order.orderId),
      builder: (context, snapshot) {
        return SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Modal handle bar
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Order Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order #${order.orderId}',
                        style: AppTextStyles.h2.copyWith(fontWeight: FontWeight.bold),
                      ),
                      if (order.invoiceNo != null && order.invoiceNo!.isNotEmpty)
                        Text(
                          'Invoice: ${order.invoiceNo}',
                          style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary),
                        ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: order.statusColor.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      order.statusLabel,
                      style: TextStyle(
                        color: order.statusColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(height: 24),

              // Order Items Section (From @getOrderById API)
              _buildDetailSectionHeader(Icons.shopping_bag_outlined, 'Order Items'),
              const SizedBox(height: 12),

              if (snapshot.connectionState == ConnectionState.waiting)
                Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.center,
                  child: const Column(
                    children: [
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Loading items from order details...',
                        style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
                      ),
                    ],
                  ),
                )
              else if (snapshot.hasError)
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.info_outline, color: Colors.red, size: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Could not load items: ${snapshot.error.toString().replaceAll('Exception: ', '')}',
                          style: const TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                )
              else if (snapshot.hasData && snapshot.data!.details.isNotEmpty)
                Column(
                  children: snapshot.data!.details.map((item) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F7FC),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFFE2E8F0)),
                      ),
                      child: Row(
                        children: [
                          // Image
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: AppProductImage(
                                imageUrl: item.productImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),

                          // Name & Details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.productName,
                                  style: AppTextStyles.bodyMedium.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                if (item.productCode.isNotEmpty)
                                  Text(
                                    'Code: ${item.productCode}',
                                    style: AppTextStyles.bodySmall.copyWith(
                                      color: AppColors.textTertiary,
                                      fontSize: 11,
                                    ),
                                  ),
                                const SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${item.quantity}x @ Rs. ${item.unitPrice.toStringAsFixed(2)}',
                                      style: AppTextStyles.bodySmall.copyWith(
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                    Text(
                                      'Rs. ${item.totalAmount.toStringAsFixed(2)}',
                                      style: AppTextStyles.bodyMedium.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                )
              else
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'No items found in this order.',
                    style: TextStyle(color: AppColors.textTertiary, fontSize: 13),
                  ),
                ),

              const Divider(height: 24),

              // Customer Details Section
              _buildDetailSectionHeader(Icons.person_outline, 'Customer Information'),
              const SizedBox(height: 8),
              _buildDetailRow('Customer Name', order.customerName),
              _buildDetailRow('Phone Number', order.phone),
              _buildDetailRow('Email Address', order.email),
              _buildDetailRow('Customer ID', '#${order.customerId}'),
              const Divider(height: 24),

              // Delivery Address Section
              _buildDetailSectionHeader(Icons.location_on_outlined, 'Delivery Address'),
              const SizedBox(height: 8),
              _buildDetailRow('Address', order.address ?? 'N/A'),
              _buildDetailRow('City', order.city ?? 'N/A'),
              if (order.landmark != null && order.landmark!.isNotEmpty)
                _buildDetailRow('Landmark', order.landmark!),
              if (order.deliveryNotes != null && order.deliveryNotes!.isNotEmpty)
                _buildDetailRow('Delivery Notes', order.deliveryNotes!),
              const Divider(height: 24),

              // Summary Section
              _buildDetailSectionHeader(Icons.receipt_long_outlined, 'Payment & Summary'),
              const SizedBox(height: 8),
              _buildDetailRow('Order Date', order.orderDate.toString().split('.').first),
              _buildDetailRow('Total Amount', 'Rs. ${order.totalAmount.toStringAsFixed(2)}', isBold: true),
              const SizedBox(height: 24),

              // Update Status Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context); // Close details sheet
                    _showUpdateStatusSheet(order);
                  },
                  icon: const Icon(Icons.edit, color: Colors.white),
                  label: const Text('Update Status', style: TextStyle(color: Colors.white, fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDetailSectionHeader(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppColors.primary),
        const SizedBox(width: 8),
        Text(
          title,
          style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: AppTextStyles.bodySmall.copyWith(
                fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
                color: isBold ? AppColors.primary : AppColors.textPrimary,
                fontSize: isBold ? 14 : 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top Header
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          color: AppColors.primaryLighter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.shopping_bag_outlined, color: AppColors.primary, size: 24),
                      AppSizes.gapW8,
                      Text(
                        'Order Management',
                        style: AppTextStyles.h3.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  IconButton(
                    tooltip: 'Refresh Orders',
                    icon: const Icon(Icons.refresh, color: AppColors.primary),
                    onPressed: _fetchOrders,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                'Track and manage customer orders across all statuses.',
                style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary),
              ),
            ],
          ),
        ),

        // Search & Filters
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Search Field
              TextField(
                controller: _searchController,
                onChanged: (val) {
                  setState(() {
                    _searchQuery = val;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search order ID, customer name, phone...',
                  prefixIcon: const Icon(Icons.search, color: AppColors.textTertiary),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear, size: 18),
                          onPressed: () {
                            _searchController.clear();
                            setState(() {
                              _searchQuery = '';
                            });
                          },
                        )
                      : null,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  filled: true,
                  fillColor: const Color(0xFFF0F7FC),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              AppSizes.gapH12,

              // Status Filter Chips
              SizedBox(
                height: 38,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _filters.length,
                  separatorBuilder: (context, _) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final filter = _filters[index];
                    final isSelected = filter == _selectedFilter;
                    return ChoiceChip(
                      label: Text(filter),
                      selected: isSelected,
                      selectedColor: AppColors.primary,
                      backgroundColor: const Color(0xFFF0F7FC),
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : AppColors.textPrimary,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        fontSize: 12,
                      ),
                      onSelected: (val) {
                        setState(() {
                          _selectedFilter = filter;
                        });
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        // Body Content
        Expanded(
          child: _isLoading
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 16),
                      Text('Loading admin orders...', style: TextStyle(color: AppColors.textSecondary)),
                    ],
                  ),
                )
              : _errorMessage != null
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.error_outline, color: Colors.red, size: 48),
                            const SizedBox(height: 12),
                            Text(
                              'Error loading orders',
                              style: AppTextStyles.h3.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              _errorMessage!,
                              textAlign: TextAlign.center,
                              style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton.icon(
                              onPressed: _fetchOrders,
                              icon: const Icon(Icons.refresh, color: Colors.white),
                              label: const Text('Retry', style: TextStyle(color: Colors.white)),
                              style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
                            ),
                          ],
                        ),
                      ),
                    )
                  : _filteredOrders.isEmpty
                      ? RefreshIndicator(
                          onRefresh: _fetchOrders,
                          child: ListView(
                            children: [
                              const SizedBox(height: 80),
                              const Center(
                                child: Column(
                                  children: [
                                    Icon(Icons.inbox_outlined, size: 64, color: AppColors.textTertiary),
                                    SizedBox(height: 12),
                                    Text(
                                      'No orders found',
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textSecondary),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Pull down to refresh',
                                      style: TextStyle(fontSize: 12, color: AppColors.textTertiary),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      : RefreshIndicator(
                          onRefresh: _fetchOrders,
                          child: ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            itemCount: _filteredOrders.length,
                            separatorBuilder: (context, _) => const SizedBox(height: 12),
                            itemBuilder: (context, index) {
                              final order = _filteredOrders[index];
                              return _buildOrderCard(order);
                            },
                          ),
                        ),
        ),
      ],
    );
  }

  Widget _buildOrderCard(AdminOrderModel order) {
    final statusColor = order.statusColor;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: const Color(0xFFEEEEEE)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Order ID & Status Badge
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order #${order.orderId}',
                style: AppTextStyles.bodyLarge.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  order.statusLabel,
                  style: TextStyle(
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Customer Name & Phone
          Row(
            children: [
              const Icon(Icons.person_outline, size: 16, color: AppColors.textSecondary),
              const SizedBox(width: 4),
              Text(
                order.customerName,
                style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600),
              ),
              if (order.phone.isNotEmpty) ...[
                const SizedBox(width: 8),
                Text(
                  '• ${order.phone}',
                  style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary),
                ),
              ],
            ],
          ),
          const SizedBox(height: 4),

          // City & Address
          if (order.city != null || order.address != null)
            Row(
              children: [
                const Icon(Icons.location_on_outlined, size: 16, color: AppColors.textTertiary),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    '${order.address ?? ''}${order.city != null ? ', ${order.city}' : ''}',
                    style: AppTextStyles.bodySmall.copyWith(color: AppColors.textTertiary),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),

          const Divider(height: 20),

          // Amount & Date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Amount',
                    style: AppTextStyles.bodySmall.copyWith(color: AppColors.textTertiary),
                  ),
                  Text(
                    'Rs. ${order.totalAmount.toStringAsFixed(2)}',
                    style: AppTextStyles.bodyLarge.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Order Date',
                    style: AppTextStyles.bodySmall.copyWith(color: AppColors.textTertiary),
                  ),
                  Text(
                    order.orderDate.toString().split(' ').first,
                    style: AppTextStyles.bodySmall.copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Action Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => _showOrderDetailsSheet(order),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    side: const BorderSide(color: AppColors.primary),
                  ),
                  child: const Text('View Details', style: TextStyle(color: AppColors.primary, fontSize: 12)),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _showUpdateStatusSheet(order),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('Update Status', style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
