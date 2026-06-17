// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ReservationState)
final reservationStateProvider = ReservationStateProvider._();

final class ReservationStateProvider
    extends $NotifierProvider<ReservationState, AsyncValue<void>> {
  ReservationStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reservationStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reservationStateHash();

  @$internal
  @override
  ReservationState create() => ReservationState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$reservationStateHash() => r'3c56daab610a9fd083da77dd4d3968ef6b9df0fc';

abstract class _$ReservationState extends $Notifier<AsyncValue<void>> {
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

@ProviderFor(IsNewCustomer)
final isNewCustomerProvider = IsNewCustomerProvider._();

final class IsNewCustomerProvider
    extends $NotifierProvider<IsNewCustomer, bool> {
  IsNewCustomerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isNewCustomerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isNewCustomerHash();

  @$internal
  @override
  IsNewCustomer create() => IsNewCustomer();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isNewCustomerHash() => r'39bdb5b9671f39cc8195efd03681a96e6f90d812';

abstract class _$IsNewCustomer extends $Notifier<bool> {
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

@ProviderFor(SelectedCustomer)
final selectedCustomerProvider = SelectedCustomerProvider._();

final class SelectedCustomerProvider
    extends $NotifierProvider<SelectedCustomer, CustomerModel?> {
  SelectedCustomerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedCustomerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedCustomerHash();

  @$internal
  @override
  SelectedCustomer create() => SelectedCustomer();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CustomerModel? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CustomerModel?>(value),
    );
  }
}

String _$selectedCustomerHash() => r'9bfacf64d2b0bf4cf8716f45366b6551d32c37df';

abstract class _$SelectedCustomer extends $Notifier<CustomerModel?> {
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

@ProviderFor(CreateCustomerState)
final createCustomerStateProvider = CreateCustomerStateProvider._();

final class CreateCustomerStateProvider
    extends $NotifierProvider<CreateCustomerState, AsyncValue<CustomerModel?>> {
  CreateCustomerStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createCustomerStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createCustomerStateHash();

  @$internal
  @override
  CreateCustomerState create() => CreateCustomerState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<CustomerModel?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<CustomerModel?>>(value),
    );
  }
}

String _$createCustomerStateHash() =>
    r'd9b499a4529d2cc32e49b5696877bc7c62016dd2';

abstract class _$CreateCustomerState
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

@ProviderFor(allReservations)
final allReservationsProvider = AllReservationsProvider._();

final class AllReservationsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ReservationListItem>>,
          List<ReservationListItem>,
          FutureOr<List<ReservationListItem>>
        >
    with
        $FutureModifier<List<ReservationListItem>>,
        $FutureProvider<List<ReservationListItem>> {
  AllReservationsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allReservationsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allReservationsHash();

  @$internal
  @override
  $FutureProviderElement<List<ReservationListItem>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ReservationListItem>> create(Ref ref) {
    return allReservations(ref);
  }
}

String _$allReservationsHash() => r'3149c68a99cadea0afdf644d7968816c97fc12a0';

@ProviderFor(customerInfo)
final customerInfoProvider = CustomerInfoFamily._();

final class CustomerInfoProvider
    extends
        $FunctionalProvider<
          AsyncValue<CustomerModel>,
          CustomerModel,
          FutureOr<CustomerModel>
        >
    with $FutureModifier<CustomerModel>, $FutureProvider<CustomerModel> {
  CustomerInfoProvider._({
    required CustomerInfoFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'customerInfoProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$customerInfoHash();

  @override
  String toString() {
    return r'customerInfoProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<CustomerModel> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<CustomerModel> create(Ref ref) {
    final argument = this.argument as int;
    return customerInfo(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CustomerInfoProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$customerInfoHash() => r'6023e0981dca2cfb1bdca1814cccf0a20ebd082b';

final class CustomerInfoFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<CustomerModel>, int> {
  CustomerInfoFamily._()
    : super(
        retry: null,
        name: r'customerInfoProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CustomerInfoProvider call(int customerId) =>
      CustomerInfoProvider._(argument: customerId, from: this);

  @override
  String toString() => r'customerInfoProvider';
}

@ProviderFor(SelectedReservationId)
final selectedReservationIdProvider = SelectedReservationIdProvider._();

final class SelectedReservationIdProvider
    extends $NotifierProvider<SelectedReservationId, int?> {
  SelectedReservationIdProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedReservationIdProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedReservationIdHash();

  @$internal
  @override
  SelectedReservationId create() => SelectedReservationId();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int?>(value),
    );
  }
}

String _$selectedReservationIdHash() =>
    r'cc3296bcb54c0c24bcb4448e2e8d07326e01d329';

abstract class _$SelectedReservationId extends $Notifier<int?> {
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

@ProviderFor(reservationDetails)
final reservationDetailsProvider = ReservationDetailsFamily._();

final class ReservationDetailsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ReservationDetailItem>>,
          List<ReservationDetailItem>,
          FutureOr<List<ReservationDetailItem>>
        >
    with
        $FutureModifier<List<ReservationDetailItem>>,
        $FutureProvider<List<ReservationDetailItem>> {
  ReservationDetailsProvider._({
    required ReservationDetailsFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'reservationDetailsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$reservationDetailsHash();

  @override
  String toString() {
    return r'reservationDetailsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<ReservationDetailItem>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ReservationDetailItem>> create(Ref ref) {
    final argument = this.argument as int;
    return reservationDetails(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ReservationDetailsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$reservationDetailsHash() =>
    r'25db4bccc5c4c5e4f91bee0ad97399695ab898c6';

final class ReservationDetailsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<ReservationDetailItem>>, int> {
  ReservationDetailsFamily._()
    : super(
        retry: null,
        name: r'reservationDetailsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ReservationDetailsProvider call(int reservationId) =>
      ReservationDetailsProvider._(argument: reservationId, from: this);

  @override
  String toString() => r'reservationDetailsProvider';
}

@ProviderFor(CancelReservationState)
final cancelReservationStateProvider = CancelReservationStateProvider._();

final class CancelReservationStateProvider
    extends $NotifierProvider<CancelReservationState, AsyncValue<void>> {
  CancelReservationStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cancelReservationStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cancelReservationStateHash();

  @$internal
  @override
  CancelReservationState create() => CancelReservationState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$cancelReservationStateHash() =>
    r'49419400303bd1740a8e77c511508e6aeef46ad1';

abstract class _$CancelReservationState extends $Notifier<AsyncValue<void>> {
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

@ProviderFor(ReservationSearchQuery)
final reservationSearchQueryProvider = ReservationSearchQueryProvider._();

final class ReservationSearchQueryProvider
    extends $NotifierProvider<ReservationSearchQuery, String> {
  ReservationSearchQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reservationSearchQueryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reservationSearchQueryHash();

  @$internal
  @override
  ReservationSearchQuery create() => ReservationSearchQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$reservationSearchQueryHash() =>
    r'36ff924260c62f65eaf143a87879a71ce3dccf7a';

abstract class _$ReservationSearchQuery extends $Notifier<String> {
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
