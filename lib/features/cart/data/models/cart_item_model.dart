import '../../domain/entities/cart_item.dart';

class CartItemModel extends CartItem {
  const CartItemModel({
    required super.cartItemId,
    super.cartId,
    required super.productId,
    required super.productName,
    super.productCode,
    super.imageUrl,
    required super.quantity,
    required super.unitPrice,
    super.discountAmount = 0,
    required super.totalAmount,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      cartItemId: (json['cartItemId'] as num?)?.toInt() ?? 0,
      cartId: (json['cartId'] as num?)?.toInt(),
      productId: (json['productId'] as num?)?.toInt() ?? 0,
      productName: json['productName'] ?? '',
      productCode: json['productCode'],
      imageUrl: json['imageUrl'],
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
      unitPrice: (json['unitPrice'] as num?)?.toDouble() ?? 0.0,
      discountAmount: (json['discountAmount'] as num?)?.toDouble() ?? 0.0,
      totalAmount: (json['totalAmount'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cartItemId': cartItemId,
      'cartId': cartId,
      'productId': productId,
      'productName': productName,
      'productCode': productCode,
      'imageUrl': imageUrl,
      'quantity': quantity,
      'unitPrice': unitPrice,
      'discountAmount': discountAmount,
      'totalAmount': totalAmount,
    };
  }
}
