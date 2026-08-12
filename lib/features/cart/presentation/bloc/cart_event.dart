part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class GetCartEvent extends CartEvent {
  final int customerId;
  const GetCartEvent(this.customerId);

  @override
  List<Object?> get props => [customerId];
}

class AddToCartEvent extends CartEvent {
  final int customerId;
  final int productId;
  final int quantity;
  final double unitPrice;

  const AddToCartEvent({
    required this.customerId,
    required this.productId,
    required this.quantity,
    required this.unitPrice,
  });

  @override
  List<Object?> get props => [customerId, productId, quantity, unitPrice];
}

class UpdateCartQuantityEvent extends CartEvent {
  final int customerId;
  final int cartItemId;
  final int quantity;

  const UpdateCartQuantityEvent({
    required this.customerId,
    required this.cartItemId,
    required this.quantity,
  });

  @override
  List<Object?> get props => [customerId, cartItemId, quantity];
}

class RemoveFromCartEvent extends CartEvent {
  final int customerId;
  final int cartItemId;

  const RemoveFromCartEvent({
    required this.customerId,
    required this.cartItemId,
  });

  @override
  List<Object?> get props => [customerId, cartItemId];
}

class ClearCartEvent extends CartEvent {
  final int customerId;
  const ClearCartEvent(this.customerId);

  @override
  List<Object?> get props => [customerId];
}
