import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nextrestro/features/shift/data/models/shift_model.dart';
import 'package:nextrestro/features/orders/data/models/order_detail_model.dart';

part 'shift_management_state.freezed.dart';

@freezed
abstract class ShiftManagementState with _$ShiftManagementState {
  const factory ShiftManagementState({
    @Default([]) List<ShiftModel> shifts,
    ShiftModel? selectedShift,
    String? selectedShiftOpenerName,
    String? selectedShiftCloserName,
    @Default({}) Map<int, String> userNames,
    @Default([]) List<GroupedOrder> shiftOrders,
    @Default(false) bool isLoading,
    @Default(false) bool isOrdersLoading, // New flag for targeted loading
    String? errorMessage,
  }) = _ShiftManagementState;
}
