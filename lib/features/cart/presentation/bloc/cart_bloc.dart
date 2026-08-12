import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/cart_entity.dart';
import '../../domain/repositories/cart_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository cartRepository;

  CartBloc({required this.cartRepository}) : super(CartInitial()) {
    on<GetCartEvent>(_onGetCart);
    on<AddToCartEvent>(_onAddToCart);
    on<UpdateCartQuantityEvent>(_onUpdateQuantity);
    on<RemoveFromCartEvent>(_onRemoveFromCart);
    on<ClearCartEvent>(_onClearCart);
  }

  Future<void> _onGetCart(GetCartEvent event, Emitter<CartState> emit) async {
    emit(CartLoading());
    final result = await cartRepository.getCart(event.customerId);
    result.fold(
      (failure) => emit(CartError(failure.message)),
      (cart) => emit(CartLoaded(cart)),
    );
  }

  Future<void> _onAddToCart(AddToCartEvent event, Emitter<CartState> emit) async {
    // Optimistic UI could be here, but for now simple refresh
    final result = await cartRepository.addToCart(
      customerId: event.customerId,
      productId: event.productId,
      quantity: event.quantity,
      unitPrice: event.unitPrice,
    );
    result.fold(
      (failure) => emit(CartError(failure.message)),
      (_) => add(GetCartEvent(event.customerId)),
    );
  }

  Future<void> _onUpdateQuantity(UpdateCartQuantityEvent event, Emitter<CartState> emit) async {
    final result = await cartRepository.updateCartQuantity(
      cartItemId: event.cartItemId,
      quantity: event.quantity,
    );
    result.fold(
      (failure) => emit(CartError(failure.message)),
      (_) => add(GetCartEvent(event.customerId)),
    );
  }

  Future<void> _onRemoveFromCart(RemoveFromCartEvent event, Emitter<CartState> emit) async {
    final result = await cartRepository.removeFromCart(event.cartItemId);
    result.fold(
      (failure) => emit(CartError(failure.message)),
      (_) => add(GetCartEvent(event.customerId)),
    );
  }

  Future<void> _onClearCart(ClearCartEvent event, Emitter<CartState> emit) async {
    final result = await cartRepository.clearCart(event.customerId);
    result.fold(
      (failure) => emit(CartError(failure.message)),
      (_) => add(GetCartEvent(event.customerId)),
    );
  }
}
