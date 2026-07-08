import 'package:fpdart/fpdart.dart';
import 'package:nextrestro/core/error/failures.dart';
import '../../data/models/sales_report_model.dart';

abstract class ReportsRepository {
  Future<Either<Failure, SalesReportResponse>> getSalesReport(SalesReportRequest request);
}
