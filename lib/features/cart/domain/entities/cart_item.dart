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
  });

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
      ];
}
