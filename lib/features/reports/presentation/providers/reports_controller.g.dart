// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SalesReportController)
final salesReportControllerProvider = SalesReportControllerProvider._();

final class SalesReportControllerProvider
    extends
        $NotifierProvider<SalesReportController, AsyncValue<SalesReportData?>> {
  SalesReportControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'salesReportControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$salesReportControllerHash();

  @$internal
  @override
  SalesReportController create() => SalesReportController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<SalesReportData?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<SalesReportData?>>(value),
    );
  }
}

String _$salesReportControllerHash() =>
    r'4e35b7c2170aed6fcc837f38a5a752361c313c6c';

abstract class _$SalesReportController
    extends $Notifier<AsyncValue<SalesReportData?>> {
  AsyncValue<SalesReportData?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<SalesReportData?>, AsyncValue<SalesReportData?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<SalesReportData?>,
                AsyncValue<SalesReportData?>
              >,
              AsyncValue<SalesReportData?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(ProductSalesReportController)
final productSalesReportControllerProvider =
    ProductSalesReportControllerProvider._();

final class ProductSalesReportControllerProvider
    extends
        $NotifierProvider<
          ProductSalesReportController,
          AsyncValue<ProductSalesReportData?>
        > {
  ProductSalesReportControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productSalesReportControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productSalesReportControllerHash();

  @$internal
  @override
  ProductSalesReportController create() => ProductSalesReportController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<ProductSalesReportData?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<ProductSalesReportData?>>(
        value,
      ),
    );
  }
}

String _$productSalesReportControllerHash() =>
    r'9658bdb0e2c0c18aa06a5fac895b416f87ff8486';

abstract class _$ProductSalesReportController
    extends $Notifier<AsyncValue<ProductSalesReportData?>> {
  AsyncValue<ProductSalesReportData?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<ProductSalesReportData?>,
              AsyncValue<ProductSalesReportData?>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<ProductSalesReportData?>,
                AsyncValue<ProductSalesReportData?>
              >,
              AsyncValue<ProductSalesReportData?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(CustomerSalesReportController)
final customerSalesReportControllerProvider =
    CustomerSalesReportControllerProvider._();

final class CustomerSalesReportControllerProvider
    extends
        $NotifierProvider<
          CustomerSalesReportController,
          AsyncValue<CustomerSalesReportData?>
        > {
  CustomerSalesReportControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'customerSalesReportControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$customerSalesReportControllerHash();

  @$internal
  @override
  CustomerSalesReportController create() => CustomerSalesReportController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<CustomerSalesReportData?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<AsyncValue<CustomerSalesReportData?>>(value),
    );
  }
}

String _$customerSalesReportControllerHash() =>
    r'1a62da415577c7756bf5f02da3024319497b7c9f';

abstract class _$CustomerSalesReportController
    extends $Notifier<AsyncValue<CustomerSalesReportData?>> {
  AsyncValue<CustomerSalesReportData?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<CustomerSalesReportData?>,
              AsyncValue<CustomerSalesReportData?>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<CustomerSalesReportData?>,
                AsyncValue<CustomerSalesReportData?>
              >,
              AsyncValue<CustomerSalesReportData?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(SelectedReportTab)
final selectedReportTabProvider = SelectedReportTabProvider._();

final class SelectedReportTabProvider
    extends $NotifierProvider<SelectedReportTab, int> {
  SelectedReportTabProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedReportTabProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedReportTabHash();

  @$internal
  @override
  SelectedReportTab create() => SelectedReportTab();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$selectedReportTabHash() => r'370b8c0262f766a355306327b8ebdf550a42802f';

abstract class _$SelectedReportTab extends $Notifier<int> {
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
