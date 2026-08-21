import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:divinepets/core/constants/app_colors.dart';
import '../../../order/domain/entities/order_detail_entity.dart';
import '../../../order/domain/entities/order_entity.dart';

class TrackingStatusCard extends StatelessWidget {
  final OrderDetailEntity? order;
  const TrackingStatusCard({super.key, this.order});

  @override
  Widget build(BuildContext context) {
    // Mapping OrderStatus to StepStatus
    StepStatus confirmedStatus = StepStatus.inactive;
    StepStatus processingStatus = StepStatus.inactive;
    StepStatus shippingStatus = StepStatus.inactive;
    StepStatus deliveredStatus = StepStatus.inactive;

    if (order != null) {
      switch (order!.orderStatus) {
        case OrderStatus.toPay:
          confirmedStatus = StepStatus.pending;
          break;
        case OrderStatus.processing:
          confirmedStatus = StepStatus.completed;
          processingStatus = StepStatus.pending;
          break;
        case OrderStatus.shipped:
          confirmedStatus = StepStatus.completed;
          processingStatus = StepStatus.completed;
          shippingStatus = StepStatus.pending;
          break;
        case OrderStatus.delivered:
          confirmedStatus = StepStatus.completed;
          processingStatus = StepStatus.completed;
          shippingStatus = StepStatus.completed;
          deliveredStatus = StepStatus.completed;
          break;
        case OrderStatus.cancelled:
          // Just show them as they are or mark as inactive
          break;
      }
    } else {
      // Default static values if order is null
      confirmedStatus = StepStatus.completed;
      processingStatus = StepStatus.completed;
      shippingStatus = StepStatus.pending;
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Tracking Status',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Row(
                children: [
                  Text(
                    'Order ID: ${order?.orderId ?? 'NP8273798289'}',
                    style: const TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: order?.orderId.toString() ?? 'NP8273798289'));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Order ID copied!'),
                          behavior: SnackBarBehavior.floating,
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                    child: Icon(Icons.copy, size: 12, color: Colors.grey.shade400),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildStep(
                icon: Icons.receipt_long,
                label: 'Order\nConfirmed',
                status: confirmedStatus,
              ),
              _buildLine(confirmedStatus),
              _buildStep(
                icon: Icons.inventory_2,
                label: 'Processing',
                status: processingStatus,
              ),
              _buildLine(processingStatus),
              _buildStep(
                icon: Icons.local_shipping,
                label: 'On the way',
                status: shippingStatus,
                showBadge: shippingStatus == StepStatus.pending,
              ),
              _buildLine(shippingStatus),
              _buildStep(
                icon: Icons.home,
                label: 'Delivered',
                status: deliveredStatus,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStep({
    required IconData icon,
    required String label,
    required StepStatus status,
    bool showBadge = false,
  }) {
    Color color;
    Widget? overlay;

    switch (status) {
      case StepStatus.completed:
        color = AppColors.primary;
        overlay = Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              color: Color(0xFF27AE60),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.check, color: Colors.white, size: 10),
          ),
        );
        break;
      case StepStatus.pending:
        color = AppColors.primary;
        if (showBadge) {
          overlay = Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.access_time, color: Colors.white, size: 10),
            ),
          );
        }
        break;
      case StepStatus.inactive:
        color = Colors.grey.shade200;
        break;
    }

    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: status == StepStatus.inactive ? Colors.grey.shade50 : AppColors.primary.withOpacity(0.1),
                shape: BoxShape.circle,
                border: Border.all(
                  color: status == StepStatus.inactive ? Colors.grey.shade200 : AppColors.primary,
                  width: 1,
                ),
              ),
              child: Icon(icon, color: status == StepStatus.inactive ? Colors.grey.shade300 : AppColors.primary, size: 22),
            ),
            if (overlay != null) overlay,
          ],
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 10,
            fontWeight: status == StepStatus.inactive ? FontWeight.w500 : FontWeight.bold,
            color: status == StepStatus.inactive ? Colors.grey.shade400 : Colors.black,
            height: 1.2,
          ),
        ),
      ],
    );
  }

  Widget _buildLine(StepStatus status) {
    final bool isCompleted = status == StepStatus.completed;
    final Color color = isCompleted ? AppColors.primary : (status == StepStatus.pending ? AppColors.primary.withOpacity(0.3) : Colors.grey.shade200);

    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 22),
        child: isCompleted
            ? Container(
                height: 2,
                color: color,
                margin: const EdgeInsets.symmetric(horizontal: 2),
              )
            : Row(
                children: List.generate(
                  6,
                  (index) => Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 1),
                      height: 1.5,
                      color: color,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

enum StepStatus { completed, pending, inactive }
