import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/brand_entity.dart';
import '../../domain/repositories/brand_repository.dart';
import '../datasources/brand_remote_data_source.dart';

class BrandRepositoryImpl implements BrandRepository {
  final BrandRemoteDataSource remoteDataSource;

  BrandRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<BrandEntity>>> getAllBrands() async {
    try {
      final brands = await remoteDataSource.getAllBrands();
      return Right(brands);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Failed to fetch brands'));
    } catch (e) {
      return Left(GenericFailure(e.toString()));
    }
  }
}
