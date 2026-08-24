import 'package:dio/dio.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/network/api_endpoints.dart';
import '../models/cart_model.dart';

abstract class CartRemoteDataSource {
  Future<CartModel> getCart(int customerId);
  Future<void> addToCart({
    required int customerId,
    required int productId,
    required int quantity,
    required double unitPrice,
  });
  Future<void> updateCartQuantity({
    required int cartItemId,
    required int quantity,
  });
  Future<void> removeFromCart(int cartItemId);
  Future<void> clearCart(int customerId);
  Future<void> checkout(int customerId);
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final DioClient _dioClient;

  CartRemoteDataSourceImpl(this._dioClient);

  @override
  Future<CartModel> getCart(int customerId) async {
    try {
      final response = await _dioClient.get(
        ApiEndpoints.getCart,
        queryParameters: {'customerId': customerId},
      );
      if (response.data != null && response.data['data'] != null) {
        return CartModel.fromJson(response.data['data']);
      }
      return CartModel(cartId: 0, customerId: customerId, isCheckedOut: false, items: const []);
    } on DioException catch (e) {
      // If server returns 404, it means the cart is empty for this user
      if (e.response?.statusCode == 404) {
        return CartModel(
          cartId: 0, 
          customerId: customerId, 
          isCheckedOut: false, 
          items: const []
        );
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> addToCart({
    required int customerId,
    required int productId,
    required int quantity,
    required double unitPrice,
  }) async {
    try {
      await _dioClient.post(
        ApiEndpoints.addToCart,
        data: {
          'customerId': customerId,
          'productId': productId,
          'quantity': quantity,
          'unitPrice': unitPrice,
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateCartQuantity({
    required int cartItemId,
    required int quantity,
  }) async {
    try {
      await _dioClient.put(
        ApiEndpoints.updateCartQuantity,
        data: {
          'cartItemId': cartItemId,
          'quantity': quantity,
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> removeFromCart(int cartItemId) async {
    try {
      await _dioClient.delete(
        ApiEndpoints.removeFromCart,
        data: {
          'cartItemId': cartItemId,
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> clearCart(int customerId) async {
    try {
      await _dioClient.delete(
        ApiEndpoints.clearCart,
        queryParameters: {'customerId': customerId},
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> checkout(int customerId) async {
    try {
      await _dioClient.post(
        ApiEndpoints.checkout,
        queryParameters: {'customerId': customerId},
      );
    } catch (e) {
      rethrow;
    }
  }
}
