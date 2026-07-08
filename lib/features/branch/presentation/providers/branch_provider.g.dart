// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(branches)
final branchesProvider = BranchesProvider._();

final class BranchesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<BranchModel>>,
          List<BranchModel>,
          FutureOr<List<BranchModel>>
        >
    with
        $FutureModifier<List<BranchModel>>,
        $FutureProvider<List<BranchModel>> {
  BranchesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'branchesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$branchesHash();

  @$internal
  @override
  $FutureProviderElement<List<BranchModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<BranchModel>> create(Ref ref) {
    return branches(ref);
  }
}

String _$branchesHash() => r'1100b2d96e086b7e133037eb84e9e74ddb3d497b';

@ProviderFor(BranchSearchQuery)
final branchSearchQueryProvider = BranchSearchQueryProvider._();

final class BranchSearchQueryProvider
    extends $NotifierProvider<BranchSearchQuery, String> {
  BranchSearchQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'branchSearchQueryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$branchSearchQueryHash();

  @$internal
  @override
  BranchSearchQuery create() => BranchSearchQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$branchSearchQueryHash() => r'7424908a3c69f55db156c04a089b129b3b205c03';

abstract class _$BranchSearchQuery extends $Notifier<String> {
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

@ProviderFor(SelectedBranchForEdit)
final selectedBranchForEditProvider = SelectedBranchForEditProvider._();

final class SelectedBranchForEditProvider
    extends $NotifierProvider<SelectedBranchForEdit, BranchModel?> {
  SelectedBranchForEditProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedBranchForEditProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedBranchForEditHash();

  @$internal
  @override
  SelectedBranchForEdit create() => SelectedBranchForEdit();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BranchModel? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BranchModel?>(value),
    );
  }
}

String _$selectedBranchForEditHash() =>
    r'6e271af86e31d84e925a6459e3800259e40d9483';

abstract class _$SelectedBranchForEdit extends $Notifier<BranchModel?> {
  BranchModel? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<BranchModel?, BranchModel?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BranchModel?, BranchModel?>,
              BranchModel?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(IsAddingBranch)
final isAddingBranchProvider = IsAddingBranchProvider._();

final class IsAddingBranchProvider
    extends $NotifierProvider<IsAddingBranch, bool> {
  IsAddingBranchProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isAddingBranchProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isAddingBranchHash();

  @$internal
  @override
  IsAddingBranch create() => IsAddingBranch();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isAddingBranchHash() => r'b9b79d73b902c9512515d49c168e6389362b1611';

abstract class _$IsAddingBranch extends $Notifier<bool> {
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

@ProviderFor(AddBranchState)
final addBranchStateProvider = AddBranchStateProvider._();

final class AddBranchStateProvider
    extends $NotifierProvider<AddBranchState, AsyncValue<void>> {
  AddBranchStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addBranchStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addBranchStateHash();

  @$internal
  @override
  AddBranchState create() => AddBranchState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$addBranchStateHash() => r'ec4332659f50d1eb00d8cdfff8162e011788c869';

abstract class _$AddBranchState extends $Notifier<AsyncValue<void>> {
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

@ProviderFor(UpdateBranchState)
final updateBranchStateProvider = UpdateBranchStateProvider._();

final class UpdateBranchStateProvider
    extends $NotifierProvider<UpdateBranchState, AsyncValue<void>> {
  UpdateBranchStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateBranchStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateBranchStateHash();

  @$internal
  @override
  UpdateBranchState create() => UpdateBranchState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$updateBranchStateHash() => r'e816f1130dc0ce1ff358b225aab79f6c96c9c58b';

abstract class _$UpdateBranchState extends $Notifier<AsyncValue<void>> {
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

@ProviderFor(DeleteBranchState)
final deleteBranchStateProvider = DeleteBranchStateProvider._();

final class DeleteBranchStateProvider
    extends $NotifierProvider<DeleteBranchState, AsyncValue<void>> {
  DeleteBranchStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deleteBranchStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deleteBranchStateHash();

  @$internal
  @override
  DeleteBranchState create() => DeleteBranchState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$deleteBranchStateHash() => r'0c4660e7d096efe96fc5276c3efa34af0efc6d26';

abstract class _$DeleteBranchState extends $Notifier<AsyncValue<void>> {
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

@ProviderFor(filteredBranches)
final filteredBranchesProvider = FilteredBranchesProvider._();

final class FilteredBranchesProvider
    extends
        $FunctionalProvider<
          List<BranchModel>,
          List<BranchModel>,
          List<BranchModel>
        >
    with $Provider<List<BranchModel>> {
  FilteredBranchesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredBranchesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredBranchesHash();

  @$internal
  @override
  $ProviderElement<List<BranchModel>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<BranchModel> create(Ref ref) {
    return filteredBranches(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<BranchModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<BranchModel>>(value),
    );
  }
}

String _$filteredBranchesHash() => r'0eb4ee9976cecf2a009d8ada67df2c6491df931b';
