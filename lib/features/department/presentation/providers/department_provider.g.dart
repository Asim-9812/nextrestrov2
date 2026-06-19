// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(departments)
final departmentsProvider = DepartmentsProvider._();

final class DepartmentsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<DepartmentModel>>,
          List<DepartmentModel>,
          FutureOr<List<DepartmentModel>>
        >
    with
        $FutureModifier<List<DepartmentModel>>,
        $FutureProvider<List<DepartmentModel>> {
  DepartmentsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'departmentsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$departmentsHash();

  @$internal
  @override
  $FutureProviderElement<List<DepartmentModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<DepartmentModel>> create(Ref ref) {
    return departments(ref);
  }
}

String _$departmentsHash() => r'aae8d9522551a17daddb2749d01cfb77a309ead7';

@ProviderFor(DepartmentSearchQuery)
final departmentSearchQueryProvider = DepartmentSearchQueryProvider._();

final class DepartmentSearchQueryProvider
    extends $NotifierProvider<DepartmentSearchQuery, String> {
  DepartmentSearchQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'departmentSearchQueryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$departmentSearchQueryHash();

  @$internal
  @override
  DepartmentSearchQuery create() => DepartmentSearchQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$departmentSearchQueryHash() =>
    r'd656377d002374c798f8cac71c3faddb6a795776';

abstract class _$DepartmentSearchQuery extends $Notifier<String> {
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

@ProviderFor(SelectedDepartmentForEdit)
final selectedDepartmentForEditProvider = SelectedDepartmentForEditProvider._();

final class SelectedDepartmentForEditProvider
    extends $NotifierProvider<SelectedDepartmentForEdit, DepartmentModel?> {
  SelectedDepartmentForEditProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedDepartmentForEditProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedDepartmentForEditHash();

  @$internal
  @override
  SelectedDepartmentForEdit create() => SelectedDepartmentForEdit();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DepartmentModel? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DepartmentModel?>(value),
    );
  }
}

String _$selectedDepartmentForEditHash() =>
    r'0cb9b0f66dc1868b2577e325cdf39ce73569792c';

abstract class _$SelectedDepartmentForEdit extends $Notifier<DepartmentModel?> {
  DepartmentModel? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<DepartmentModel?, DepartmentModel?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DepartmentModel?, DepartmentModel?>,
              DepartmentModel?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(IsAddingDepartment)
final isAddingDepartmentProvider = IsAddingDepartmentProvider._();

final class IsAddingDepartmentProvider
    extends $NotifierProvider<IsAddingDepartment, bool> {
  IsAddingDepartmentProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isAddingDepartmentProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isAddingDepartmentHash();

  @$internal
  @override
  IsAddingDepartment create() => IsAddingDepartment();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isAddingDepartmentHash() =>
    r'ed12f54d53f305b08c22ecd019364d8aee321fe1';

abstract class _$IsAddingDepartment extends $Notifier<bool> {
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

@ProviderFor(AddDepartmentState)
final addDepartmentStateProvider = AddDepartmentStateProvider._();

final class AddDepartmentStateProvider
    extends $NotifierProvider<AddDepartmentState, AsyncValue<void>> {
  AddDepartmentStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addDepartmentStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addDepartmentStateHash();

  @$internal
  @override
  AddDepartmentState create() => AddDepartmentState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$addDepartmentStateHash() =>
    r'9d1165e366dda0df7cd1caca249a5c8f05df2211';

abstract class _$AddDepartmentState extends $Notifier<AsyncValue<void>> {
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

@ProviderFor(UpdateDepartmentState)
final updateDepartmentStateProvider = UpdateDepartmentStateProvider._();

final class UpdateDepartmentStateProvider
    extends $NotifierProvider<UpdateDepartmentState, AsyncValue<void>> {
  UpdateDepartmentStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateDepartmentStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateDepartmentStateHash();

  @$internal
  @override
  UpdateDepartmentState create() => UpdateDepartmentState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$updateDepartmentStateHash() =>
    r'8a7f0535cc9619e2e2276fde0f3ac0c4d876ae76';

abstract class _$UpdateDepartmentState extends $Notifier<AsyncValue<void>> {
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

@ProviderFor(DeleteDepartmentState)
final deleteDepartmentStateProvider = DeleteDepartmentStateProvider._();

final class DeleteDepartmentStateProvider
    extends $NotifierProvider<DeleteDepartmentState, AsyncValue<void>> {
  DeleteDepartmentStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deleteDepartmentStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deleteDepartmentStateHash();

  @$internal
  @override
  DeleteDepartmentState create() => DeleteDepartmentState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$deleteDepartmentStateHash() =>
    r'b85280e0b000d0b855c2b743b9d3152a83f88d6a';

abstract class _$DeleteDepartmentState extends $Notifier<AsyncValue<void>> {
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

@ProviderFor(filteredDepartments)
final filteredDepartmentsProvider = FilteredDepartmentsProvider._();

final class FilteredDepartmentsProvider
    extends
        $FunctionalProvider<
          List<DepartmentModel>,
          List<DepartmentModel>,
          List<DepartmentModel>
        >
    with $Provider<List<DepartmentModel>> {
  FilteredDepartmentsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredDepartmentsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredDepartmentsHash();

  @$internal
  @override
  $ProviderElement<List<DepartmentModel>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<DepartmentModel> create(Ref ref) {
    return filteredDepartments(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<DepartmentModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<DepartmentModel>>(value),
    );
  }
}

String _$filteredDepartmentsHash() =>
    r'086aa9b58ead08857cf567af7c20c05ec478c785';
