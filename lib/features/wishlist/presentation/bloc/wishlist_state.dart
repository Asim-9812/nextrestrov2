part of 'wishlist_bloc.dart';

class WishlistState extends Equatable {
  final List<Product> items;

  const WishlistState({this.items = const []});

  WishlistState copyWith({
    List<Product>? items,
  }) {
    return WishlistState(
      items: items ?? this.items,
    );
  }

  bool isFavorite(String productId) {
    return items.any((item) => item.id == productId);
  }

  @override
  List<Object> get props => [items];
}
