import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/voucher_type_model.dart';
import '../../data/repositories/voucher_type_repository_impl.dart';

part 'voucher_type_provider.g.dart';

@riverpod
Future<List<VoucherTypeModel>> voucherTypes(Ref ref) async {
  final result = await ref.read(voucherTypeRepositoryProvider).getAllVoucherTypes();
  return result.fold(
    (failure) => throw failure.message,
    (response) => response.data ?? [],
  );
}
