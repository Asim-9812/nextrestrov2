import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/prefix_suffix_model.dart';
import '../../data/repositories/prefix_suffix_repository_impl.dart';

part 'prefix_suffix_provider.g.dart';

@riverpod
Future<List<PrefixSuffixModel>> prefixSuffixes(Ref ref) async {
  final result = await ref.read(prefixSuffixRepositoryProvider).getAllPrefixSuffixes();
  return result.fold(
    (failure) => throw failure.message,
    (response) => response.data ?? [],
  );
}
