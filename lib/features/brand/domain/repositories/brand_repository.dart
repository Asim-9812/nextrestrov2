import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/brand_entity.dart';

abstract class BrandRepository {
  Future<Either<Failure, List<BrandEntity>>> getAllBrands();
}
