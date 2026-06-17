import 'package:nextrestro/features/customer/data/models/customer_model.dart';

abstract class CustomerRepository {
  Future<List<CustomerModel>> getCustomers();
  Future<void> createCustomer(CustomerModel customer);
  Future<CustomerModel> getCustomerById(int customerId);
}
