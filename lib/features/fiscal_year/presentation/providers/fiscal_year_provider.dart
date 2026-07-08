import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/fiscal_year_model.dart';
import '../../data/repositories/fiscal_year_repository_impl.dart';

part 'fiscal_year_provider.g.dart';

@riverpod
Future<List<FiscalYearModel>> fiscalYears(Ref ref) async {
  final result = await ref.read(fiscalYearRepositoryProvider).getAllFiscalYears();
  return result.fold(
    (failure) => throw failure.message,
    (response) => response.data ?? [],
  );
}
