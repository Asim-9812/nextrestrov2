import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:nextrestro/core/error/failures.dart';
import 'package:nextrestro/features/shift/data/data_sources/shift_remote_data_source.dart';
import 'package:nextrestro/features/shift/data/models/shift_model.dart';
import 'package:nextrestro/features/shift/domain/repositories/shift_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shiftRepositoryProvider = Provider<ShiftRepository>((ref) {
  return ShiftRepositoryImpl(ref.read(shiftRemoteDataSourceProvider));
});

class ShiftRepositoryImpl implements ShiftRepository {
  final ShiftRemoteDataSource _remoteDataSource;

  ShiftRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, ShiftResponse>> getAllShifts() async {
    try {
      final response = await _remoteDataSource.getAllShifts();
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server Error'));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ShiftModel?>> getLastClosedShift() async {
    try {
      final response = await _remoteDataSource.getAllShifts();
      if (response.data == null || response.data!.isEmpty) return const Right(null);

      // Status 2 for closed shifts
      final closedShifts = response.data!
          .where((s) => s.shiftStatus == 2)
          .toList();

      if (closedShifts.isEmpty) return const Right(null);

      closedShifts.sort((a, b) {
        final timeA = DateTime.tryParse(a.closingTime ?? '') ?? DateTime(0);
        final timeB = DateTime.tryParse(b.closingTime ?? '') ?? DateTime(0);
        return timeB.compareTo(timeA);
      });

      return Right(closedShifts.first);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server Error'));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> closeShift(ShiftModel shift) async {
    try {
      final response = await _remoteDataSource.closeShift(shift);
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server Error'));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> openShift(ShiftModel shift) async {
    try {
      final response = await _remoteDataSource.openShift(shift);
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server Error'));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
