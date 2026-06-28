import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'manage_orders_provider.g.dart';

@riverpod
class ManageOrdersMainTab extends _$ManageOrdersMainTab {
  @override
  String build() => 'Confirmed';
  void set(String tab) => state = tab;
}

@riverpod
class ManageOrdersStatusTab extends _$ManageOrdersStatusTab {
  @override
  String build() => 'Pending';
  void set(String status) => state = status;
}

@riverpod
class ManageOrdersSearchQuery extends _$ManageOrdersSearchQuery {
  @override
  String build() => '';
  void set(String query) => state = query;
}

@riverpod
class ManageOrdersBulkLoading extends _$ManageOrdersBulkLoading {
  @override
  String? build() => null; // Use String to track which specific action is loading
  void set(String? action) => state = action;
}

@riverpod
class ManageOrdersItemLoading extends _$ManageOrdersItemLoading {
  @override
  Set<int> build() => {};
  
  void set(int productId, bool loading) {
    if (loading) {
      state = {...state, productId};
    } else {
      state = state.where((id) => id != productId).toSet();
    }
  }

  bool isLoading(int productId) => state.contains(productId);
}
