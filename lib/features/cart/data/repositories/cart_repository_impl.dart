import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/cart_entity.dart';
import '../../domain/repositories/cart_repository.dart';
import '../datasources/cart_remote_data_source.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource remoteDataSource;

  CartRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, CartEntity>> getCart(int customerId) async {
    try {
      final cart = await remoteDataSource.getCart(customerId);
      return Right(cart);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Failed to load cart'));
    } catch (e) {
      return Left(GenericFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addToCart({
    required int customerId,
    required int productId,
    required int quantity,
    required double unitPrice,
  }) async {
    try {
      await remoteDataSource.addToCart(
        customerId: customerId,
        productId: productId,
        quantity: quantity,
        unitPrice: unitPrice,
      );
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Failed to add to cart'));
    } catch (e) {
      return Left(GenericFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateCartQuantity({
    required int cartItemId,
    required int quantity,
  }) async {
    try {
      await remoteDataSource.updateCartQuantity(
        cartItemId: cartItemId,
        quantity: quantity,
      );
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Failed to update quantity'));
    } catch (e) {
      return Left(GenericFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeFromCart(int cartItemId) async {
    try {
      await remoteDataSource.removeFromCart(cartItemId);
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Failed to remove item'));
    } catch (e) {
      return Left(GenericFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> clearCart(int customerId) async {
    try {
      await remoteDataSource.clearCart(customerId);
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Failed to clear cart'));
    } catch (e) {
      return Left(GenericFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> checkout(int customerId) async {
    try {
      await remoteDataSource.checkout(customerId);
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Checkout failed'));
    } catch (e) {
      return Left(GenericFailure(e.toString()));
    }
  }
}
