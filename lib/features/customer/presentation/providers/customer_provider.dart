import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:nextrestro/core/error/error_handler.dart';
import 'package:nextrestro/features/customer/data/models/customer_model.dart';
import 'package:nextrestro/features/customer/data/repositories/customer_repository_impl.dart';

part 'customer_provider.g.dart';

@riverpod
Future<List<CustomerModel>> customers(Ref ref) async {
  final repository = ref.watch(customerRepositoryProvider);
  return repository.getCustomers();
}

@riverpod
class CustomerSearchQuery extends _$CustomerSearchQuery {
  @override
  String build() => '';

  void set(String query) => state = query;
}

enum CustomerFilterType { all, member, nonMember }

@riverpod
class CustomerFilter extends _$CustomerFilter {
  @override
  CustomerFilterType build() => CustomerFilterType.all;

  void set(CustomerFilterType filter) => state = filter;
}

@Riverpod(keepAlive: true)
class SelectedCustomerForEdit extends _$SelectedCustomerForEdit {
  @override
  CustomerModel? build() => null;

  void select(CustomerModel? customer) => state = customer;
}

@riverpod
class IsAddingCustomer extends _$IsAddingCustomer {
  @override
  bool build() => false;

  void set(bool value) => state = value;
}

@riverpod
class AddCustomerState extends _$AddCustomerState {
  @override
  AsyncValue<CustomerModel?> build() => const AsyncValue.data(null);

  Future<void> createCustomer(CustomerModel customer) async {
    final link = ref.keepAlive();
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(customerRepositoryProvider);
      await repository.createCustomer(customer);
      ref.invalidate(customersProvider);
      state = AsyncValue.data(customer);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    } finally {
      link.close();
    }
  }

  Future<void> createAndSelect(CustomerModel customer) async {
    final link = ref.keepAlive();
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(customerRepositoryProvider);
      await repository.createCustomer(customer);
      
      ref.invalidate(customersProvider);
      final newList = await ref.read(customersProvider.future);
      
      final newCustomer = newList.firstWhere(
        (c) => c.phone == customer.phone || (customer.email.isNotEmpty && c.email == customer.email),
        orElse: () => customer,
      );
      
      state = AsyncValue.data(newCustomer);
    } catch (e, stack) {
      final failure = ErrorHandler.handleException(e);
      state = AsyncValue.error(failure.message, stack);
    } finally {
      link.close();
    }
  }
}

@riverpod
class UpdateCustomerState extends _$UpdateCustomerState {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> updateCustomer(CustomerModel customer) async {
    final link = ref.keepAlive();
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(customerRepositoryProvider);
      await repository.updateCustomer(customer);
      ref.invalidate(customersProvider);
      state = const AsyncValue.data(null);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    } finally {
      link.close();
    }
  }
}

@riverpod
class DeleteCustomerState extends _$DeleteCustomerState {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> deleteCustomer(int customerId) async {
    final link = ref.keepAlive();
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(customerRepositoryProvider);
      await repository.deleteCustomer(customerId);
      ref.invalidate(customersProvider);
      state = const AsyncValue.data(null);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    } finally {
      link.close();
    }
  }
}

@riverpod
List<CustomerModel> filteredCustomers(Ref ref) {
  final customersAsync = ref.watch(customersProvider);
  final search = ref.watch(customerSearchQueryProvider).toLowerCase();
  final filter = ref.watch(customerFilterProvider);

  return customersAsync.maybeWhen(
    data: (customers) {
      return customers.where((c) {
        final matchesSearch = '${c.firstName} ${c.lastName}'.toLowerCase().contains(search) ||
            c.phone.contains(search) ||
            c.email.toLowerCase().contains(search);
        
        bool matchesFilter = true;
        if (filter == CustomerFilterType.member) {
          matchesFilter = c.isMember;
        } else if (filter == CustomerFilterType.nonMember) {
          matchesFilter = !c.isMember;
        }

        return matchesSearch && matchesFilter;
      }).toList();
    },
    orElse: () => [],
  );
}
