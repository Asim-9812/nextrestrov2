part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class GetCartEvent extends CartEvent {
  final int customerId;
  final bool showLoading;
  const GetCartEvent(this.customerId, {this.showLoading = true});

  @override
  List<Object?> get props => [customerId, showLoading];
}

class AddToCartEvent extends CartEvent {
  final int customerId;
  final int productId;
  final int quantity;
  final double unitPrice;
  final int? productVariantId;
  final int? productBatchId;

  const AddToCartEvent({
    required this.customerId,
    required this.productId,
    required this.quantity,
    required this.unitPrice,
    this.productVariantId,
    this.productBatchId,
  });

  @override
  List<Object?> get props => [
        customerId,
        productId,
        quantity,
        unitPrice,
        productVariantId,
        productBatchId,
      ];
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

class RemoveSelectedFromCartEvent extends CartEvent {
  final int customerId;
  final List<int> cartItemIds;

  const RemoveSelectedFromCartEvent({
    required this.customerId,
    required this.cartItemIds,
  });

  @override
  List<Object?> get props => [customerId, cartItemIds];
}

class ClearCartEvent extends CartEvent {
  final int customerId;
  const ClearCartEvent(this.customerId);

  @override
  List<Object?> get props => [customerId];
}

class ResetCartEvent extends CartEvent {
  const ResetCartEvent();
}
