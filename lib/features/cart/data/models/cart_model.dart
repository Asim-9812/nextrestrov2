import '../../domain/entities/cart_entity.dart';
import 'cart_item_model.dart';

class CartModel extends CartEntity {
  const CartModel({
    required super.cartId,
    required super.customerId,
    required super.isCheckedOut,
    required super.items,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      cartId: (json['cartId'] as num?)?.toInt() ?? 0,
      customerId: (json['customerId'] as num?)?.toInt() ?? 0,
      isCheckedOut: json['isCheckedOut'] ?? false,
      items: (json['items'] as List? ?? [])
          .map((item) => CartItemModel.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cartId': cartId,
      'customerId': customerId,
      'isCheckedOut': isCheckedOut,
      'items': items.map((item) => (item as CartItemModel).toJson()).toList(),
    };
  }
}
