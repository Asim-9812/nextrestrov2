// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_management_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ShiftManagementController)
final shiftManagementControllerProvider = ShiftManagementControllerProvider._();

final class ShiftManagementControllerProvider
    extends
        $AsyncNotifierProvider<
          ShiftManagementController,
          ShiftManagementState
        > {
  ShiftManagementControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shiftManagementControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shiftManagementControllerHash();

  @$internal
  @override
  ShiftManagementController create() => ShiftManagementController();
}

String _$shiftManagementControllerHash() =>
    r'557d0ea017ca781c459da89c62a7ca3dcd0dcdb1';

abstract class _$ShiftManagementController
    extends $AsyncNotifier<ShiftManagementState> {
  FutureOr<ShiftManagementState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<ShiftManagementState>, ShiftManagementState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<ShiftManagementState>,
                ShiftManagementState
              >,
              AsyncValue<ShiftManagementState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
