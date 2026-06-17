import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/utils/toaster.dart';
import 'package:nextrestro/features/customer/data/models/customer_model.dart';
import 'package:nextrestro/features/customer/presentation/providers/customer_provider.dart';
import 'package:nextrestro/features/orders/presentation/providers/place_order_provider.dart';

import '../../../../../../reservation/presentation/providers/reservation_provider.dart';

class CustomerSelectionPortraitDialog extends ConsumerStatefulWidget {
  const CustomerSelectionPortraitDialog({super.key});

  @override
  ConsumerState<CustomerSelectionPortraitDialog> createState() => _CustomerSelectionPortraitDialogState();
}

class _CustomerSelectionPortraitDialogState extends ConsumerState<CustomerSelectionPortraitDialog> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final customersAsync = ref.watch(customersProvider);
    final isNewCustomer = ref.watch(isNewCustomerProvider);

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  isNewCustomer ? 'New Customer' : 'Select Customer',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton.icon(
                  onPressed: () => ref.read(isNewCustomerProvider.notifier).toggle(),
                  icon: Icon(isNewCustomer ? Icons.list : Icons.person_add, size: 18),
                  label: Text(isNewCustomer ? 'List' : 'New'),
                  style: TextButton.styleFrom(foregroundColor: AppColors.primary),
                ),
              ],
            ),
            const Divider(),
            Expanded(
              child: isNewCustomer
                  ? const SingleChildScrollView(child: NewCustomerPortraitForm())
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
            hintText: 'Search customer...',
            prefixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: AppColors.bg,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
            isDense: true,
          ),
        ),
        const SizedBox(height: 12),
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
                return const Center(child: Text('No customers found', style: TextStyle(color: Colors.grey)));
              }

              return ListView.separated(
                itemCount: filtered.length,
                separatorBuilder: (context, index) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final customer = filtered[index];
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                      child: Text(customer.firstName[0].toUpperCase(), style: const TextStyle(color: AppColors.primary)),
                    ),
                    title: Text('${customer.firstName} ${customer.lastName}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    subtitle: Text(customer.phone, style: const TextStyle(fontSize: 12)),
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

class NewCustomerPortraitForm extends ConsumerStatefulWidget {
  const NewCustomerPortraitForm({super.key});

  @override
  ConsumerState<NewCustomerPortraitForm> createState() => _NewCustomerPortraitFormState();
}

class _NewCustomerPortraitFormState extends ConsumerState<NewCustomerPortraitForm> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
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
        Toaster.error(context: context, message: next.error.toString());
      }
    });

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _firstNameController,
            decoration: const InputDecoration(labelText: 'First Name', border: OutlineInputBorder()),
            validator: (v) => v!.isEmpty ? 'Required' : null,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _lastNameController,
            decoration: const InputDecoration(labelText: 'Last Name', border: OutlineInputBorder()),
            validator: (v) => v!.isEmpty ? 'Required' : null,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _phoneController,
            decoration: const InputDecoration(labelText: 'Phone Number', border: OutlineInputBorder()),
            keyboardType: TextInputType.phone,
            validator: (v) => v!.isEmpty ? 'Required' : null,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: createStatus.isLoading ? null : () {
                if (_formKey.currentState!.validate()) {
                  final customer = CustomerModel(
                    customerID: 0,
                    firstName: _firstNameController.text,
                    lastName: _lastNameController.text,
                    phone: _phoneController.text,
                    email: '',
                    address: '',
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
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: createStatus.isLoading 
                ? const CircularProgressIndicator(color: Colors.white) 
                : const Text('SAVE & SELECT', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
