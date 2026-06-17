// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Customers)
final customersProvider = CustomersProvider._();

final class CustomersProvider
    extends $AsyncNotifierProvider<Customers, List<CustomerModel>> {
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
  Customers create() => Customers();
}

String _$customersHash() => r'ba7a5c385e04fbf04ef3b2155011e1c4d1a9e905';

abstract class _$Customers extends $AsyncNotifier<List<CustomerModel>> {
  FutureOr<List<CustomerModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<CustomerModel>>, List<CustomerModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<CustomerModel>>, List<CustomerModel>>,
              AsyncValue<List<CustomerModel>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
