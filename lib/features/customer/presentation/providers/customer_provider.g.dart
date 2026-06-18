// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(customers)
final customersProvider = CustomersProvider._();

final class CustomersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CustomerModel>>,
          List<CustomerModel>,
          FutureOr<List<CustomerModel>>
        >
    with
        $FutureModifier<List<CustomerModel>>,
        $FutureProvider<List<CustomerModel>> {
  CustomersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'customersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$customersHash();

  @$internal
  @override
  $FutureProviderElement<List<CustomerModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<CustomerModel>> create(Ref ref) {
    return customers(ref);
  }
}

String _$customersHash() => r'a295dcd36a9e0561d04e21e4743b1614837ae9fc';

@ProviderFor(CustomerSearchQuery)
final customerSearchQueryProvider = CustomerSearchQueryProvider._();

final class CustomerSearchQueryProvider
    extends $NotifierProvider<CustomerSearchQuery, String> {
  CustomerSearchQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'customerSearchQueryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$customerSearchQueryHash();

  @$internal
  @override
  CustomerSearchQuery create() => CustomerSearchQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$customerSearchQueryHash() =>
    r'966ca65869839d1096258d362d7153bb3f04e8bd';

abstract class _$CustomerSearchQuery extends $Notifier<String> {
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

@ProviderFor(CustomerFilter)
final customerFilterProvider = CustomerFilterProvider._();

final class CustomerFilterProvider
    extends $NotifierProvider<CustomerFilter, CustomerFilterType> {
  CustomerFilterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'customerFilterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$customerFilterHash();

  @$internal
  @override
  CustomerFilter create() => CustomerFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CustomerFilterType value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CustomerFilterType>(value),
    );
  }
}

String _$customerFilterHash() => r'260814266897e81a4e0814bc4cf85ee68eadf627';

abstract class _$CustomerFilter extends $Notifier<CustomerFilterType> {
  CustomerFilterType build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<CustomerFilterType, CustomerFilterType>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CustomerFilterType, CustomerFilterType>,
              CustomerFilterType,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(SelectedCustomerForEdit)
final selectedCustomerForEditProvider = SelectedCustomerForEditProvider._();

final class SelectedCustomerForEditProvider
    extends $NotifierProvider<SelectedCustomerForEdit, CustomerModel?> {
  SelectedCustomerForEditProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedCustomerForEditProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedCustomerForEditHash();

  @$internal
  @override
  SelectedCustomerForEdit create() => SelectedCustomerForEdit();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CustomerModel? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CustomerModel?>(value),
    );
  }
}

String _$selectedCustomerForEditHash() =>
    r'17c9cf3c278e1a7299aae82c447bd35ce7bcb7f6';

abstract class _$SelectedCustomerForEdit extends $Notifier<CustomerModel?> {
  CustomerModel? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<CustomerModel?, CustomerModel?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CustomerModel?, CustomerModel?>,
              CustomerModel?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(IsAddingCustomer)
final isAddingCustomerProvider = IsAddingCustomerProvider._();

final class IsAddingCustomerProvider
    extends $NotifierProvider<IsAddingCustomer, bool> {
  IsAddingCustomerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isAddingCustomerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isAddingCustomerHash();

  @$internal
  @override
  IsAddingCustomer create() => IsAddingCustomer();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isAddingCustomerHash() => r'18921b4a77ca8b30350447debfa5b446d4d29246';

abstract class _$IsAddingCustomer extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(AddCustomerState)
final addCustomerStateProvider = AddCustomerStateProvider._();

final class AddCustomerStateProvider
    extends $NotifierProvider<AddCustomerState, AsyncValue<CustomerModel?>> {
  AddCustomerStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addCustomerStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addCustomerStateHash();

  @$internal
  @override
  AddCustomerState create() => AddCustomerState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<CustomerModel?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<CustomerModel?>>(value),
    );
  }
}

String _$addCustomerStateHash() => r'af802952656fd553c530441378dc7263c07c63c8';

abstract class _$AddCustomerState
    extends $Notifier<AsyncValue<CustomerModel?>> {
  AsyncValue<CustomerModel?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<CustomerModel?>, AsyncValue<CustomerModel?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<CustomerModel?>,
                AsyncValue<CustomerModel?>
              >,
              AsyncValue<CustomerModel?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(UpdateCustomerState)
final updateCustomerStateProvider = UpdateCustomerStateProvider._();

final class UpdateCustomerStateProvider
    extends $NotifierProvider<UpdateCustomerState, AsyncValue<void>> {
  UpdateCustomerStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateCustomerStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateCustomerStateHash();

  @$internal
  @override
  UpdateCustomerState create() => UpdateCustomerState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$updateCustomerStateHash() =>
    r'1f034e1df52a20c070e532779c2d71b737fc7bb1';

abstract class _$UpdateCustomerState extends $Notifier<AsyncValue<void>> {
  AsyncValue<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, AsyncValue<void>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, AsyncValue<void>>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(DeleteCustomerState)
final deleteCustomerStateProvider = DeleteCustomerStateProvider._();

final class DeleteCustomerStateProvider
    extends $NotifierProvider<DeleteCustomerState, AsyncValue<void>> {
  DeleteCustomerStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deleteCustomerStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deleteCustomerStateHash();

  @$internal
  @override
  DeleteCustomerState create() => DeleteCustomerState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$deleteCustomerStateHash() =>
    r'9344150fb51fff653ce7e48f9d1eb773703999da';

abstract class _$DeleteCustomerState extends $Notifier<AsyncValue<void>> {
  AsyncValue<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, AsyncValue<void>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, AsyncValue<void>>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(filteredCustomers)
final filteredCustomersProvider = FilteredCustomersProvider._();

final class FilteredCustomersProvider
    extends
        $FunctionalProvider<
          List<CustomerModel>,
          List<CustomerModel>,
          List<CustomerModel>
        >
    with $Provider<List<CustomerModel>> {
  FilteredCustomersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredCustomersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredCustomersHash();

  @$internal
  @override
  $ProviderElement<List<CustomerModel>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<CustomerModel> create(Ref ref) {
    return filteredCustomers(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<CustomerModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<CustomerModel>>(value),
    );
  }
}

String _$filteredCustomersHash() => r'83325e4be3edc1f8d53567aac60209df1ac52fd5';
