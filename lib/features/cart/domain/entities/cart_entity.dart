import 'package:equatable/equatable.dart';
import 'cart_item.dart';

class CartEntity extends Equatable {
  final int cartId;
  final int customerId;
  final bool isCheckedOut;
  final List<CartItem> items;

  const CartEntity({
    required this.cartId,
    required this.customerId,
    required this.isCheckedOut,
    required this.items,
  });

  @override
  List<Object?> get props => [cartId, customerId, isCheckedOut, items];

  int get totalItems => items.fold(0, (sum, item) => sum + item.quantity);
  double get totalPrice => items.fold(0, (sum, item) => sum + item.totalAmount);
}
