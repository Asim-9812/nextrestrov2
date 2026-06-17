import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:nextrestro/core/error/error_handler.dart';
import 'package:nextrestro/features/tables/data/models/table_model.dart';
import 'package:nextrestro/features/tables/data/repositories/table_repository_impl.dart';
import 'package:nextrestro/features/orders/data/repositories/order_repository_impl.dart';
import 'package:nextrestro/features/orders/data/models/order_detail_model.dart';

part 'table_provider.g.dart';

@riverpod
class SelectedTableMenu extends _$SelectedTableMenu {
  @override
  int build() => 0;

  void set(int index) => state = index;
}

@riverpod
class TableStatusFilter extends _$TableStatusFilter {
  @override
  String build() => 'All';

  void set(String filter) => state = filter;
}

@riverpod
class TableSearchQuery extends _$TableSearchQuery {
  @override
  String build() => '';

  void set(String query) => state = query;
}

@riverpod
class TransferTableState extends _$TransferTableState {
  @override
  TableModel? build() => null;

  void startTransfer(TableModel sourceTable) => state = sourceTable;
  void cancelTransfer() => state = null;
}

@riverpod
Stream<List<TableModel>> tablesStream(Ref ref) {
  final repository = ref.watch(tableRepositoryProvider);
  return repository.getTablesStream();
}

@riverpod
Future<List<GroupedOrder>> confirmedOrders(Ref ref) async {
  final repository = ref.watch(orderRepositoryProvider);
  
  // Link this to the stream so it refreshes whenever tables update
  final tablesAsync = ref.watch(tablesStreamProvider);
  
  // We use the data as a trigger, but we mainly care about the repository call
  if (tablesAsync.isLoading && !tablesAsync.hasValue) {
     return [];
  }

  final result = await repository.getAllOrdersGrouped();
  return result.fold(
    (failure) => [],
    (orders) => orders.where((o) => o.status.toLowerCase() == 'confirmed').toList(),
  );
}

@riverpod
Map<String, int> tableStatusCounts(Ref ref) {
  final tablesAsync = ref.watch(tablesStreamProvider);
  return tablesAsync.maybeWhen(
    data: (tables) {
      final counts = {
        'All': tables.length,
        'Available': tables.where((t) => t.status.toLowerCase() == 'available').length,
        'Occupied': tables.where((t) => t.status.toLowerCase() == 'occupied').length,
        'Reserved': tables.where((t) => t.status.toLowerCase() == 'reserved').length,
      };
      return counts;
    },
    orElse: () => {
      'All': 0,
      'Available': 0,
      'Occupied': 0,
      'Reserved': 0,
    },
  );
}

@riverpod
Map<String, List<TableModel>> filteredGroupedTables(Ref ref) {
  final tablesAsync = ref.watch(tablesStreamProvider);
  final filter = ref.watch(tableStatusFilterProvider);
  final search = ref.watch(tableSearchQueryProvider).toLowerCase();

  return tablesAsync.maybeWhen(
    data: (tables) {
      final filtered = tables.where((table) {
        final matchesStatus = filter == 'All' || table.status.toLowerCase() == filter.toLowerCase();
        final matchesSearch = table.tableNumber.toLowerCase().contains(search);
        return matchesStatus && matchesSearch;
      }).toList();

      final grouped = <String, List<TableModel>>{};
      for (var table in filtered) {
        grouped.putIfAbsent(table.floorName, () => []).add(table);
      }
      return grouped;
    },
    orElse: () => {},
  );
}

@riverpod
Map<int, GroupedOrder> tableOrderMap(Ref ref) {
  final ordersAsync = ref.watch(confirmedOrdersProvider);
  final tablesAsync = ref.watch(tablesStreamProvider);
  
  // Only proceed if we have both tables and orders
  return ordersAsync.maybeWhen(
    data: (orders) {
      return tablesAsync.maybeWhen(
        data: (tables) {
          final map = <int, GroupedOrder>{};
          for (final table in tables) {
            try {
              // Exact match by table number
              final order = orders.firstWhere(
                (o) => o.tableNumber.trim().toLowerCase() == table.tableNumber.trim().toLowerCase(),
              );
              map[table.tableID] = order;
            } catch (_) {
              // No order for this table
            }
          }
          return map;
        },
        orElse: () => {},
      );
    },
    orElse: () => {},
  );
}

@Riverpod(keepAlive: true)
class SelectedTableForEdit extends _$SelectedTableForEdit {
  @override
  TableModel? build() => null;

  void select(TableModel? table) => state = table;
}

@riverpod
class CreateTableState extends _$CreateTableState {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> createTable(TableModel table) async {
    final link = ref.keepAlive();
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(tableRepositoryProvider);
      await repository.createTable(table);
      ref.invalidate(tablesStreamProvider);
      state = const AsyncValue.data(null);
    } catch (e, stack) {
      final failure = ErrorHandler.handleException(e);
      state = AsyncValue.error(failure.message, stack);
    } finally {
      link.close();
    }
  }
}

@riverpod
class ManageTableSearchQuery extends _$ManageTableSearchQuery {
  @override
  String build() => '';

  void set(String query) => state = query;
}

@riverpod
class ManageTableFloorFilter extends _$ManageTableFloorFilter {
  @override
  int? build() => null; // null means All

  void set(int? floorId) => state = floorId;
}

@riverpod
class UpdateTableState extends _$UpdateTableState {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> updateTable(TableModel table) async {
    final link = ref.keepAlive();
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(tableRepositoryProvider);
      await repository.updateTable(table);
      ref.invalidate(tablesStreamProvider);
      state = const AsyncValue.data(null);
    } catch (e, stack) {
      final failure = ErrorHandler.handleException(e);
      state = AsyncValue.error(failure.message, stack);
    } finally {
      link.close();
    }
  }
}

@riverpod
class DeleteTableState extends _$DeleteTableState {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> deleteTable(int tableId) async {
    final link = ref.keepAlive();
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(tableRepositoryProvider);
      await repository.deleteTable(tableId);
      ref.invalidate(tablesStreamProvider);
      state = const AsyncValue.data(null);
    } catch (e, stack) {
      final failure = ErrorHandler.handleException(e);
      state = AsyncValue.error(failure.message, stack);
    } finally {
      link.close();
    }
  }
}

@riverpod
List<Map<String, dynamic>> floors(Ref ref) {
  final tablesAsync = ref.watch(tablesStreamProvider);
  return tablesAsync.maybeWhen(
    data: (tables) {
      final floorMap = <int, String>{};
      for (var table in tables) {
        floorMap[table.floorID] = table.floorName;
      }
      return floorMap.entries
          .map((e) => {'floorID': e.key, 'floorName': e.value})
          .toList();
    },
    orElse: () => [],
  );
}

@riverpod
List<TableModel> filteredManageTables(Ref ref) {
  final tablesAsync = ref.watch(tablesStreamProvider);
  final search = ref.watch(manageTableSearchQueryProvider).toLowerCase();
  final floorId = ref.watch(manageTableFloorFilterProvider);

  return tablesAsync.maybeWhen(
    data: (tables) {
      return tables.where((table) {
        final matchesSearch = table.tableNumber.toLowerCase().contains(search);
        final matchesFloor = floorId == null || table.floorID == floorId;
        return matchesSearch && matchesFloor;
      }).toList();
    },
    orElse: () => [],
  );
}
