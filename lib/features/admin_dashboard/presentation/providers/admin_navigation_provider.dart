import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'admin_navigation_provider.g.dart';

@riverpod
class AdminDashboardTabController extends _$AdminDashboardTabController {
  @override
  int build() => 0;

  void set(int index) => state = index;
}

@riverpod
class OrdersTabController extends _$OrdersTabController {
  @override
  int build() => 0;

  void set(int index) => state = index;
}
