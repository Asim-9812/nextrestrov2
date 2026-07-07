import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nextrestro/features/admin_dashboard/data/models/dashboard_summary_model.dart';

part 'dashboard_chart_state.freezed.dart';

@freezed
abstract class DashboardChartState with _$DashboardChartState {
  const factory DashboardChartState({
    @Default([]) List<ChartDataPoint> dataPoints,
    @Default('Week') String interval,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _DashboardChartState;
}

class ChartDataPoint {
  final String label;
  final DashboardSummaryModel summary;
  ChartDataPoint({required this.label, required this.summary});
}
