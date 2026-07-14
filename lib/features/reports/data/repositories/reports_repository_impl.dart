import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:nextrestro/core/error/failures.dart';
import '../../domain/repositories/reports_repository.dart';
import '../data_sources/reports_remote_data_source.dart';
import '../models/sales_report_model.dart';
import '../models/product_sales_report_model.dart';
import '../models/customer_sales_report_model.dart';
import '../models/user_sales_report_model.dart';
import '../models/branch_sales_report_model.dart';
import '../models/payment_method_report_model.dart';

final reportsRepositoryProvider = Provider<ReportsRepository>((ref) {
  return ReportsRepositoryImpl(ref.read(reportsRemoteDataSourceProvider));
});

class ReportsRepositoryImpl implements ReportsRepository {
  final ReportsRemoteDataSource _remoteDataSource;

  ReportsRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, SalesReportResponse>> getSalesReport(SalesReportRequest request) async {
    try {
      final response = await _remoteDataSource.getSalesReport(request);
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server Error'));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductSalesReportResponse>> getProductSalesReport(ProductSalesReportRequest request) async {
    try {
      final response = await _remoteDataSource.getProductSalesReport(request);
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server Error'));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CustomerSalesReportResponse>> getCustomerSalesReport(CustomerSalesReportRequest request) async {
    try {
      final response = await _remoteDataSource.getCustomerSalesReport(request);
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server Error'));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserSalesReportResponse>> getUserSalesReport(UserSalesReportRequest request) async {
    try {
      final response = await _remoteDataSource.getUserSalesReport(request);
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server Error'));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, BranchSalesReportResponse>> getBranchSalesReport(BranchSalesReportRequest request) async {
    try {
      final response = await _remoteDataSource.getBranchSalesReport(request);
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server Error'));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PaymentMethodReportResponse>> getPaymentMethodSalesReport(PaymentMethodReportRequest request) async {
    try {
      final response = await _remoteDataSource.getPaymentMethodSalesReport(request);
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server Error'));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
