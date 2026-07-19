import 'dart:async';
import 'package:nextrestro/features/shift/data/models/shift_model.dart';
import 'package:nextrestro/features/shift/presentation/providers/shift_management_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shift_provider.g.dart';

@riverpod
class ShiftController extends _$ShiftController {
  @override
  FutureOr<(ShiftModel?, String?)> build() async {
    final state = await ref.watch(shiftManagementControllerProvider.future);

    final activeShift = state.shifts.isNotEmpty && state.shifts.first.shiftStatus == 1
        ? state.shifts.first
        : null;

    String? openerName;
    if (activeShift != null && activeShift.openedByUserID != null) {
      openerName = state.userNames[activeShift.openedByUserID];
    }

    return (activeShift, openerName);
  }

  Future<void> refresh() async {
    ref.invalidate(shiftManagementControllerProvider);
    await future;
  }
}
