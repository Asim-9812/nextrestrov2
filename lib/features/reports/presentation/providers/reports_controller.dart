import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/sales_report_model.dart';
import '../../data/models/product_sales_report_model.dart';
import '../../data/models/customer_sales_report_model.dart';
import '../../data/models/user_sales_report_model.dart';
import '../../data/models/branch_sales_report_model.dart';
import '../../data/models/payment_method_report_model.dart';
import '../../data/models/top_selling_products_report_model.dart';
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
    int customerID = 0,
    int tableID = 0,
    int paymentMethod = 0,
    String invoiceNo = '',
    int branchID = 0,
  }) async {
    state = const AsyncValue.loading();
    
    final request = SalesReportRequest(
      fromDate: fromDate.toIso8601String(),
      toDate: toDate.toIso8601String(),
      fiscalYearID: fiscalYearID,
      customerID: customerID,
      tableID: tableID,
      paymentMethod: paymentMethod,
      invoiceNo: invoiceNo,
      branchID: branchID,
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
    String branchID = '0',
    int categoryID = 0,
    int productID = 0,
    int customerID = 0,
  }) async {
    state = const AsyncValue.loading();
    
    final request = ProductSalesReportRequest(
      fromDate: fromDate.toIso8601String(),
      toDate: toDate.toIso8601String(),
      fiscalYearID: fiscalYearID,
      branchID: branchID,
      categoryID: categoryID,
      productID: productID,
      customerID: customerID,
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
    String branchID = '0',
    int customerID = 0,
  }) async {
    state = const AsyncValue.loading();
    
    final request = CustomerSalesReportRequest(
      fromDate: fromDate.toIso8601String(),
      toDate: toDate.toIso8601String(),
      fiscalYearID: fiscalYearID,
      branchID: branchID,
      customerID: customerID,
    );

    final result = await ref.read(reportsRepositoryProvider).getCustomerSalesReport(request);
    
    state = result.fold(
      (failure) => AsyncValue.error(failure.message, StackTrace.current),
      (response) => AsyncValue.data(response.data),
    );
  }
}

@riverpod
class UserSalesReportController extends _$UserSalesReportController {
  @override
  AsyncValue<UserSalesReportData?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> fetchUserSalesReport({
    required DateTime fromDate,
    required DateTime toDate,
    required int fiscalYearID,
    String branchID = '0',
    int userID = 0,
  }) async {
    state = const AsyncValue.loading();
    
    final request = UserSalesReportRequest(
      fromDate: fromDate.toIso8601String(),
      toDate: toDate.toIso8601String(),
      fiscalYearID: fiscalYearID,
      branchID: branchID,
      userID: userID,
    );

    final result = await ref.read(reportsRepositoryProvider).getUserSalesReport(request);
    
    state = result.fold(
      (failure) => AsyncValue.error(failure.message, StackTrace.current),
      (response) => AsyncValue.data(response.data),
    );
  }
}

@riverpod
class BranchSalesReportController extends _$BranchSalesReportController {
  @override
  AsyncValue<BranchSalesReportData?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> fetchBranchSalesReport({
    required DateTime fromDate,
    required DateTime toDate,
    required int fiscalYearID,
    String branchID = '0',
  }) async {
    state = const AsyncValue.loading();
    
    final request = BranchSalesReportRequest(
      fromDate: fromDate.toIso8601String(),
      toDate: toDate.toIso8601String(),
      fiscalYearID: fiscalYearID,
      branchID: branchID,
    );

    final result = await ref.read(reportsRepositoryProvider).getBranchSalesReport(request);
    
    state = result.fold(
      (failure) => AsyncValue.error(failure.message, StackTrace.current),
      (response) => AsyncValue.data(response.data),
    );
  }
}

@riverpod
class PaymentMethodReportController extends _$PaymentMethodReportController {
  @override
  AsyncValue<PaymentMethodReportData?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> fetchPaymentMethodReport({
    required DateTime fromDate,
    required DateTime toDate,
    required int fiscalYearID,
    String branchID = '0',
    String paymentMethod = '1',
  }) async {
    state = const AsyncValue.loading();
    
    final request = PaymentMethodReportRequest(
      fromDate: fromDate.toIso8601String(),
      toDate: toDate.toIso8601String(),
      fiscalYearID: fiscalYearID,
      branchID: branchID,
      paymentMethod: paymentMethod,
    );

    final result = await ref.read(reportsRepositoryProvider).getPaymentMethodSalesReport(request);
    
    state = result.fold(
      (failure) => AsyncValue.error(failure.message, StackTrace.current),
      (response) => AsyncValue.data(response.data),
    );
  }
}

@riverpod
class TopSellingProductsReportController extends _$TopSellingProductsReportController {
  @override
  AsyncValue<TopSellingProductsReportData?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> fetchTopSellingProductsReport({
    required DateTime fromDate,
    required DateTime toDate,
    required int fiscalYearID,
    String branchID = '0',
    int categoryID = 0,
    int productID = 0,
    int top = 10,
  }) async {
    state = const AsyncValue.loading();
    
    final request = TopSellingProductsReportRequest(
      fromDate: fromDate.toIso8601String(),
      toDate: toDate.toIso8601String(),
      fiscalYearID: fiscalYearID,
      branchID: branchID,
      categoryID: categoryID,
      productID: productID,
      top: top,
    );

    final result = await ref.read(reportsRepositoryProvider).getTopSellingProductsReport(request);
    
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
