import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/product_type_entity.dart';
import '../../domain/repositories/product_type_repository.dart';
import '../datasources/product_type_remote_data_source.dart';

class ProductTypeRepositoryImpl implements ProductTypeRepository {
  final ProductTypeRemoteDataSource remoteDataSource;

  ProductTypeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<ProductTypeEntity>>> getAllProductTypes() async {
    try {
      final productTypes = await remoteDataSource.getAllProductTypes();
      return Right(productTypes);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Failed to fetch product types'));
    } catch (e) {
      return Left(GenericFailure(e.toString()));
    }
  }
}
