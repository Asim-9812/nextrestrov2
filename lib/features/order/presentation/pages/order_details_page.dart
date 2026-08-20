import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
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
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Order Details',
          style: AppTextStyles.h2.copyWith(color: Colors.black, fontSize: 18),
        ),
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
                  _buildStatusHeader(order),
                  AppSizes.gapH16,
                  _buildOrderInfoCard(order),
                  AppSizes.gapH16,
                  _buildItemsList(order),
                  AppSizes.gapH16,
                  _buildPaymentSummary(order),
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

  Widget _buildStatusHeader(OrderDetailEntity order) {
    Color color;
    IconData icon;
    String statusText;

    switch (order.orderStatus) {
      case OrderStatus.delivered:
        color = AppColors.accentSuccess;
        icon = Icons.check_circle;
        statusText = 'Delivered';
        break;
      case OrderStatus.shipped:
        color = Colors.blue;
        icon = Icons.local_shipping;
        statusText = 'Shipped';
        break;
      case OrderStatus.processing:
        color = Colors.orange;
        icon = Icons.hourglass_top;
        statusText = 'Processing';
        break;
      case OrderStatus.toPay:
        color = Colors.amber.shade700;
        icon = Icons.payment;
        statusText = 'To Pay';
        break;
      case OrderStatus.cancelled:
        color = AppColors.accentError;
        icon = Icons.cancel;
        statusText = 'Cancelled';
        break;
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color,
            child: Icon(icon, color: Colors.white, size: 20),
          ),
          AppSizes.gapW16,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order $statusText',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: color),
                ),
                Text(
                  'On ${DateFormat('MMM dd, yyyy').format(order.orderDate)}',
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
                ),
              ],
            ),
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
          Text('Items (${order.details.length})', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          AppSizes.gapH16,
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: order.details.length,
            separatorBuilder: (context, index) => const Divider(height: 24),
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
          ),
        ],
      ),
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
