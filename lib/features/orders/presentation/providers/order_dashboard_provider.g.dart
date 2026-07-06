// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_dashboard_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OrderDashboard)
final orderDashboardProvider = OrderDashboardProvider._();

final class OrderDashboardProvider
    extends $StreamNotifierProvider<OrderDashboard, OrderDashboardState> {
  OrderDashboardProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'orderDashboardProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$orderDashboardHash();

  @$internal
  @override
  OrderDashboard create() => OrderDashboard();
}

String _$orderDashboardHash() => r'2043318c0f13a75313e3367715554c7a4a1b6dd8';

abstract class _$OrderDashboard extends $StreamNotifier<OrderDashboardState> {
  Stream<OrderDashboardState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<OrderDashboardState>, OrderDashboardState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<OrderDashboardState>, OrderDashboardState>,
              AsyncValue<OrderDashboardState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(OrderSearchQuery)
final orderSearchQueryProvider = OrderSearchQueryProvider._();

final class OrderSearchQueryProvider
    extends $NotifierProvider<OrderSearchQuery, String> {
  OrderSearchQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'orderSearchQueryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$orderSearchQueryHash();

  @$internal
  @override
  OrderSearchQuery create() => OrderSearchQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$orderSearchQueryHash() => r'304c054f286ba2364fae5815a8aaefde2c67c542';

abstract class _$OrderSearchQuery extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(OrderStatusTab)
final orderStatusTabProvider = OrderStatusTabProvider._();

final class OrderStatusTabProvider
    extends $NotifierProvider<OrderStatusTab, String> {
  OrderStatusTabProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'orderStatusTabProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$orderStatusTabHash();

  @$internal
  @override
  OrderStatusTab create() => OrderStatusTab();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$orderStatusTabHash() => r'8f70e771c1dd266f53ef39a45537709e2f651ca2';

abstract class _$OrderStatusTab extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(SelectedOrderItemId)
final selectedOrderItemIdProvider = SelectedOrderItemIdProvider._();

final class SelectedOrderItemIdProvider
    extends $NotifierProvider<SelectedOrderItemId, int?> {
  SelectedOrderItemIdProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedOrderItemIdProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedOrderItemIdHash();

  @$internal
  @override
  SelectedOrderItemId create() => SelectedOrderItemId();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int?>(value),
    );
  }
}

String _$selectedOrderItemIdHash() =>
    r'9d2ad81096bad7ee2035dccfc1f756aaf1e15cba';

abstract class _$SelectedOrderItemId extends $Notifier<int?> {
  int? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int?, int?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int?, int?>,
              int?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(SelectedOrderId)
final selectedOrderIdProvider = SelectedOrderIdProvider._();

final class SelectedOrderIdProvider
    extends $NotifierProvider<SelectedOrderId, int?> {
  SelectedOrderIdProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedOrderIdProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedOrderIdHash();

  @$internal
  @override
  SelectedOrderId create() => SelectedOrderId();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int?>(value),
    );
  }
}

String _$selectedOrderIdHash() => r'104ac7e347a0a8eec9f3cc01a265acdc4a35669f';

abstract class _$SelectedOrderId extends $Notifier<int?> {
  int? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int?, int?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int?, int?>,
              int?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(SelectedPendingOrderId)
final selectedPendingOrderIdProvider = SelectedPendingOrderIdProvider._();

final class SelectedPendingOrderIdProvider
    extends $NotifierProvider<SelectedPendingOrderId, int?> {
  SelectedPendingOrderIdProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedPendingOrderIdProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedPendingOrderIdHash();

  @$internal
  @override
  SelectedPendingOrderId create() => SelectedPendingOrderId();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int?>(value),
    );
  }
}

String _$selectedPendingOrderIdHash() =>
    r'd38439903d2299ce9aee4e89734eef8836c01897';

abstract class _$SelectedPendingOrderId extends $Notifier<int?> {
  int? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int?, int?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int?, int?>,
              int?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(SelectedCompletedOrderId)
final selectedCompletedOrderIdProvider = SelectedCompletedOrderIdProvider._();

final class SelectedCompletedOrderIdProvider
    extends $NotifierProvider<SelectedCompletedOrderId, int?> {
  SelectedCompletedOrderIdProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedCompletedOrderIdProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedCompletedOrderIdHash();

  @$internal
  @override
  SelectedCompletedOrderId create() => SelectedCompletedOrderId();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int?>(value),
    );
  }
}

String _$selectedCompletedOrderIdHash() =>
    r'49aca9c48c20b73d3ae862523a81d6a83dada915';

abstract class _$SelectedCompletedOrderId extends $Notifier<int?> {
  int? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int?, int?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int?, int?>,
              int?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(selectedOrderDetails)
final selectedOrderDetailsProvider = SelectedOrderDetailsProvider._();

final class SelectedOrderDetailsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<OrderDetailModel>?>,
          List<OrderDetailModel>?,
          FutureOr<List<OrderDetailModel>?>
        >
    with
        $FutureModifier<List<OrderDetailModel>?>,
        $FutureProvider<List<OrderDetailModel>?> {
  SelectedOrderDetailsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedOrderDetailsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedOrderDetailsHash();

  @$internal
  @override
  $FutureProviderElement<List<OrderDetailModel>?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<OrderDetailModel>?> create(Ref ref) {
    return selectedOrderDetails(ref);
  }
}

String _$selectedOrderDetailsHash() =>
    r'499608a46ee12ff8d8ef8442ad0ac2233adb1990';

@ProviderFor(selectedPendingOrderDetails)
final selectedPendingOrderDetailsProvider =
    SelectedPendingOrderDetailsProvider._();

final class SelectedPendingOrderDetailsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<OrderDetailModel>?>,
          List<OrderDetailModel>?,
          FutureOr<List<OrderDetailModel>?>
        >
    with
        $FutureModifier<List<OrderDetailModel>?>,
        $FutureProvider<List<OrderDetailModel>?> {
  SelectedPendingOrderDetailsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedPendingOrderDetailsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedPendingOrderDetailsHash();

  @$internal
  @override
  $FutureProviderElement<List<OrderDetailModel>?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<OrderDetailModel>?> create(Ref ref) {
    return selectedPendingOrderDetails(ref);
  }
}

String _$selectedPendingOrderDetailsHash() =>
    r'f3bc611ed1aad819ff327b0c61cef5d7886c557e';

@ProviderFor(selectedCompletedOrderDetails)
final selectedCompletedOrderDetailsProvider =
    SelectedCompletedOrderDetailsProvider._();

final class SelectedCompletedOrderDetailsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<OrderDetailModel>?>,
          List<OrderDetailModel>?,
          FutureOr<List<OrderDetailModel>?>
        >
    with
        $FutureModifier<List<OrderDetailModel>?>,
        $FutureProvider<List<OrderDetailModel>?> {
  SelectedCompletedOrderDetailsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedCompletedOrderDetailsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedCompletedOrderDetailsHash();

  @$internal
  @override
  $FutureProviderElement<List<OrderDetailModel>?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<OrderDetailModel>?> create(Ref ref) {
    return selectedCompletedOrderDetails(ref);
  }
}

String _$selectedCompletedOrderDetailsHash() =>
    r'9665d75f200c8fb1b39c1068ffbc9378f896c261';
