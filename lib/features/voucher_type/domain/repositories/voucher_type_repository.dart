import 'package:fpdart/fpdart.dart';
import 'package:nextrestro/core/error/failures.dart';
import '../../data/models/voucher_type_model.dart';

abstract class VoucherTypeRepository {
  Future<Either<Failure, VoucherTypeResponse>> getAllVoucherTypes();
}
