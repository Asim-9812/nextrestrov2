import 'package:fpdart/fpdart.dart';
import 'package:nextrestro/core/error/failures.dart';
import '../../data/models/prefix_suffix_model.dart';

abstract class PrefixSuffixRepository {
  Future<Either<Failure, PrefixSuffixResponse>> getAllPrefixSuffixes();
}
