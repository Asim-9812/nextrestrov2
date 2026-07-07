import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nextrestro/features/admin_dashboard/data/models/dashboard_summary_model.dart';

part 'dashboard_state.freezed.dart';

enum DashboardDateRange { today, week, month, year, custom }

@freezed
abstract class DashboardState with _$DashboardState {
  const factory DashboardState({
    @Default(DashboardDateRange.today) DashboardDateRange dateRange,
    DateTime? fromDate,
    DateTime? toDate,
    DashboardSummaryModel? currentSummary,
    DashboardSummaryModel? previousSummary,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _DashboardState;
}
