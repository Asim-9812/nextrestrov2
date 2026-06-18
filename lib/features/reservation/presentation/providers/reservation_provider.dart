import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:nextrestro/core/error/error_handler.dart';
import 'package:nextrestro/features/reservation/data/models/reservation_model.dart';
import 'package:nextrestro/features/reservation/data/repositories/reservation_repository_impl.dart';
import 'package:nextrestro/features/customer/data/models/customer_model.dart';
import 'package:nextrestro/features/customer/data/repositories/customer_repository_impl.dart';
import 'package:nextrestro/features/customer/presentation/providers/customer_provider.dart';
import 'package:nextrestro/core/network/session_service.dart';

part 'reservation_provider.g.dart';

@riverpod
class ReservationState extends _$ReservationState {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> createReservation(ReservationRequest request) async {
    final link = ref.keepAlive();
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(reservationRepositoryProvider);
      await repository.createReservation(request);
      state = const AsyncValue.data(null);
    } catch (e, stack) {
      final failure = ErrorHandler.handleException(e);
      state = AsyncValue.error(failure.message, stack);
    } finally {
      link.close();
    }
  }
}

@riverpod
class IsNewCustomer extends _$IsNewCustomer {
  @override
  bool build() => false;

  void toggle() => state = !state;
  void set(bool value) => state = value;
}

@riverpod
class SelectedCustomer extends _$SelectedCustomer {
  @override
  CustomerModel? build() => null;

  void select(CustomerModel? customer) => state = customer;
}

@riverpod
class CreateCustomerState extends _$CreateCustomerState {
  @override
  AsyncValue<CustomerModel?> build() => const AsyncValue.data(null);

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
      
      ref.read(selectedCustomerProvider.notifier).select(newCustomer);
      ref.read(isNewCustomerProvider.notifier).set(false);
      state = AsyncValue.data(newCustomer);
    } catch (e, stack) {
      final failure = ErrorHandler.handleException(e);
      state = AsyncValue.error(failure.message, stack);
    } finally {
      link.close();
    }
  }
}

// --- Reservation Management Providers ---

@riverpod
Future<List<ReservationListItem>> allReservations(Ref ref) async {
  final repository = ref.watch(reservationRepositoryProvider);
  return repository.getAllReservations();
}

@riverpod
Future<CustomerModel> customerInfo(Ref ref, int customerId) async {
  final repository = ref.watch(customerRepositoryProvider);
  return repository.getCustomerById(customerId);
}

@Riverpod(keepAlive: true)
class SelectedReservationId extends _$SelectedReservationId {
  @override
  int? build() => null;

  void select(int? id) => state = id;
}

@riverpod
Future<List<ReservationDetailItem>> reservationDetails(Ref ref, int reservationId) async {
  final repository = ref.watch(reservationRepositoryProvider);
  return repository.getReservationDetails(reservationId);
}

@riverpod
class CancelReservationState extends _$CancelReservationState {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> cancel(int detailsId, String reason) async {
    final link = ref.keepAlive();
    state = const AsyncValue.loading();
    try {
      final session = ref.read(sessionServiceProvider);
      final userId = session.getUser()?['userId'] ?? 0;
      final repository = ref.read(reservationRepositoryProvider);
      
      await repository.cancelReservation(detailsId, userId, reason);
      
      // Refresh list
      ref.invalidate(allReservationsProvider);
      state = const AsyncValue.data(null);
    } catch (e, stack) {
      final failure = ErrorHandler.handleException(e);
      state = AsyncValue.error(failure.message, stack);
    } finally {
      link.close();
    }
  }
}

@riverpod
class ReservationSearchQuery extends _$ReservationSearchQuery {
  @override
  String build() => '';

  void set(String query) => state = query;
}
