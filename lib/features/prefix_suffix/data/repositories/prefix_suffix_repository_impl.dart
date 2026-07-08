import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:nextrestro/core/error/failures.dart';
import '../../domain/repositories/prefix_suffix_repository.dart';
import '../data_sources/prefix_suffix_remote_data_source.dart';
import '../models/prefix_suffix_model.dart';

final prefixSuffixRepositoryProvider = Provider<PrefixSuffixRepository>((ref) {
  return PrefixSuffixRepositoryImpl(ref.read(prefixSuffixRemoteDataSourceProvider));
});

class PrefixSuffixRepositoryImpl implements PrefixSuffixRepository {
  final PrefixSuffixRemoteDataSource _remoteDataSource;

  PrefixSuffixRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, PrefixSuffixResponse>> getAllPrefixSuffixes() async {
    try {
      final response = await _remoteDataSource.getAllPrefixSuffixes();
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Server Error'));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
