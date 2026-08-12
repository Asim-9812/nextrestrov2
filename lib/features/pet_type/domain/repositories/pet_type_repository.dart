import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/pet_type_entity.dart';

abstract class PetTypeRepository {
  Future<Either<Failure, List<PetTypeEntity>>> getAllPetTypes();
}
