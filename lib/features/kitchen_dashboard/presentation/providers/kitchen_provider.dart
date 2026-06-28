import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'kitchen_provider.g.dart';

@riverpod
class KitchenMenuIndex extends _$KitchenMenuIndex {
  @override
  int build() => 0;

  void set(int index) => state = index;
}

@riverpod
class KitchenSubMenuIndex extends _$KitchenSubMenuIndex {
  @override
  int build() => 0;

  void set(int index) => state = index;
}
