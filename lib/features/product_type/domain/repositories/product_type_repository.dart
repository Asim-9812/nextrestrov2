import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/product_type_entity.dart';

abstract class ProductTypeRepository {
  Future<Either<Failure, List<ProductTypeEntity>>> getAllProductTypes();
}
