part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  int get totalItems => 0;
  double get totalPrice => 0.0;

  @override
  List<Object?> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final CartEntity cart;

  const CartLoaded(this.cart);

  @override
  int get totalItems => cart.totalItems;
  @override
  double get totalPrice => cart.totalPrice;

  @override
  List<Object?> get props => [cart];
}

class CartError extends CartState {
  final String message;

  const CartError(this.message);

  @override
  List<Object?> get props => [message];
}

class CartCheckoutSuccess extends CartState {}
