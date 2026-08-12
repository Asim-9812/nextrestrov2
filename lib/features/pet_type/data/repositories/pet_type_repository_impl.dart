import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/pet_type_entity.dart';
import '../../domain/repositories/pet_type_repository.dart';
import '../datasources/pet_type_remote_data_source.dart';

class PetTypeRepositoryImpl implements PetTypeRepository {
  final PetTypeRemoteDataSource remoteDataSource;

  PetTypeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<PetTypeEntity>>> getAllPetTypes() async {
    try {
      final petTypes = await remoteDataSource.getAllPetTypes();
      return Right(petTypes);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Failed to fetch pet types'));
    } catch (e) {
      return Left(GenericFailure(e.toString()));
    }
  }
}
