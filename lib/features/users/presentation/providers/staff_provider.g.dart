// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(allStaff)
final allStaffProvider = AllStaffProvider._();

final class AllStaffProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<UserModel>>,
          List<UserModel>,
          FutureOr<List<UserModel>>
        >
    with $FutureModifier<List<UserModel>>, $FutureProvider<List<UserModel>> {
  AllStaffProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allStaffProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allStaffHash();

  @$internal
  @override
  $FutureProviderElement<List<UserModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<UserModel>> create(Ref ref) {
    return allStaff(ref);
  }
}

String _$allStaffHash() => r'71a08e46e1202de97aa5c314982fce4b493b8775';

@ProviderFor(StaffSearchQuery)
final staffSearchQueryProvider = StaffSearchQueryProvider._();

final class StaffSearchQueryProvider
    extends $NotifierProvider<StaffSearchQuery, String> {
  StaffSearchQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'staffSearchQueryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$staffSearchQueryHash();

  @$internal
  @override
  StaffSearchQuery create() => StaffSearchQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$staffSearchQueryHash() => r'2aebfe47a5cb8010b3dd9c1ce1b396647be0b380';

abstract class _$StaffSearchQuery extends $Notifier<String> {
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

@ProviderFor(StaffRoleFilter)
final staffRoleFilterProvider = StaffRoleFilterProvider._();

final class StaffRoleFilterProvider
    extends $NotifierProvider<StaffRoleFilter, String> {
  StaffRoleFilterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'staffRoleFilterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$staffRoleFilterHash();

  @$internal
  @override
  StaffRoleFilter create() => StaffRoleFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$staffRoleFilterHash() => r'930b92bdcbd6e3b86d0c77462863d7973b11275a';

abstract class _$StaffRoleFilter extends $Notifier<String> {
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

@ProviderFor(filteredStaff)
final filteredStaffProvider = FilteredStaffProvider._();

final class FilteredStaffProvider
    extends
        $FunctionalProvider<List<UserModel>, List<UserModel>, List<UserModel>>
    with $Provider<List<UserModel>> {
  FilteredStaffProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredStaffProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredStaffHash();

  @$internal
  @override
  $ProviderElement<List<UserModel>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<UserModel> create(Ref ref) {
    return filteredStaff(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<UserModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<UserModel>>(value),
    );
  }
}

String _$filteredStaffHash() => r'b686dea07e15a55d35e40525528c22982d95e00f';

@ProviderFor(staffRoles)
final staffRolesProvider = StaffRolesProvider._();

final class StaffRolesProvider
    extends $FunctionalProvider<List<String>, List<String>, List<String>>
    with $Provider<List<String>> {
  StaffRolesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'staffRolesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$staffRolesHash();

  @$internal
  @override
  $ProviderElement<List<String>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<String> create(Ref ref) {
    return staffRoles(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$staffRolesHash() => r'35df5c5bd25743ed99957406d9f7a7960eeaca64';

@ProviderFor(SelectedStaffForView)
final selectedStaffForViewProvider = SelectedStaffForViewProvider._();

final class SelectedStaffForViewProvider
    extends $NotifierProvider<SelectedStaffForView, UserModel?> {
  SelectedStaffForViewProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedStaffForViewProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedStaffForViewHash();

  @$internal
  @override
  SelectedStaffForView create() => SelectedStaffForView();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserModel? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserModel?>(value),
    );
  }
}

String _$selectedStaffForViewHash() =>
    r'20fec33d414af9393580361c5e9e90274d1b1792';

abstract class _$SelectedStaffForView extends $Notifier<UserModel?> {
  UserModel? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<UserModel?, UserModel?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UserModel?, UserModel?>,
              UserModel?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(IsAddingStaff)
final isAddingStaffProvider = IsAddingStaffProvider._();

final class IsAddingStaffProvider
    extends $NotifierProvider<IsAddingStaff, bool> {
  IsAddingStaffProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isAddingStaffProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isAddingStaffHash();

  @$internal
  @override
  IsAddingStaff create() => IsAddingStaff();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isAddingStaffHash() => r'9e43ff19a1e8e779131f97c8035e31202308b8cd';

abstract class _$IsAddingStaff extends $Notifier<bool> {
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

@ProviderFor(staffDetails)
final staffDetailsProvider = StaffDetailsFamily._();

final class StaffDetailsProvider
    extends
        $FunctionalProvider<
          AsyncValue<UserModel>,
          UserModel,
          FutureOr<UserModel>
        >
    with $FutureModifier<UserModel>, $FutureProvider<UserModel> {
  StaffDetailsProvider._({
    required StaffDetailsFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'staffDetailsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$staffDetailsHash();

  @override
  String toString() {
    return r'staffDetailsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<UserModel> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<UserModel> create(Ref ref) {
    final argument = this.argument as int;
    return staffDetails(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is StaffDetailsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$staffDetailsHash() => r'679932d9350e22b5a9ed646175d2d7d950906a1c';

final class StaffDetailsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<UserModel>, int> {
  StaffDetailsFamily._()
    : super(
        retry: null,
        name: r'staffDetailsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  StaffDetailsProvider call(int userId) =>
      StaffDetailsProvider._(argument: userId, from: this);

  @override
  String toString() => r'staffDetailsProvider';
}

@ProviderFor(RegisterStaffState)
final registerStaffStateProvider = RegisterStaffStateProvider._();

final class RegisterStaffStateProvider
    extends $NotifierProvider<RegisterStaffState, AsyncValue<void>> {
  RegisterStaffStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'registerStaffStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$registerStaffStateHash();

  @$internal
  @override
  RegisterStaffState create() => RegisterStaffState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$registerStaffStateHash() =>
    r'22c10094e90cc04bf470e8d66f3c8c284bb35819';

abstract class _$RegisterStaffState extends $Notifier<AsyncValue<void>> {
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
