// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OrderController)
final orderControllerProvider = OrderControllerProvider._();

final class OrderControllerProvider
    extends $AsyncNotifierProvider<OrderController, List<GroupedOrder>> {
  OrderControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'orderControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$orderControllerHash();

  @$internal
  @override
  OrderController create() => OrderController();
}

String _$orderControllerHash() => r'c110ea74119b867210bb0c25f7a9ddcc7f189f76';

abstract class _$OrderController extends $AsyncNotifier<List<GroupedOrder>> {
  FutureOr<List<GroupedOrder>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<GroupedOrder>>, List<GroupedOrder>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<GroupedOrder>>, List<GroupedOrder>>,
              AsyncValue<List<GroupedOrder>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
