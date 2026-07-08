import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:nextrestro/core/error/failures.dart';
import '../../domain/repositories/fiscal_year_repository.dart';
import '../data_sources/fiscal_year_remote_data_source.dart';
import '../models/fiscal_year_model.dart';

final fiscalYearRepositoryProvider = Provider<FiscalYearRepository>((ref) {
  return FiscalYearRepositoryImpl(ref.read(fiscalYearRemoteDataSourceProvider));
});

class FiscalYearRepositoryImpl implements FiscalYearRepository {
  final FiscalYearRemoteDataSource _remoteDataSource;

  FiscalYearRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, FiscalYearResponse>> getAllFiscalYears() async {
    try {
      final response = await _remoteDataSource.getAllFiscalYears();
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server Error'));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
