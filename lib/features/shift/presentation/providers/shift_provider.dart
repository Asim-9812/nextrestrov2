import 'dart:async';
import 'package:nextrestro/features/shift/data/models/shift_model.dart';
import 'package:nextrestro/features/shift/data/repositories/shift_repository_impl.dart';
import 'package:nextrestro/features/users/data/repositories/user_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shift_provider.g.dart';

@riverpod
class ShiftController extends _$ShiftController {
  @override
  FutureOr<(ShiftModel?, String?)> build() async {
    // Set up auto-refresh every 5 minutes
    final timer = Timer.periodic(const Duration(minutes: 5), (_) {
      refresh();
    });

    ref.onDispose(() => timer.cancel());

    final shift = await _fetchActiveShift();
    if (shift != null && shift.openedByUserID != null) {
      final openerName = await _fetchOpenerName(shift.openedByUserID!);
      return (shift, openerName);
    }
    return (shift, null);
  }

  Future<ShiftModel?> _fetchActiveShift() async {
    final repository = ref.read(shiftRepositoryProvider);
    final result = await repository.getAllShifts();

    return result.fold(
      (failure) => throw failure.message,
      (response) {
        if (response.data == null || response.data!.isEmpty) return null;

        final activeShifts = response.data!
            .where((s) => s.shiftStatus == 1)
            .toList();

        if (activeShifts.isEmpty) return null;

        activeShifts.sort((a, b) {
          final timeA = DateTime.tryParse(a.openingTime ?? '') ?? DateTime(0);
          final timeB = DateTime.tryParse(b.openingTime ?? '') ?? DateTime(0);
          return timeB.compareTo(timeA);
        });

        return activeShifts.first;
      },
    );
  }

  Future<String?> _fetchOpenerName(int userId) async {
    final userRepository = ref.read(userRepositoryProvider);
    final result = await userRepository.getUserById(userId);
    return result.fold(
      (failure) => 'User #$userId',
      (user) => user.fullName ?? 'User #$userId',
    );
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }
}
