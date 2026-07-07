import 'package:intl/intl.dart';
import 'package:nextrestro/features/admin_dashboard/data/models/dashboard_summary_model.dart';
import 'package:nextrestro/features/admin_dashboard/data/repositories/dashboard_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dashboard_chart_state.dart';

part 'dashboard_chart_controller.g.dart';

enum CustomAggregation { daily, monthly, yearly }

@riverpod
class DashboardChartController extends _$DashboardChartController {
  @override
  FutureOr<DashboardChartState> build() async {
    return _fetchWeekData(DateTime.now());
  }

  Future<void> setWeeklyInterval(DateTime startOfWeek) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchWeekData(startOfWeek));
  }

  Future<void> setMonthlyInterval(int year) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchMonthData(year));
  }

  Future<void> setYearlyInterval(int startYear, int endYear) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchYearData(startYear, endYear));
  }

  Future<void> setCustomInterval(DateTime from, DateTime to, {CustomAggregation aggregation = CustomAggregation.daily}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() {
      switch (aggregation) {
        case CustomAggregation.monthly:
          return _fetchCustomMonthlyData(from, to);
        case CustomAggregation.yearly:
          return _fetchCustomYearlyData(from, to);
        case CustomAggregation.daily:
        default:
          return _fetchCustomData(from, to);
      }
    });
  }

  Future<DashboardChartState> _fetchWeekData(DateTime date) async {
    final repository = ref.read(dashboardRepositoryProvider);
    final startOfWeek = date.subtract(Duration(days: date.weekday % 7));
    final List<Future<ChartDataPoint>> futures = [];

    for (int i = 0; i < 7; i++) {
      final day = startOfWeek.add(Duration(days: i));
      final dayStr = DateFormat('yyyy-MM-dd').format(day);
      final label = DateFormat('EEE').format(day);

      final request = DashboardSummaryRequest(fromDate: dayStr, toDate: dayStr);
      futures.add(repository.getDashboardSummary(request).then((result) {
        return ChartDataPoint(
          label: label,
          summary: result.fold((_) => DashboardSummaryModel(), (s) => s),
        );
      }));
    }

    final dataPoints = await Future.wait(futures);
    return DashboardChartState(dataPoints: dataPoints, interval: 'Week');
  }

  Future<DashboardChartState> _fetchMonthData(int year) async {
    final repository = ref.read(dashboardRepositoryProvider);
    final List<Future<ChartDataPoint>> futures = [];

    for (int i = 1; i <= 12; i++) {
      final monthDate = DateTime(year, i, 1);
      final lastDay = DateTime(year, i + 1, 0).day;
      
      final fromStr = DateFormat('yyyy-MM-dd').format(monthDate);
      final toStr = DateFormat('yyyy-MM-dd').format(DateTime(year, i, lastDay));
      final label = DateFormat('MMM').format(monthDate);

      final request = DashboardSummaryRequest(fromDate: fromStr, toDate: toStr);
      futures.add(repository.getDashboardSummary(request).then((result) {
        return ChartDataPoint(
          label: label,
          summary: result.fold((_) => DashboardSummaryModel(), (s) => s),
        );
      }));
    }

    final dataPoints = await Future.wait(futures);
    return DashboardChartState(dataPoints: dataPoints, interval: 'Month');
  }

  Future<DashboardChartState> _fetchYearData(int startYear, int endYear) async {
    final repository = ref.read(dashboardRepositoryProvider);
    final List<Future<ChartDataPoint>> futures = [];

    for (int year = startYear; year <= endYear; year++) {
      final fromStr = '$year-01-01';
      final toStr = '$year-12-31';
      final label = year.toString();

      final request = DashboardSummaryRequest(fromDate: fromStr, toDate: toStr);
      futures.add(repository.getDashboardSummary(request).then((result) {
        return ChartDataPoint(
          label: label,
          summary: result.fold((_) => DashboardSummaryModel(), (s) => s),
        );
      }));
    }

    final dataPoints = await Future.wait(futures);
    return DashboardChartState(dataPoints: dataPoints, interval: 'Year');
  }

  Future<DashboardChartState> _fetchCustomData(DateTime from, DateTime to) async {
    final repository = ref.read(dashboardRepositoryProvider);
    final duration = to.difference(from).inDays + 1;
    final List<Future<ChartDataPoint>> futures = [];

    for (int i = 0; i < duration; i++) {
      final date = from.add(Duration(days: i));
      final dateStr = DateFormat('yyyy-MM-dd').format(date);
      final label = DateFormat('MM/dd').format(date);

      final request = DashboardSummaryRequest(fromDate: dateStr, toDate: dateStr);
      futures.add(repository.getDashboardSummary(request).then((result) {
        return ChartDataPoint(
          label: label,
          summary: result.fold((_) => DashboardSummaryModel(), (s) => s),
        );
      }));
    }

    final dataPoints = await Future.wait(futures);
    return DashboardChartState(dataPoints: dataPoints, interval: 'Custom (Daily)');
  }

  Future<DashboardChartState> _fetchCustomMonthlyData(DateTime from, DateTime to) async {
    final repository = ref.read(dashboardRepositoryProvider);
    final List<Future<ChartDataPoint>> futures = [];

    var current = DateTime(from.year, from.month, 1);
    while (current.isBefore(to) || (current.year == to.year && current.month == to.month)) {
      final rangeStart = current.isBefore(from) ? from : current;
      final nextMonth = DateTime(current.year, current.month + 1, 1);
      final monthEnd = nextMonth.subtract(const Duration(days: 1));
      final rangeEnd = monthEnd.isAfter(to) ? to : monthEnd;

      final fromStr = DateFormat('yyyy-MM-dd').format(rangeStart);
      final toStr = DateFormat('yyyy-MM-dd').format(rangeEnd);
      final label = DateFormat('MMM yy').format(current);

      final request = DashboardSummaryRequest(fromDate: fromStr, toDate: toStr);
      futures.add(repository.getDashboardSummary(request).then((result) {
        return ChartDataPoint(
          label: label,
          summary: result.fold((_) => DashboardSummaryModel(), (s) => s),
        );
      }));
      current = nextMonth;
    }

    final dataPoints = await Future.wait(futures);
    return DashboardChartState(dataPoints: dataPoints, interval: 'Custom (Monthly)');
  }

  Future<DashboardChartState> _fetchCustomYearlyData(DateTime from, DateTime to) async {
    final repository = ref.read(dashboardRepositoryProvider);
    final List<Future<ChartDataPoint>> futures = [];

    for (int year = from.year; year <= to.year; year++) {
      final rangeStart = year == from.year ? from : DateTime(year, 1, 1);
      final rangeEnd = year == to.year ? to : DateTime(year, 12, 31);

      final fromStr = DateFormat('yyyy-MM-dd').format(rangeStart);
      final toStr = DateFormat('yyyy-MM-dd').format(rangeEnd);
      final label = year.toString();

      final request = DashboardSummaryRequest(fromDate: fromStr, toDate: toStr);
      futures.add(repository.getDashboardSummary(request).then((result) {
        return ChartDataPoint(
          label: label,
          summary: result.fold((_) => DashboardSummaryModel(), (s) => s),
        );
      }));
    }

    final dataPoints = await Future.wait(futures);
    return DashboardChartState(dataPoints: dataPoints, interval: 'Custom (Yearly)');
  }
}
