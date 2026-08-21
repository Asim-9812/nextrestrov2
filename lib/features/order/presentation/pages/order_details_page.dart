import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../order_tracking/presentation/widgets/tracking_status_card.dart';
import '../../../order_tracking/presentation/widgets/billing_details_card.dart';
import '../../../order_tracking/presentation/widgets/delivery_details_card.dart';
import '../bloc/order_bloc.dart';
import '../bloc/order_event.dart';
import '../bloc/order_state.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/entities/order_detail_entity.dart';

class OrderDetailsPage extends StatefulWidget {
  final int orderId;
  const OrderDetailsPage({super.key, required this.orderId});

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  bool _isAddressExpanded = false;
  bool _isItemsExpanded = true;

  @override
  void initState() {
    super.initState();
    context.read<OrderBloc>().add(FetchOrderDetailsEvent(widget.orderId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Order Details',
          style: AppTextStyles.h2.copyWith(
            color: AppColors.primary, 
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.headset_mic_outlined, color: AppColors.primary, size: 26),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          if (state is OrderLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is OrderDetailsLoaded) {
            final order = state.order;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Tracking Timeline (Most Important)
                  TrackingStatusCard(order: order),
                  AppSizes.gapH16,
                  
                  // 1.5 Estimated Delivery (Integrated from tracking info)
                  _buildEstimatedDelivery(order),
                  AppSizes.gapH16,
                  
                  // 2. Collapsible Delivery & Billing info
                  _buildCollapsibleSection(
                    title: 'Delivery & Billing Details',
                    icon: Icons.location_on_outlined,
                    isExpanded: _isAddressExpanded,
                    onToggle: () => setState(() => _isAddressExpanded = !_isAddressExpanded),
                    child: Column(
                      children: [
                        DeliveryDetailsCard(
                          order: order, 
                          showTitle: false, 
                          useCardStyle: false,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Divider(height: 1, thickness: 0.5),
                        ),
                        BillingDetailsCard(
                          order: order, 
                          showTitle: false, 
                          useCardStyle: false,
                        ),
                      ],
                    ),
                  ),
                  AppSizes.gapH16,
                  
                  // 3. Collapsible Items List
                  _buildCollapsibleSection(
                    title: 'Ordered Items (${order.details.length})',
                    icon: Icons.shopping_bag_outlined,
                    isExpanded: _isItemsExpanded,
                    onToggle: () => setState(() => _isItemsExpanded = !_isItemsExpanded),
                    child: _buildItemsList(order),
                  ),
                  AppSizes.gapH16,
                  
                  // 4. Payment Summary (Always visible at bottom)
                  _buildPaymentSummary(order),
                  AppSizes.gapH16,

                  // 5. Need Help Support Card
                  _buildHelpSupportSection(),
                  AppSizes.gapH32,
                ],
              ),
            );
          }

          if (state is OrderError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.message, style: const TextStyle(color: Colors.red)),
                  AppSizes.gapH16,
                  ElevatedButton(
                    onPressed: () => context.read<OrderBloc>().add(FetchOrderDetailsEvent(widget.orderId)),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildEstimatedDelivery(OrderDetailEntity order) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FA),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.local_shipping_outlined, color: AppColors.primary, size: 20),
          ),
          AppSizes.gapW12,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Estimated Delivery', style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w500)),
                Text(
                  '${DateFormat('MMM dd').format(order.orderDate.add(const Duration(days: 3)))} - ${DateFormat('MMM dd, yyyy').format(order.orderDate.add(const Duration(days: 7)))}', 
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ],
            ),
          ),
          const Text('3 - 7 days', style: TextStyle(color: AppColors.accentSuccess, fontWeight: FontWeight.bold, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildHelpSupportSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Need Help?',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  'Our support team is here to help you 24/7',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 11),
                ),
              ],
            ),
          ),
          Row(
            children: [
              _buildHelpActionIcon(Icons.phone, const Color(0xFFE67E22)),
              const SizedBox(width: 12),
              _buildHelpActionIcon(Icons.chat_bubble, Colors.orange),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHelpActionIcon(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Icon(icon, color: color, size: 20),
    );
  }

  Widget _buildCollapsibleSection({
    required String title,
    required IconData icon,
    required bool isExpanded,
    required VoidCallback onToggle,
    required Widget child,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        children: [
          ListTile(
            onTap: onToggle,
            leading: Icon(icon, color: AppColors.primary, size: 22),
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            trailing: Icon(
              isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: Colors.grey,
            ),
          ),
          if (isExpanded) 
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 16),
              child: child,
            ),
        ],
      ),
    );
  }

  Widget _buildOrderInfoCard(OrderDetailEntity order) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Order Information', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          AppSizes.gapH16,
          _buildInfoRow('Order ID', '#${order.orderId}'),
          _buildInfoRow('Order Date', DateFormat('MMM dd, yyyy hh:mm a').format(order.orderDate)),
          _buildInfoRow('Customer ID', '#${order.customerId}'),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildItemsList(OrderDetailEntity order) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: order.details.length,
      separatorBuilder: (context, index) => const Divider(height: 24, thickness: 0.5),
      itemBuilder: (context, index) {
        final item = order.details[index];
        return Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: item.productImage != null
                  ? Image.network(
                      'https://pets.codeinfinitynepal.com/${item.productImage}',
                      errorBuilder: (_, __, ___) => const Icon(Icons.image_not_supported, color: Colors.grey),
                    )
                  : const Icon(Icons.pets, color: AppColors.primary),
            ),
            AppSizes.gapW12,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.productName,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'Code: ${item.productCode}',
                    style: const TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                  Text(
                    'Qty: ${item.quantity}',
                    style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 11),
                  ),
                ],
              ),
            ),
            Text(
              'Rs. ${item.totalAmount.toStringAsFixed(0)}',
              style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary, fontSize: 13),
            ),
          ],
        );
      },
    );
  }

  Widget _buildPaymentSummary(OrderDetailEntity order) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Payment Summary', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          AppSizes.gapH16,
          _buildSummaryRow('Subtotal', 'Rs. ${order.totalAmount.toStringAsFixed(0)}'),
          _buildSummaryRow('Shipping Fee', 'Rs. 0'),
          const Divider(height: 24),
          _buildSummaryRow(
            'Total Amount', 
            'Rs. ${order.totalAmount.toStringAsFixed(0)}', 
            isBold: true,
            fontSize: 15,
            color: AppColors.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isBold = false, double fontSize = 12, Color? color}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: isBold ? Colors.black : Colors.grey, fontSize: fontSize, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(
            value, 
            style: TextStyle(
              fontWeight: isBold ? FontWeight.w900 : FontWeight.bold, 
              fontSize: fontSize,
              color: color ?? Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
