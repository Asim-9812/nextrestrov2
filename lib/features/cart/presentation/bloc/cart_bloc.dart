import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/cart_entity.dart';
import '../../domain/entities/cart_item.dart';
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
    on<RemoveSelectedFromCartEvent>(_onRemoveSelectedFromCart);
    on<ClearCartEvent>(_onClearCart);
    on<CheckoutCartEvent>(_onCheckoutCart);
    on<ResetCartEvent>(_onResetCart);
  }

  Future<void> _onGetCart(GetCartEvent event, Emitter<CartState> emit) async {
    if (event.showLoading) {
      emit(CartLoading());
    }
    final result = await cartRepository.getCart(event.customerId);
    result.fold(
      (failure) => emit(CartError(failure.message)),
      (cart) => emit(CartLoaded(cart)),
    );
  }

  Future<void> _onAddToCart(AddToCartEvent event, Emitter<CartState> emit) async {
    final result = await cartRepository.addToCart(
      customerId: event.customerId,
      productId: event.productId,
      quantity: event.quantity,
      unitPrice: event.unitPrice,
    );
    result.fold(
      (failure) => emit(CartError(failure.message)),
      (_) => add(GetCartEvent(event.customerId, showLoading: false)),
    );
  }

  Future<void> _onUpdateQuantity(UpdateCartQuantityEvent event, Emitter<CartState> emit) async {
    // 1. Optimistic Update
    if (state is CartLoaded) {
      final currentCart = (state as CartLoaded).cart;
      final updatedItems = currentCart.items.map((item) {
        if (item.cartItemId == event.cartItemId) {
          return item.copyWith(
            quantity: event.quantity,
            totalAmount: item.unitPrice * event.quantity,
          );
        }
        return item;
      }).toList();
      
      emit(CartLoaded(CartEntity(
        cartId: currentCart.cartId,
        customerId: currentCart.customerId,
        isCheckedOut: currentCart.isCheckedOut,
        items: updatedItems,
      )));
    }

    // 2. API Call
    final result = await cartRepository.updateCartQuantity(
      cartItemId: event.cartItemId,
      quantity: event.quantity,
    );
    
    result.fold(
      (failure) {
        emit(CartError(failure.message));
        add(GetCartEvent(event.customerId));
      },
      (_) => add(GetCartEvent(event.customerId, showLoading: false)),
    );
  }

  Future<void> _onRemoveFromCart(RemoveFromCartEvent event, Emitter<CartState> emit) async {
    // Optimistic Remove
    if (state is CartLoaded) {
      final currentCart = (state as CartLoaded).cart;
      final updatedItems = currentCart.items.where((item) => item.cartItemId != event.cartItemId).toList();
      emit(CartLoaded(CartEntity(
        cartId: currentCart.cartId,
        customerId: currentCart.customerId,
        isCheckedOut: currentCart.isCheckedOut,
        items: updatedItems,
      )));
    }

    final result = await cartRepository.removeFromCart(event.cartItemId);
    result.fold(
      (failure) {
        emit(CartError(failure.message));
        add(GetCartEvent(event.customerId));
      },
      (_) => add(GetCartEvent(event.customerId, showLoading: false)),
    );
  }

  Future<void> _onRemoveSelectedFromCart(RemoveSelectedFromCartEvent event, Emitter<CartState> emit) async {
    // 1. Optimistic Remove
    if (state is CartLoaded) {
      final currentCart = (state as CartLoaded).cart;
      final updatedItems = currentCart.items
          .where((item) => !event.cartItemIds.contains(item.cartItemId))
          .toList();
      emit(CartLoaded(CartEntity(
        cartId: currentCart.cartId,
        customerId: currentCart.customerId,
        isCheckedOut: currentCart.isCheckedOut,
        items: updatedItems,
      )));
    }

    // 2. API Calls (Serial for now as API is one by one)
    try {
      for (final id in event.cartItemIds) {
        await cartRepository.removeFromCart(id);
      }
      add(GetCartEvent(event.customerId, showLoading: false));
    } catch (e) {
      emit(CartError(e.toString()));
      add(GetCartEvent(event.customerId));
    }
  }

  Future<void> _onClearCart(ClearCartEvent event, Emitter<CartState> emit) async {
    // Optimistic Clear
    if (state is CartLoaded) {
      final currentCart = (state as CartLoaded).cart;
      emit(CartLoaded(CartEntity(
        cartId: currentCart.cartId,
        customerId: currentCart.customerId,
        isCheckedOut: currentCart.isCheckedOut,
        items: const [],
      )));
    }

    final result = await cartRepository.clearCart(event.customerId);
    result.fold(
      (failure) {
        emit(CartError(failure.message));
        add(GetCartEvent(event.customerId));
      },
      (_) => add(GetCartEvent(event.customerId, showLoading: false)),
    );
  }

  Future<void> _onCheckoutCart(CheckoutCartEvent event, Emitter<CartState> emit) async {
    emit(CartLoading());
    final result = await cartRepository.checkout(event.customerId);
    result.fold(
      (failure) => emit(CartError(failure.message)),
      (_) => emit(CartCheckoutSuccess()),
    );
  }

  void _onResetCart(ResetCartEvent event, Emitter<CartState> emit) {
    if (state is CartLoaded) {
      final currentCart = (state as CartLoaded).cart;
      emit(CartLoaded(CartEntity(
        cartId: currentCart.cartId,
        customerId: currentCart.customerId,
        isCheckedOut: false,
        items: const [],
      )));
    } else {
      emit(const CartLoaded(CartEntity(
        cartId: 0,
        customerId: 0,
        isCheckedOut: false,
        items: [],
      )));
    }
  }
}

