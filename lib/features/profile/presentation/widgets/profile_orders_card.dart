import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../order/presentation/bloc/order_bloc.dart';
import '../../../order/presentation/bloc/order_state.dart';
import '../../../order/domain/entities/order_entity.dart';

class ProfileOrdersCard extends StatelessWidget {
  const ProfileOrdersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        int pendingCount = 0;
        int confirmedCount = 0;
        int shippedCount = 0;
        int deliveredCount = 0;
        int cancelledCount = 0;

        if (state is OrderLoaded) {
          pendingCount = state.orders.where((o) => o.status == OrderStatus.pending).length;
          confirmedCount = state.orders.where((o) => o.status == OrderStatus.confirmed).length;
          shippedCount = state.orders.where((o) => o.status == OrderStatus.shipped).length;
          deliveredCount = state.orders.where((o) => o.status == OrderStatus.delivered).length;
          cancelledCount = state.orders.where((o) => o.status == OrderStatus.cancelled).length;
        }

        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.shade100),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildOrderItem(Icons.assignment_outlined, 'Pending', pendingCount.toString()),
              _buildDivider(),
              _buildOrderItem(Icons.check_circle_outline_rounded, 'Confirmed', confirmedCount.toString()),
              _buildDivider(),
              _buildOrderItem(Icons.local_shipping_outlined, 'Shipped', shippedCount.toString()),
              _buildDivider(),
              _buildOrderItem(Icons.task_alt_rounded, 'Delivered', deliveredCount.toString()),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOrderItem(IconData icon, String label, String count) {
    return Column(
      children: [
        Icon(icon, color: AppColors.primary, size: 24),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Colors.grey),
        ),
        Text(
          count,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primary),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 30,
      width: 0.5,
      color: Colors.grey.shade300,
    );
  }
}
