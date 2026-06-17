import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:nextrestro/core/error/error_handler.dart';
import 'package:nextrestro/features/customer/data/models/customer_model.dart';
import 'package:nextrestro/features/customer/data/repositories/customer_repository_impl.dart';

part 'customer_provider.g.dart';

@riverpod
class Customers extends _$Customers {
  @override
  Future<List<CustomerModel>> build() async {
    final repository = ref.watch(customerRepositoryProvider);
    return repository.getCustomers();
  }

  Future<void> addCustomer(CustomerModel customer) async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(customerRepositoryProvider);
      await repository.createCustomer(customer);
      final newList = await repository.getCustomers();
      state = AsyncValue.data(newList);
    } catch (e, stack) {
      final failure = ErrorHandler.handleException(e);
      state = AsyncValue.error(failure.message, stack);
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(customerRepositoryProvider);
      final newList = await repository.getCustomers();
      state = AsyncValue.data(newList);
    } catch (e, stack) {
      final failure = ErrorHandler.handleException(e);
      state = AsyncValue.error(failure.message, stack);
    }
  }
}
