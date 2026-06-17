import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/utils/toaster.dart';
import 'package:nextrestro/features/customer/data/models/customer_model.dart';
import 'package:nextrestro/features/customer/presentation/providers/customer_provider.dart';
import 'package:nextrestro/features/orders/presentation/providers/place_order_provider.dart';
import 'package:nextrestro/features/reservation/presentation/providers/reservation_provider.dart';

class CustomerSelectionLandscapeDialog extends ConsumerStatefulWidget {
  const CustomerSelectionLandscapeDialog({super.key});

  @override
  ConsumerState<CustomerSelectionLandscapeDialog> createState() => _CustomerSelectionDialogState();
}

class _CustomerSelectionDialogState extends ConsumerState<CustomerSelectionLandscapeDialog> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final customersAsync = ref.watch(customersProvider);
    final isNewCustomer = ref.watch(isNewCustomerProvider);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 600,
        height: 650,
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  isNewCustomer ? 'Create New Customer' : 'Select Customer',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Manrope'),
                ),
                ElevatedButton.icon(
                  onPressed: () => ref.read(isNewCustomerProvider.notifier).toggle(),
                  icon: Icon(isNewCustomer ? Icons.list : Icons.person_add),
                  label: Text(isNewCustomer ? 'Back to List' : 'New Customer'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isNewCustomer ? AppColors.ashGrey : AppColors.primary,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
            const Divider(height: 32),
            Expanded(
              child: isNewCustomer
                  ? const SingleChildScrollView(child: NewCustomerForm())
                  : _buildCustomerList(customersAsync),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomerList(AsyncValue<List<CustomerModel>> customersAsync) {
    return Column(
      children: [
        TextField(
          onChanged: (val) => setState(() => _searchQuery = val),
          decoration: InputDecoration(
            hintText: 'Search by name or phone...',
            prefixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: AppColors.bg,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            isDense: true,
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: customersAsync.when(
            data: (customers) {
              final filtered = customers.where((c) {
                final query = _searchQuery.toLowerCase();
                return c.firstName.toLowerCase().contains(query) ||
                    c.lastName.toLowerCase().contains(query) ||
                    c.phone.contains(query);
              }).toList();

              if (filtered.isEmpty) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person_search, size: 48, color: Colors.grey),
                      SizedBox(height: 8),
                      Text('No customers found', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                );
              }

              return ListView.separated(
                itemCount: filtered.length,
                separatorBuilder: (context, index) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final customer = filtered[index];
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    leading: CircleAvatar(
                      backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                      child: Text(
                        customer.firstName[0].toUpperCase(),
                        style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
                      ),
                    ),
                    title: Text('${customer.firstName} ${customer.lastName}', style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(customer.phone),
                    trailing: const Icon(Icons.check_circle_outline, color: AppColors.ashGrey),
                    onTap: () {
                      ref.read(placeOrderProvider.notifier).selectCustomer(customer);
                      Navigator.pop(context);
                    },
                  );
                },
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, _) => Center(child: Text('Error: $err')),
          ),
        ),
      ],
    );
  }
}

class NewCustomerForm extends ConsumerStatefulWidget {
  const NewCustomerForm({super.key});

  @override
  ConsumerState<NewCustomerForm> createState() => _NewCustomerFormState();
}

class _NewCustomerFormState extends ConsumerState<NewCustomerForm> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final createStatus = ref.watch(createCustomerStateProvider);

    ref.listen(createCustomerStateProvider, (previous, next) {
      if (next.hasValue && next.value != null && !next.isLoading) {
        ref.read(placeOrderProvider.notifier).selectCustomer(next.value);
        Navigator.pop(context);
      }
      if (next.hasError) {
        Toaster.error(context: context, message: next.error.toString(), isLandscape: true);
      }
    });

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _firstNameController,
                  decoration: const InputDecoration(labelText: 'First Name', border: OutlineInputBorder()),
                  validator: (v) => v!.isEmpty ? 'Required' : null,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(labelText: 'Last Name', border: OutlineInputBorder()),
                  validator: (v) => v!.isEmpty ? 'Required' : null,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _phoneController,
            decoration: const InputDecoration(labelText: 'Phone Number', border: OutlineInputBorder()),
            validator: (v) => v!.isEmpty ? 'Required' : null,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email (Optional)', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _addressController,
            decoration: const InputDecoration(labelText: 'Address (Optional)', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: createStatus.isLoading ? null : () {
                if (_formKey.currentState!.validate()) {
                  final customer = CustomerModel(
                    customerID: 0,
                    firstName: _firstNameController.text,
                    lastName: _lastNameController.text,
                    phone: _phoneController.text,
                    email: _emailController.text,
                    address: _addressController.text,
                    loyaltyPoints: 0,
                    isMember: false,
                    gender: 'N/A',
                    dob: DateTime.now(),
                  );
                  ref.read(createCustomerStateProvider.notifier).createAndSelect(customer);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: createStatus.isLoading 
                ? const CircularProgressIndicator(color: Colors.white) 
                : const Text('SAVE & SELECT CUSTOMER', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1)),
            ),
          ),
        ],
      ),
    );
  }
}
