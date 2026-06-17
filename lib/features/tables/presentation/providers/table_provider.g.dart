// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SelectedTableMenu)
final selectedTableMenuProvider = SelectedTableMenuProvider._();

final class SelectedTableMenuProvider
    extends $NotifierProvider<SelectedTableMenu, int> {
  SelectedTableMenuProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedTableMenuProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedTableMenuHash();

  @$internal
  @override
  SelectedTableMenu create() => SelectedTableMenu();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$selectedTableMenuHash() => r'1a45e5b64e3392f4ae5516fc36ce8b66ff24e857';

abstract class _$SelectedTableMenu extends $Notifier<int> {
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

@ProviderFor(TableStatusFilter)
final tableStatusFilterProvider = TableStatusFilterProvider._();

final class TableStatusFilterProvider
    extends $NotifierProvider<TableStatusFilter, String> {
  TableStatusFilterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tableStatusFilterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tableStatusFilterHash();

  @$internal
  @override
  TableStatusFilter create() => TableStatusFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$tableStatusFilterHash() => r'e9f296b8c599c77d0a112c72b39136ab8e8fd260';

abstract class _$TableStatusFilter extends $Notifier<String> {
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

@ProviderFor(TableSearchQuery)
final tableSearchQueryProvider = TableSearchQueryProvider._();

final class TableSearchQueryProvider
    extends $NotifierProvider<TableSearchQuery, String> {
  TableSearchQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tableSearchQueryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tableSearchQueryHash();

  @$internal
  @override
  TableSearchQuery create() => TableSearchQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$tableSearchQueryHash() => r'5d3ba650b973bb8ad0830944b2d0f273227944d0';

abstract class _$TableSearchQuery extends $Notifier<String> {
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

@ProviderFor(TransferTableState)
final transferTableStateProvider = TransferTableStateProvider._();

final class TransferTableStateProvider
    extends $NotifierProvider<TransferTableState, TableModel?> {
  TransferTableStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transferTableStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transferTableStateHash();

  @$internal
  @override
  TransferTableState create() => TransferTableState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TableModel? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TableModel?>(value),
    );
  }
}

String _$transferTableStateHash() =>
    r'150ebe662bf1cf009b759dd34e0f0dd1829c4795';

abstract class _$TransferTableState extends $Notifier<TableModel?> {
  TableModel? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<TableModel?, TableModel?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TableModel?, TableModel?>,
              TableModel?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(tablesStream)
final tablesStreamProvider = TablesStreamProvider._();

final class TablesStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TableModel>>,
          List<TableModel>,
          Stream<List<TableModel>>
        >
    with $FutureModifier<List<TableModel>>, $StreamProvider<List<TableModel>> {
  TablesStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tablesStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tablesStreamHash();

  @$internal
  @override
  $StreamProviderElement<List<TableModel>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<TableModel>> create(Ref ref) {
    return tablesStream(ref);
  }
}

String _$tablesStreamHash() => r'99280885c7ca4f70254011de7a9df8af54997a8a';

@ProviderFor(confirmedOrders)
final confirmedOrdersProvider = ConfirmedOrdersProvider._();

final class ConfirmedOrdersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<GroupedOrder>>,
          List<GroupedOrder>,
          FutureOr<List<GroupedOrder>>
        >
    with
        $FutureModifier<List<GroupedOrder>>,
        $FutureProvider<List<GroupedOrder>> {
  ConfirmedOrdersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'confirmedOrdersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$confirmedOrdersHash();

  @$internal
  @override
  $FutureProviderElement<List<GroupedOrder>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<GroupedOrder>> create(Ref ref) {
    return confirmedOrders(ref);
  }
}

String _$confirmedOrdersHash() => r'b860b7138ec99f7a9ad6d13c69b19139dbc3bd26';

@ProviderFor(tableStatusCounts)
final tableStatusCountsProvider = TableStatusCountsProvider._();

final class TableStatusCountsProvider
    extends
        $FunctionalProvider<
          Map<String, int>,
          Map<String, int>,
          Map<String, int>
        >
    with $Provider<Map<String, int>> {
  TableStatusCountsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tableStatusCountsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tableStatusCountsHash();

  @$internal
  @override
  $ProviderElement<Map<String, int>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Map<String, int> create(Ref ref) {
    return tableStatusCounts(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, int> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, int>>(value),
    );
  }
}

String _$tableStatusCountsHash() => r'03cb7641b20bfede9d48d620335472fc81f8e7c0';

@ProviderFor(filteredGroupedTables)
final filteredGroupedTablesProvider = FilteredGroupedTablesProvider._();

final class FilteredGroupedTablesProvider
    extends
        $FunctionalProvider<
          Map<String, List<TableModel>>,
          Map<String, List<TableModel>>,
          Map<String, List<TableModel>>
        >
    with $Provider<Map<String, List<TableModel>>> {
  FilteredGroupedTablesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredGroupedTablesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredGroupedTablesHash();

  @$internal
  @override
  $ProviderElement<Map<String, List<TableModel>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Map<String, List<TableModel>> create(Ref ref) {
    return filteredGroupedTables(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, List<TableModel>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, List<TableModel>>>(
        value,
      ),
    );
  }
}

String _$filteredGroupedTablesHash() =>
    r'd3a290df7a04ee04b8d5905af74c833718363a7f';

@ProviderFor(tableOrderMap)
final tableOrderMapProvider = TableOrderMapProvider._();

final class TableOrderMapProvider
    extends
        $FunctionalProvider<
          Map<int, GroupedOrder>,
          Map<int, GroupedOrder>,
          Map<int, GroupedOrder>
        >
    with $Provider<Map<int, GroupedOrder>> {
  TableOrderMapProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tableOrderMapProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tableOrderMapHash();

  @$internal
  @override
  $ProviderElement<Map<int, GroupedOrder>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Map<int, GroupedOrder> create(Ref ref) {
    return tableOrderMap(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<int, GroupedOrder> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<int, GroupedOrder>>(value),
    );
  }
}

String _$tableOrderMapHash() => r'5e8a4f1aef8d95a82aab42a2ee29b37850ebca94';

@ProviderFor(SelectedTableForEdit)
final selectedTableForEditProvider = SelectedTableForEditProvider._();

final class SelectedTableForEditProvider
    extends $NotifierProvider<SelectedTableForEdit, TableModel?> {
  SelectedTableForEditProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedTableForEditProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedTableForEditHash();

  @$internal
  @override
  SelectedTableForEdit create() => SelectedTableForEdit();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TableModel? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TableModel?>(value),
    );
  }
}

String _$selectedTableForEditHash() =>
    r'19276f8f1f4145c8d6f27370789e25201d71a4b7';

abstract class _$SelectedTableForEdit extends $Notifier<TableModel?> {
  TableModel? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<TableModel?, TableModel?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TableModel?, TableModel?>,
              TableModel?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(CreateTableState)
final createTableStateProvider = CreateTableStateProvider._();

final class CreateTableStateProvider
    extends $NotifierProvider<CreateTableState, AsyncValue<void>> {
  CreateTableStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createTableStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createTableStateHash();

  @$internal
  @override
  CreateTableState create() => CreateTableState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$createTableStateHash() => r'07a971a39b1c4803885282bb1a04c77dd1c77c71';

abstract class _$CreateTableState extends $Notifier<AsyncValue<void>> {
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

@ProviderFor(ManageTableSearchQuery)
final manageTableSearchQueryProvider = ManageTableSearchQueryProvider._();

final class ManageTableSearchQueryProvider
    extends $NotifierProvider<ManageTableSearchQuery, String> {
  ManageTableSearchQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'manageTableSearchQueryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$manageTableSearchQueryHash();

  @$internal
  @override
  ManageTableSearchQuery create() => ManageTableSearchQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$manageTableSearchQueryHash() =>
    r'b868376d7daae56250b349c3daacb1670a53ba44';

abstract class _$ManageTableSearchQuery extends $Notifier<String> {
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

@ProviderFor(ManageTableFloorFilter)
final manageTableFloorFilterProvider = ManageTableFloorFilterProvider._();

final class ManageTableFloorFilterProvider
    extends $NotifierProvider<ManageTableFloorFilter, int?> {
  ManageTableFloorFilterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'manageTableFloorFilterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$manageTableFloorFilterHash();

  @$internal
  @override
  ManageTableFloorFilter create() => ManageTableFloorFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int?>(value),
    );
  }
}

String _$manageTableFloorFilterHash() =>
    r'446d3897e6fe0539fda94370bd04fb92244b4b4f';

abstract class _$ManageTableFloorFilter extends $Notifier<int?> {
  int? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int?, int?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int?, int?>,
              int?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(UpdateTableState)
final updateTableStateProvider = UpdateTableStateProvider._();

final class UpdateTableStateProvider
    extends $NotifierProvider<UpdateTableState, AsyncValue<void>> {
  UpdateTableStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateTableStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateTableStateHash();

  @$internal
  @override
  UpdateTableState create() => UpdateTableState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$updateTableStateHash() => r'3e56f16998f73a59397a9d9e08eb646b4b24fb25';

abstract class _$UpdateTableState extends $Notifier<AsyncValue<void>> {
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

@ProviderFor(DeleteTableState)
final deleteTableStateProvider = DeleteTableStateProvider._();

final class DeleteTableStateProvider
    extends $NotifierProvider<DeleteTableState, AsyncValue<void>> {
  DeleteTableStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deleteTableStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deleteTableStateHash();

  @$internal
  @override
  DeleteTableState create() => DeleteTableState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$deleteTableStateHash() => r'098bcf85ba1b5c8a41c7505af468069756ae5ac9';

abstract class _$DeleteTableState extends $Notifier<AsyncValue<void>> {
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

@ProviderFor(floors)
final floorsProvider = FloorsProvider._();

final class FloorsProvider
    extends
        $FunctionalProvider<
          List<Map<String, dynamic>>,
          List<Map<String, dynamic>>,
          List<Map<String, dynamic>>
        >
    with $Provider<List<Map<String, dynamic>>> {
  FloorsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'floorsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$floorsHash();

  @$internal
  @override
  $ProviderElement<List<Map<String, dynamic>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<Map<String, dynamic>> create(Ref ref) {
    return floors(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Map<String, dynamic>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Map<String, dynamic>>>(value),
    );
  }
}

String _$floorsHash() => r'771027635c24c8534260ca2c5e3aa184827a6ad4';

@ProviderFor(filteredManageTables)
final filteredManageTablesProvider = FilteredManageTablesProvider._();

final class FilteredManageTablesProvider
    extends
        $FunctionalProvider<
          List<TableModel>,
          List<TableModel>,
          List<TableModel>
        >
    with $Provider<List<TableModel>> {
  FilteredManageTablesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredManageTablesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredManageTablesHash();

  @$internal
  @override
  $ProviderElement<List<TableModel>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<TableModel> create(Ref ref) {
    return filteredManageTables(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<TableModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<TableModel>>(value),
    );
  }
}

String _$filteredManageTablesHash() =>
    r'd97560853bd0b69e99b21eecc5728cf9712bd6df';
