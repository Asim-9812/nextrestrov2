import 'package:equatable/equatable.dart';

class CartItem extends Equatable {
  final int cartItemId;
  final int? cartId;
  final int productId;
  final String productName;
  final String? productCode;
  final String? imageUrl;
  final int quantity;
  final double unitPrice;
  final double discountAmount;
  final double totalAmount;
  final int? productVariantId;
  final int? productBatchId;

  const CartItem({
    required this.cartItemId,
    this.cartId,
    required this.productId,
    required this.productName,
    this.productCode,
    this.imageUrl,
    required this.quantity,
    required this.unitPrice,
    this.discountAmount = 0,
    required this.totalAmount,
    this.productVariantId,
    this.productBatchId,
  });

  CartItem copyWith({
    int? cartItemId,
    int? cartId,
    int? productId,
    String? productName,
    String? productCode,
    String? imageUrl,
    int? quantity,
    double? unitPrice,
    double? discountAmount,
    double? totalAmount,
    int? productVariantId,
    int? productBatchId,
  }) {
    return CartItem(
      cartItemId: cartItemId ?? this.cartItemId,
      cartId: cartId ?? this.cartId,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      productCode: productCode ?? this.productCode,
      imageUrl: imageUrl ?? this.imageUrl,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      discountAmount: discountAmount ?? this.discountAmount,
      totalAmount: totalAmount ?? this.totalAmount,
      productVariantId: productVariantId ?? this.productVariantId,
      productBatchId: productBatchId ?? this.productBatchId,
    );
  }

  @override
  List<Object?> get props => [
        cartItemId,
        cartId,
        productId,
        productName,
        productCode,
        imageUrl,
        quantity,
        unitPrice,
        discountAmount,
        totalAmount,
        productVariantId,
        productBatchId,
      ];
}
