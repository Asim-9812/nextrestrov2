import 'package:fpdart/fpdart.dart';
import 'package:nextrestro/core/error/failures.dart';
import 'package:nextrestro/features/shift/data/models/shift_model.dart';

abstract class ShiftRepository {
  Future<Either<Failure, ShiftResponse>> getAllShifts();
  Future<Either<Failure, ShiftModel?>> getLastClosedShift();
  Future<Either<Failure, bool>> closeShift(ShiftModel shift);
  Future<Either<Failure, bool>> openShift(ShiftModel shift);
}
