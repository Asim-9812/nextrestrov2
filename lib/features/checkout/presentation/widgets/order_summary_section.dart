import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../cart/presentation/bloc/cart_bloc.dart';

class OrderSummarySection extends StatelessWidget {
  const OrderSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        double subtotal = 0;
        double discount = 0;
        int itemCount = 0;

        if (state is CartLoaded) {
          itemCount = state.cart.items.length;
          for (var item in state.cart.items) {
            subtotal += item.unitPrice * item.quantity;
            discount += item.discountAmount * item.quantity;
          }
        }

        const deliveryFee = 100.0; // Hardcoded for now
        final total = subtotal - discount + deliveryFee;

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.shade100),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Order Summary',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              AppSizes.gapH16,
              _buildSummaryRow('Subtotal ($itemCount items)', 'Rs. ${subtotal.toStringAsFixed(0)}'),
              _buildSummaryRow('Discount', 'Rs. ${discount.toStringAsFixed(0)}', valueColor: AppColors.accentSuccess),
              _buildSummaryRow(
                'Delivery Fee', 
                'Rs. ${deliveryFee.toStringAsFixed(0)}', 
                trailingIcon: Icons.info_outline,
              ),
              const Divider(height: 32, thickness: 0.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Total', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      Text('Inclusive of all taxes', style: TextStyle(color: Colors.grey, fontSize: 10)),
                    ],
                  ),
                  Text(
                    'Rs. ${total.toStringAsFixed(0)}',
                    style: const TextStyle(fontWeight: FontWeight.w900, color: AppColors.primary, fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSummaryRow(String label, String value, {Color? valueColor, IconData? trailingIcon}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(label, style: const TextStyle(color: Colors.black54, fontSize: 12, fontWeight: FontWeight.w500)),
              if (trailingIcon != null) ...[
                const SizedBox(width: 4),
                Icon(trailingIcon, size: 14, color: Colors.black54),
              ],
            ],
          ),
          Text(
            value,
            style: TextStyle(
              color: valueColor ?? Colors.black, 
              fontWeight: FontWeight.bold, 
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
