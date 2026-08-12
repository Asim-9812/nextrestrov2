import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../domain/entities/cart_item.dart';
import '../bloc/cart_bloc.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_state.dart';

class CartItemTile extends StatelessWidget {
  final CartItem item;
  final bool isSelected;
  final ValueChanged<bool?> onSelected;

  const CartItemTile({
    super.key,
    required this.item,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Checkbox(
            value: isSelected,
            onChanged: onSelected,
            activeColor: AppColors.primary,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(item.imageUrl ?? 'assets/images/dashboard_assets/sample_product.png', fit: BoxFit.contain),
          ),
          AppSizes.gapW12,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.productName,
                  style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.bold, fontSize: 13),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      'Rs. ${item.unitPrice.toInt()}',
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 28,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (item.quantity > 1) {
                          _updateQuantity(context, item.quantity - 1);
                        }
                      },
                      child: const Icon(Icons.remove, size: 14, color: AppColors.primary),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        '${item.quantity}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _updateQuantity(context, item.quantity + 1);
                      },
                      child: const Icon(Icons.add, size: 14, color: AppColors.primary),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => _removeItem(context),
                child: Icon(Icons.delete_outline, color: Colors.grey.shade400, size: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _updateQuantity(BuildContext context, int newQuantity) {
    final authState = context.read<AuthBloc>().state;
    if (authState is Authenticated) {
      context.read<CartBloc>().add(UpdateCartQuantityEvent(
            customerId: authState.user.userId,
            cartItemId: item.cartItemId,
            quantity: newQuantity,
          ));
    }
  }

  void _removeItem(BuildContext context) {
    final authState = context.read<AuthBloc>().state;
    if (authState is Authenticated) {
      context.read<CartBloc>().add(RemoveFromCartEvent(
            customerId: authState.user.userId,
            cartItemId: item.cartItemId,
          ));
    }
  }
}
