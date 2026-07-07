import 'package:nextrestro/features/admin_dashboard/data/models/dashboard_summary_model.dart';
import 'package:nextrestro/features/admin_dashboard/data/repositories/dashboard_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dashboard_state.dart';
import 'package:intl/intl.dart';

part 'dashboard_controller.g.dart';

@riverpod
class DashboardController extends _$DashboardController {
  @override
  FutureOr<DashboardState> build() async {
    // Initial fetch for Today
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    return _fetchData(DashboardDateRange.today, today, today);
  }

  Future<DashboardState> _fetchData(
    DashboardDateRange range,
    DateTime from,
    DateTime to,
  ) async {
    final repository = ref.read(dashboardRepositoryProvider);
    
    // Calculate previous range for comparison
    final previousRange = _getPreviousRange(from, to);
    
    final currentRequest = DashboardSummaryRequest(
      fromDate: DateFormat('yyyy-MM-dd').format(from),
      toDate: DateFormat('yyyy-MM-dd').format(to),
    );
    
    final previousRequest = DashboardSummaryRequest(
      fromDate: DateFormat('yyyy-MM-dd').format(previousRange.$1),
      toDate: DateFormat('yyyy-MM-dd').format(previousRange.$2),
    );

    final results = await Future.wait([
      repository.getDashboardSummary(currentRequest),
      repository.getDashboardSummary(previousRequest),
    ]);

    DashboardSummaryModel? currentSummary;
    DashboardSummaryModel? previousSummary;
    String? error;

    results[0].fold(
      (failure) => error = failure.message,
      (summary) => currentSummary = summary,
    );

    results[1].fold(
      (_) => null, // Ignore previous summary errors
      (summary) => previousSummary = summary,
    );

    return DashboardState(
      dateRange: range,
      fromDate: from,
      toDate: to,
      currentSummary: currentSummary,
      previousSummary: previousSummary,
      errorMessage: error,
    );
  }

  (DateTime, DateTime) _getPreviousRange(DateTime from, DateTime to) {
    final duration = to.difference(from).inDays + 1;
    final prevTo = from.subtract(const Duration(days: 1));
    final prevFrom = prevTo.subtract(Duration(days: duration - 1));
    return (prevFrom, prevTo);
  }

  Future<void> setDateRange(DashboardDateRange range, {DateTime? customFrom, DateTime? customTo}) async {
    state = const AsyncValue.loading();
    
    final now = DateTime.now();
    DateTime from;
    DateTime to = DateTime(now.year, now.month, now.day);

    switch (range) {
      case DashboardDateRange.today:
        from = to;
        break;
      case DashboardDateRange.week:
        from = to.subtract(Duration(days: to.weekday - 1));
        break;
      case DashboardDateRange.month:
        from = DateTime(to.year, to.month, 1);
        break;
      case DashboardDateRange.year:
        from = DateTime(to.year, 1, 1);
        break;
      case DashboardDateRange.custom:
        from = customFrom ?? to;
        to = customTo ?? to;
        break;
    }

    state = await AsyncValue.guard(() => _fetchData(range, from, to));
  }
}
