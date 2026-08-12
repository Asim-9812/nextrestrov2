part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object> get props => [];
}

class ToggleWishlist extends WishlistEvent {
  final Product product;

  const ToggleWishlist(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveFromWishlist extends WishlistEvent {
  final String productId;

  const RemoveFromWishlist(this.productId);

  @override
  List<Object> get props => [productId];
}

class ClearWishlist extends WishlistEvent {
  const ClearWishlist();
}
