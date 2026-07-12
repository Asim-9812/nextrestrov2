import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/sales_report_model.dart';
import '../../data/models/product_sales_report_model.dart';
import '../../data/models/customer_sales_report_model.dart';
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
class ProductSalesReportController extends _$ProductSalesReportController {
  @override
  AsyncValue<ProductSalesReportData?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> fetchProductSalesReport({
    required DateTime fromDate,
    required DateTime toDate,
    required int fiscalYearID,
  }) async {
    state = const AsyncValue.loading();
    
    final request = ProductSalesReportRequest(
      fromDate: fromDate.toIso8601String(),
      toDate: toDate.toIso8601String(),
      fiscalYearID: fiscalYearID,
      branchID: '3', // Constant for now as requested
    );

    final result = await ref.read(reportsRepositoryProvider).getProductSalesReport(request);
    
    state = result.fold(
      (failure) => AsyncValue.error(failure.message, StackTrace.current),
      (response) => AsyncValue.data(response.data),
    );
  }
}

@riverpod
class CustomerSalesReportController extends _$CustomerSalesReportController {
  @override
  AsyncValue<CustomerSalesReportData?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> fetchCustomerSalesReport({
    required DateTime fromDate,
    required DateTime toDate,
    required int fiscalYearID,
  }) async {
    state = const AsyncValue.loading();
    
    final request = CustomerSalesReportRequest(
      fromDate: fromDate.toIso8601String(),
      toDate: toDate.toIso8601String(),
      fiscalYearID: fiscalYearID,
      branchID: '3', 
    );

    final result = await ref.read(reportsRepositoryProvider).getCustomerSalesReport(request);
    
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
