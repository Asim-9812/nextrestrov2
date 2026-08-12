import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/cart_entity.dart';

abstract class CartRepository {
  Future<Either<Failure, CartEntity>> getCart(int customerId);
  Future<Either<Failure, void>> addToCart({
    required int customerId,
    required int productId,
    required int quantity,
    required double unitPrice,
  });
  Future<Either<Failure, void>> updateCartQuantity({
    required int cartItemId,
    required int quantity,
  });
  Future<Either<Failure, void>> removeFromCart(int cartItemId);
  Future<Either<Failure, void>> clearCart(int customerId);
}
