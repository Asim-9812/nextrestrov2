// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_navigation_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AdminDashboardTabController)
final adminDashboardTabControllerProvider =
    AdminDashboardTabControllerProvider._();

final class AdminDashboardTabControllerProvider
    extends $NotifierProvider<AdminDashboardTabController, int> {
  AdminDashboardTabControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'adminDashboardTabControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$adminDashboardTabControllerHash();

  @$internal
  @override
  AdminDashboardTabController create() => AdminDashboardTabController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$adminDashboardTabControllerHash() =>
    r'f57dcd5293e0ef3d18c576cc6dab6498e315e6c9';

abstract class _$AdminDashboardTabController extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(OrdersTabController)
final ordersTabControllerProvider = OrdersTabControllerProvider._();

final class OrdersTabControllerProvider
    extends $NotifierProvider<OrdersTabController, int> {
  OrdersTabControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ordersTabControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ordersTabControllerHash();

  @$internal
  @override
  OrdersTabController create() => OrdersTabController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$ordersTabControllerHash() =>
    r'1d1171368e6a7cf27598849069f01ece02c7e1d7';

abstract class _$OrdersTabController extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
