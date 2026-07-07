import 'package:fpdart/fpdart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/error/failures.dart';
import 'package:nextrestro/features/admin_dashboard/data/data_sources/dashboard_remote_data_source.dart';
import 'package:nextrestro/features/admin_dashboard/data/models/dashboard_summary_model.dart';

final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  return DashboardRepositoryImpl(ref.read(dashboardRemoteDataSourceProvider));
});

abstract class DashboardRepository {
  Future<Either<Failure, DashboardSummaryModel>> getDashboardSummary(DashboardSummaryRequest request);
}

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource _remoteDataSource;

  DashboardRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, DashboardSummaryModel>> getDashboardSummary(DashboardSummaryRequest request) async {
    try {
      final result = await _remoteDataSource.getDashboardSummary(request);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
