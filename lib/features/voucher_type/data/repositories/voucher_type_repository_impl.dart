import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:nextrestro/core/error/failures.dart';
import '../../domain/repositories/voucher_type_repository.dart';
import '../data_sources/voucher_type_remote_data_source.dart';
import '../models/voucher_type_model.dart';

final voucherTypeRepositoryProvider = Provider<VoucherTypeRepository>((ref) {
  return VoucherTypeRepositoryImpl(ref.read(voucherTypeRemoteDataSourceProvider));
});

class VoucherTypeRepositoryImpl implements VoucherTypeRepository {
  final VoucherTypeRemoteDataSource _remoteDataSource;

  VoucherTypeRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, VoucherTypeResponse>> getAllVoucherTypes() async {
    try {
      final response = await _remoteDataSource.getAllVoucherTypes();
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server Error'));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
