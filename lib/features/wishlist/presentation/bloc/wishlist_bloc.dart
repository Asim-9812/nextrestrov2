import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../product/domain/entities/product.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(const WishlistState()) {
    on<ToggleWishlist>(_onToggleWishlist);
    on<RemoveFromWishlist>(_onRemoveFromWishlist);
    on<ClearWishlist>(_onClearWishlist);
  }

  void _onToggleWishlist(ToggleWishlist event, Emitter<WishlistState> emit) {
    final updatedItems = List<Product>.from(state.items);
    final existingIndex = updatedItems.indexWhere((item) => item.id == event.product.id);

    if (existingIndex >= 0) {
      updatedItems.removeAt(existingIndex);
    } else {
      updatedItems.add(event.product);
    }

    emit(state.copyWith(items: updatedItems));
  }

  void _onRemoveFromWishlist(RemoveFromWishlist event, Emitter<WishlistState> emit) {
    final updatedItems = state.items.where((item) => item.id != event.productId).toList();
    emit(state.copyWith(items: updatedItems));
  }

  void _onClearWishlist(ClearWishlist event, Emitter<WishlistState> emit) {
    emit(state.copyWith(items: const []));
  }
}
