import 'package:fpdart/fpdart.dart';
import 'package:nextrestro/core/error/failures.dart';
import '../../data/models/sales_report_model.dart';
import '../../data/models/product_sales_report_model.dart';
import '../../data/models/customer_sales_report_model.dart';
import '../../data/models/user_sales_report_model.dart';
import '../../data/models/branch_sales_report_model.dart';

abstract class ReportsRepository {
  Future<Either<Failure, SalesReportResponse>> getSalesReport(SalesReportRequest request);
  Future<Either<Failure, ProductSalesReportResponse>> getProductSalesReport(ProductSalesReportRequest request);
  Future<Either<Failure, CustomerSalesReportResponse>> getCustomerSalesReport(CustomerSalesReportRequest request);
  Future<Either<Failure, UserSalesReportResponse>> getUserSalesReport(UserSalesReportRequest request);
  Future<Either<Failure, BranchSalesReportResponse>> getBranchSalesReport(BranchSalesReportRequest request);
}
