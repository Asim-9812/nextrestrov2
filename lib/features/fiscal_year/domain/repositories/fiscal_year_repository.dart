import 'package:fpdart/fpdart.dart';
import 'package:nextrestro/core/error/failures.dart';
import '../../data/models/fiscal_year_model.dart';

abstract class FiscalYearRepository {
  Future<Either<Failure, FiscalYearResponse>> getAllFiscalYears();
}
