import 'package:nextrestro/core/network/session_service.dart';
import 'package:nextrestro/features/orders/data/models/order_detail_model.dart';
import 'package:nextrestro/features/orders/data/repositories/order_repository_impl.dart';
import 'package:nextrestro/features/shift/data/models/shift_model.dart';
import 'package:nextrestro/features/shift/data/repositories/shift_repository_impl.dart';
import 'package:nextrestro/features/users/data/repositories/user_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'shift_management_state.dart';

part 'shift_management_provider.g.dart';

@riverpod
class ShiftManagementController extends _$ShiftManagementController {
  @override
  FutureOr<ShiftManagementState> build() async {
    return _fetchAllShifts();
  }

  Future<ShiftManagementState> _fetchAllShifts() async {
    state = const AsyncValue.loading();
    final repository = ref.read(shiftRepositoryProvider);
    final result = await repository.getAllShifts();

    return result.fold(
      (failure) => ShiftManagementState(errorMessage: failure.message),
      (response) {
        final shifts = response.data ?? [];
        // Sort by opening time descending
        final sortedShifts = List<ShiftModel>.from(shifts)
          ..sort((a, b) {
            final timeA = DateTime.tryParse(a.openingTime ?? '') ?? DateTime(0);
            final timeB = DateTime.tryParse(b.openingTime ?? '') ?? DateTime(0);
            return timeB.compareTo(timeA);
          });

        ShiftModel? currentShift;
        if (sortedShifts.isNotEmpty) {
          final latest = sortedShifts.first;
          if (latest.shiftStatus == 1) {
            currentShift = latest;
          }
        }

        final initialState = ShiftManagementState(
          shifts: sortedShifts,
          selectedShift: currentShift,
        );

        if (sortedShifts.isNotEmpty) {
          // Pre-fetch names for all openers in history
          Future.microtask(() => _fetchHistoryOpenerNames(sortedShifts));
        }

        if (currentShift != null) {
          // Select current shift by default
          Future.microtask(() => selectShift(currentShift!));
        }

        return initialState;
      },
    );
  }

  Future<void> _fetchHistoryOpenerNames(List<ShiftModel> sortedShifts) async {
    final userRepo = ref.read(userRepositoryProvider);
    final uniqueOpenerIds = sortedShifts
        .map((s) => s.openedByUserID)
        .where((id) => id != null && id != 0)
        .toSet()
        .cast<int>();

    final Map<int, String> newNames = Map.from(state.value?.userNames ?? {});
    bool updated = false;

    for (final id in uniqueOpenerIds) {
      if (!newNames.containsKey(id)) {
        final result = await userRepo.getUserById(id);
        result.fold(
          (_) => newNames[id] = 'User #$id',
          (user) => newNames[id] = user.fullName ?? 'User #$id',
        );
        updated = true;
      }
    }

    if (updated) {
      state = AsyncValue.data(state.value!.copyWith(userNames: newNames));
    }
  }

  Future<void> selectShift(ShiftModel shift) async {
    final currentState = state.asData?.value ?? const ShiftManagementState();
    state = AsyncValue.data(currentState.copyWith(isLoading: true, selectedShift: shift));

    // Fetch opener name
    String? openerName;
    if (shift.openedByUserID != null) {
      final userRepo = ref.read(userRepositoryProvider);
      final userResult = await userRepo.getUserById(shift.openedByUserID!);
      openerName = userResult.fold((_) => 'User #${shift.openedByUserID}', (user) => user.fullName);
    }

    // Fetch closer name
    String? closerName;
    if (shift.shiftStatus == 2 && shift.closedByUserID != null && shift.closedByUserID != 0) {
      final userRepo = ref.read(userRepositoryProvider);
      final userResult = await userRepo.getUserById(shift.closedByUserID!);
      closerName = userResult.fold((_) => 'User #${shift.closedByUserID}', (user) => user.fullName);
    }

    await _fetchAndFilterOrders(shift, openerName, closerName);
  }

  Future<void> refreshOrders() async {
    final currentState = state.asData?.value;
    if (currentState == null || currentState.selectedShift == null) return;

    state = AsyncValue.data(currentState.copyWith(isOrdersLoading: true));
    await _fetchAndFilterOrders(
      currentState.selectedShift!,
      currentState.selectedShiftOpenerName,
      currentState.selectedShiftCloserName,
      isInitialSelect: false,
    );
  }

