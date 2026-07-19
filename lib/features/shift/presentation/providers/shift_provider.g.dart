// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ShiftController)
final shiftControllerProvider = ShiftControllerProvider._();

final class ShiftControllerProvider
    extends $AsyncNotifierProvider<ShiftController, (ShiftModel?, String?)> {
  ShiftControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shiftControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shiftControllerHash();

  @$internal
  @override
  ShiftController create() => ShiftController();
}

String _$shiftControllerHash() => r'8ac6705419850309648b8e71ee670251969cd85c';

abstract class _$ShiftController
    extends $AsyncNotifier<(ShiftModel?, String?)> {
  FutureOr<(ShiftModel?, String?)> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<(ShiftModel?, String?)>, (ShiftModel?, String?)>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<(ShiftModel?, String?)>,
                (ShiftModel?, String?)
              >,
              AsyncValue<(ShiftModel?, String?)>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
