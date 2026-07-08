// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher_type_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(voucherTypes)
final voucherTypesProvider = VoucherTypesProvider._();

final class VoucherTypesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<VoucherTypeModel>>,
          List<VoucherTypeModel>,
          FutureOr<List<VoucherTypeModel>>
        >
    with
        $FutureModifier<List<VoucherTypeModel>>,
        $FutureProvider<List<VoucherTypeModel>> {
  VoucherTypesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'voucherTypesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$voucherTypesHash();

  @$internal
  @override
  $FutureProviderElement<List<VoucherTypeModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<VoucherTypeModel>> create(Ref ref) {
    return voucherTypes(ref);
  }
}

String _$voucherTypesHash() => r'e7de80d4efba020dd8e61b172bb55fb26a8cd885';