  Future<void> _fetchAndFilterOrders(
    ShiftModel shift,
    String? openerName,
    String? closerName, {
    bool isInitialSelect = true,
  }) async {
    // Fetch and filter orders
    final orderRepo = ref.read(orderRepositoryProvider);
    final orderResult = await orderRepo.getOrdersByStatus('Completed');

    final List<GroupedOrder> filteredOrders = orderResult.fold(
      (failure) => [],
      (items) => _filterAndGroupOrders(items, shift),
    );

    state = AsyncValue.data(state.value!.copyWith(
      isLoading: isInitialSelect ? false : state.value!.isLoading,
      isOrdersLoading: false,
      selectedShiftOpenerName: openerName,
      selectedShiftCloserName: closerName,
      shiftOrders: filteredOrders,
    ));
  }

  List<GroupedOrder> _filterAndGroupOrders(List<OrderDetailModel> items, ShiftModel shift) {
    final startTime = DateTime.tryParse(shift.openingTime ?? '');
    final endTime = DateTime.tryParse(shift.closingTime ?? '');

    if (startTime == null) return [];

    final filteredItems = items.where((item) {
      final orderDate = DateTime.tryParse(item.orderDate ?? '');
      if (orderDate == null) return false;
      
      if (endTime != null) {
        return orderDate.isAfter(startTime) && orderDate.isBefore(endTime);
      } else {
        return orderDate.isAfter(startTime);
      }
    }).toList();

    // Grouping logic (reused from OrderRepositoryImpl)
    final Map<int, List<OrderDetailModel>> groupedMap = {};
    for (final item in filteredItems) {
      if (item.orderID != null) {
        groupedMap.putIfAbsent(item.orderID!, () => []).add(item);
      }
    }

    final List<GroupedOrder> groupedOrders = groupedMap.entries.map((entry) {
      final items = entry.value;
      final firstItem = items.first;
      return GroupedOrder(
        orderId: entry.key,
        tableNumber: firstItem.tableNumber ?? 'N/A',
        customerName: firstItem.customerName ?? 'Unknown',
        status: firstItem.orderStatus ?? 'Unknown',
        date: DateTime.tryParse(firstItem.orderDate ?? '') ?? DateTime(0),
        itemCount: items.length,
        items: items,
      );
    }).toList();

    groupedOrders.sort((a, b) => b.date.compareTo(a.date));
    return groupedOrders;
  }

  Future<void> endShift(ShiftModel shift, double closingAmount) async {
    final session = ref.read(sessionServiceProvider);
    final user = session.getUser();
    final userId = user?['userId'] as int?;

    final updatedShift = shift.copyWith(
      closedByUserID: userId ?? 0,
      closingAmount: closingAmount,
      closingTime: DateTime.now().toIso8601String(),
      shiftStatus: 2,
    );

    state = AsyncValue.data(state.value!.copyWith(isLoading: true));

    final result = await ref.read(shiftRepositoryProvider).closeShift(updatedShift);

    result.fold(
      (failure) {
        state = AsyncValue.data(state.value!.copyWith(
          isLoading: false,
          errorMessage: failure.message,
        ));
      },
      (success) async {
        await refresh();
      },
    );
  }

  Future<void> openShift(String name, double openingAmount) async {
    final session = ref.read(sessionServiceProvider);
    final user = session.getUser();
    final userId = user?['userId'] as int?;

    final now = DateTime.now().toIso8601String();

    final newShift = ShiftModel(
      shiftID: 0,
      shiftName: name,
      openedByUserID: userId ?? 0,
      openingAmount: openingAmount,
      openingTime: now,
      closedByUserID: 0,
      closingAmount: 0,
      closingTime: now,
      totalSales: 0,
      cashSales: 0,
      cardSales: 0,
      qrSales: 0,
      creditSales: 0,
      shiftStatus: 1,
    );

    state = AsyncValue.data(state.value!.copyWith(isLoading: true));

    final result = await ref.read(shiftRepositoryProvider).openShift(newShift);

    result.fold(
      (failure) {
        state = AsyncValue.data(state.value!.copyWith(
          isLoading: false,
          errorMessage: failure.message,
        ));
      },
      (success) async {
        await refresh();
      },
    );
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }
}
