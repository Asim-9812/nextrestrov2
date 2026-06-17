import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:nextrestro/core/network/api_client.dart';
import 'package:nextrestro/core/network/api_constants.dart';
import 'package:nextrestro/features/customer/data/models/customer_model.dart';
import 'package:nextrestro/features/customer/domain/repositories/customer_repository.dart';

final customerRepositoryProvider = Provider<CustomerRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return CustomerRepositoryImpl(apiClient);
});

class CustomerRepositoryImpl implements CustomerRepository {
  final ApiClient _apiClient;
  final Logger _logger = Logger();

  CustomerRepositoryImpl(this._apiClient);

  @override
  Future<List<CustomerModel>> getCustomers() async {
    try {
      _logger.i('Fetching customers list');
      final response = await _apiClient.get(ApiConstants.getCustomersEndpoint);
      if (response.data is List) {
        final customers = (response.data as List)
            .map((e) => CustomerModel.fromJson(e as Map<String, dynamic>))
            .toList();
        _logger.i('Fetched ${customers.length} customers');
        return customers;
      }
      return [];
    } catch (e) {
      _logger.e('Failed to fetch customers', error: e);
      rethrow;
    }
  }

  @override
  Future<void> createCustomer(CustomerModel customer) async {
    try {
      _logger.i('Creating new customer: ${customer.firstName} ${customer.lastName}');
      await _apiClient.post(
        ApiConstants.createCustomerEndpoint,
        data: customer.toJson(),
      );
      _logger.i('Customer created successfully');
    } catch (e) {
      _logger.e('Failed to create customer', error: e);
      rethrow;
    }
  }

  @override
  Future<CustomerModel> getCustomerById(int customerId) async {
    try {
      _logger.i('Fetching customer details for ID: $customerId');
      final endpoint = ApiConstants.getCustomerByIdEndpoint
          .replaceFirst(':id', customerId.toString());
      final response = await _apiClient.get(endpoint);
      
      final customer = CustomerModel.fromJson(response.data as Map<String, dynamic>);
      _logger.i('Fetched details for customer: ${customer.firstName} ${customer.lastName}');
      return customer;
    } catch (e) {
      _logger.e('Failed to fetch customer details for ID: $customerId', error: e);
      rethrow;
    }
  }
}
