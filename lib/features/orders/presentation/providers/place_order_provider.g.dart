// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_order_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PlaceOrderNotifier)
final placeOrderProvider = PlaceOrderNotifierProvider._();

final class PlaceOrderNotifierProvider
    extends $NotifierProvider<PlaceOrderNotifier, PlaceOrderState> {
  PlaceOrderNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'placeOrderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$placeOrderNotifierHash();

  @$internal
  @override
  PlaceOrderNotifier create() => PlaceOrderNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlaceOrderState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlaceOrderState>(value),
    );
  }
}

String _$placeOrderNotifierHash() =>
    r'c166747609ebe34df9d964626133084f2c586a0a';

abstract class _$PlaceOrderNotifier extends $Notifier<PlaceOrderState> {
  PlaceOrderState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<PlaceOrderState, PlaceOrderState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PlaceOrderState, PlaceOrderState>,
              PlaceOrderState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
