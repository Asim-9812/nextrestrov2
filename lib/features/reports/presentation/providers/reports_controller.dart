import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/sales_report_model.dart';
import '../../data/repositories/reports_repository_impl.dart';

part 'reports_controller.g.dart';

@riverpod
class SalesReportController extends _$SalesReportController {
  @override
  AsyncValue<SalesReportData?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> fetchSalesReport({
    required DateTime fromDate,
    required DateTime toDate,
    required int fiscalYearID,
  }) async {
    state = const AsyncValue.loading();
    
    final request = SalesReportRequest(
      fromDate: fromDate.toIso8601String(),
      toDate: toDate.toIso8601String(),
      fiscalYearID: fiscalYearID,
    );

    final result = await ref.read(reportsRepositoryProvider).getSalesReport(request);
    
    state = result.fold(
      (failure) => AsyncValue.error(failure.message, StackTrace.current),
      (response) => AsyncValue.data(response.data),
    );
  }
}

@riverpod
class SelectedReportTab extends _$SelectedReportTab {
  @override
  int build() => 0;

  void set(int index) => state = index;
}
