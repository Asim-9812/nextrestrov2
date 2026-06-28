// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kitchen_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(KitchenMenuIndex)
final kitchenMenuIndexProvider = KitchenMenuIndexProvider._();

final class KitchenMenuIndexProvider
    extends $NotifierProvider<KitchenMenuIndex, int> {
  KitchenMenuIndexProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'kitchenMenuIndexProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$kitchenMenuIndexHash();

  @$internal
  @override
  KitchenMenuIndex create() => KitchenMenuIndex();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$kitchenMenuIndexHash() => r'4ad1df6a4b9197510f74f503e8b466faa847b609';

abstract class _$KitchenMenuIndex extends $Notifier<int> {
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

@ProviderFor(KitchenSubMenuIndex)
final kitchenSubMenuIndexProvider = KitchenSubMenuIndexProvider._();

final class KitchenSubMenuIndexProvider
    extends $NotifierProvider<KitchenSubMenuIndex, int> {
  KitchenSubMenuIndexProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'kitchenSubMenuIndexProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$kitchenSubMenuIndexHash();

  @$internal
  @override
  KitchenSubMenuIndex create() => KitchenSubMenuIndex();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$kitchenSubMenuIndexHash() =>
    r'6c933584393aaa141662ebac3b1c1b8be0aa422e';

abstract class _$KitchenSubMenuIndex extends $Notifier<int> {
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
