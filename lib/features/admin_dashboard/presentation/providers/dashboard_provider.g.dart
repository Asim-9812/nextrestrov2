// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(orderStats)
final orderStatsProvider = OrderStatsProvider._();

final class OrderStatsProvider
    extends
        $FunctionalProvider<
          AsyncValue<OrderStats>,
          OrderStats,
          FutureOr<OrderStats>
        >
    with $FutureModifier<OrderStats>, $FutureProvider<OrderStats> {
  OrderStatsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'orderStatsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$orderStatsHash();

  @$internal
  @override
  $FutureProviderElement<OrderStats> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<OrderStats> create(Ref ref) {
    return orderStats(ref);
  }
}

String _$orderStatsHash() => r'55c484e3a0ab268f0f91ce3ed1ee147d533e4e57';
