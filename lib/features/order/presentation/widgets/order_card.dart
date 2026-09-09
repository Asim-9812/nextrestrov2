import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../injection_container.dart' as di;
import '../bloc/order_bloc.dart';
import '../../domain/entities/order_entity.dart';
import '../pages/order_details_page.dart';

import '../../../../core/widgets/app_product_image.dart';

class OrderCard extends StatelessWidget {
  final OrderEntity order;
  final VoidCallback onTap;

  const OrderCard({
    super.key,
    required this.order,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => di.sl<OrderBloc>(),
              child: OrderDetailsPage(orderId: order.orderId),
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(color: Colors.grey.shade100),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Stack (Miniature representation)
                _buildImageStack(),
                AppSizes.gapW16,
                // Order Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order #${order.orderId} ${order.orderNumber}',
                        style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${DateFormat('MMM d, yyyy').format(order.orderDate)} • ${DateFormat('hh:mm a').format(order.orderDate)}',
                        style: TextStyle(color: Colors.grey.shade500, fontSize: 11),
                      ),
                      const SizedBox(height: 8),
                      _buildStatusBadge(),
                      const SizedBox(height: 8),
                      _buildDeliveryInfo(),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined, size: 12, color: AppColors.primary),
                          const SizedBox(width: 4),
                          Text(
                            order.deliveryAddress ?? 'Location not set',
                            style: const TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Price and Payment
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Rs. ${NumberFormat('#,###').format(order.totalAmount)}',
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w900,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      order.paymentMethod != null ? 'Paid via ${order.paymentMethod}' : 'Pending Payment',
                      style: TextStyle(color: Colors.grey.shade500, fontSize: 9),
                    ),
                    const SizedBox(height: 12),
                    const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageStack() {
    if (order.items.isEmpty) return const SizedBox.shrink();
    
    return SizedBox(
      height: 80,
      width: 80,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F8FA),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade100),
            ),
            child: AppProductImage(
              imageUrl: order.items[0].imageUrl,
              fit: BoxFit.contain,
            ),
          ),
          if (order.items.length > 1)
            Positioned(
              right: -4,
              bottom: -4,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '${order.items.length}',
                  style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge() {
    Color color;
    IconData icon;
    String label;

    switch (order.status) {
      case OrderStatus.pending:
        color = Colors.amber.shade700;
        icon = Icons.hourglass_empty_rounded;
        label = 'Pending';
        break;
      case OrderStatus.confirmed:
        color = Colors.blue;
        icon = Icons.check_circle_outline;
        label = 'Confirmed';
        break;
      case OrderStatus.shipped:
        color = Colors.indigo;
        icon = Icons.local_shipping_outlined;
        label = 'Shipped / Out for Delivery';
        break;
      case OrderStatus.cancelled:
        color = AppColors.accentError;
        icon = Icons.cancel_outlined;
        label = 'Cancelled';
        break;
      case OrderStatus.delivered:
        color = AppColors.accentSuccess;
        icon = Icons.task_alt_rounded;
        label = 'Delivered';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(color: color, fontSize: 9, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryInfo() {
    String text = '';
    switch (order.status) {
      case OrderStatus.pending:
        text = 'Awaiting confirmation';
        break;
      case OrderStatus.confirmed:
        text = 'Order confirmed, preparing for shipment';
        break;
      case OrderStatus.shipped:
        text = 'Expected delivery: ${DateFormat('MMM d, yyyy').format(order.deliveryDate ?? order.orderDate.add(const Duration(days: 3)))}';
        break;
      case OrderStatus.cancelled:
        text = 'Order was cancelled';
        break;
      case OrderStatus.delivered:
        text = 'Delivered on ${DateFormat('MMM d, yyyy').format(order.deliveryDate ?? order.orderDate)}';
        break;
    }

    return Row(
      children: [
        const Icon(Icons.calendar_today_outlined, size: 12, color: Colors.grey),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
