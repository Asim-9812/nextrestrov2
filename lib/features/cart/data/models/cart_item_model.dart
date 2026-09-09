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
    super.productVariantId,
    super.productBatchId,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    String? imageUrl = json['imageUrl'] ?? json['productImage'];
    if (imageUrl != null && imageUrl.isNotEmpty) {
      if (!imageUrl.startsWith('http')) {
        final cleanPath = imageUrl.startsWith('/') ? imageUrl.substring(1) : imageUrl;
        imageUrl = 'https://pets.codeinfinitynepal.com/$cleanPath';
      }
    }

    return CartItemModel(
      cartItemId: (json['cartItemId'] as num?)?.toInt() ?? 0,
      cartId: (json['cartId'] as num?)?.toInt(),
      productId: (json['productId'] as num?)?.toInt() ?? 0,
      productName: json['productName'] ?? '',
      productCode: json['productCode'],
      imageUrl: imageUrl,
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
      unitPrice: (json['unitPrice'] as num?)?.toDouble() ?? 0.0,
      discountAmount: (json['discountAmount'] as num?)?.toDouble() ?? 0.0,
      totalAmount: (json['totalAmount'] as num?)?.toDouble() ?? 0.0,
      productVariantId: (json['productVariantId'] as num?)?.toInt(),
      productBatchId: (json['productBatchId'] as num?)?.toInt(),
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
      'productVariantId': productVariantId,
      'productBatchId': productBatchId,
    };
  }
}
