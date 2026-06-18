import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/error/error_handler.dart';
import 'package:nextrestro/core/utils/toaster.dart';
import 'package:nextrestro/features/customer/data/models/customer_model.dart';
import 'package:nextrestro/features/customer/presentation/providers/customer_provider.dart';
import 'package:intl/intl.dart';

class CustomerLandscapePage extends ConsumerWidget {
  const CustomerLandscapePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredCustomers = ref.watch(filteredCustomersProvider);
    final customersAsync = ref.watch(customersProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Manage Customers',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Manrope',
                      ),
                    ),
                    Text(
                      'View, add and edit your customer database',
                      style: TextStyle(color: AppColors.grey, fontSize: 13),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: TextField(
                  onChanged: (val) => ref.read(customerSearchQueryProvider.notifier).set(val),
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    hintText: 'Search by name, phone or email...',
                    hintStyle: const TextStyle(fontSize: 14),
                    prefixIcon: const Icon(Icons.search, color: AppColors.primary),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 1, color: AppColors.ashGrey),
        
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Section - Customer List
              Expanded(
                flex: 1,
                child: Container(
                  color: AppColors.bg,
                  child: customersAsync.when(
                    data: (_) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                ref.read(isAddingCustomerProvider.notifier).set(true);
                                ref.read(selectedCustomerForEditProvider.notifier).select(null);
                              },
                              icon: const Icon(Icons.person_add_alt_1, size: 18),
                              label: const Text('Add New Customer'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                foregroundColor: Colors.white,
                                minimumSize: const Size(double.infinity, 48),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                elevation: 0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: [
                                const Text('Filter:', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: AppColors.ashGrey),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<CustomerFilterType>(
                                        value: ref.watch(customerFilterProvider),
                                        isExpanded: true,
                                        style: const TextStyle(fontSize: 12, color: Colors.black),
                                        items: [
                                          const DropdownMenuItem(value: CustomerFilterType.all, child: Text('All Customers')),
                                          const DropdownMenuItem(value: CustomerFilterType.member, child: Text('Loyalty Members')),
                                          const DropdownMenuItem(value: CustomerFilterType.nonMember, child: Text('Regular Customers')),
                                        ],
                                        onChanged: (val) {
                                          if (val != null) ref.read(customerFilterProvider.notifier).set(val);
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                            child: filteredCustomers.isEmpty 
                              ? const Center(child: Text('No customers found', style: TextStyle(color: AppColors.grey)))
                              : ListView.builder(
                                  padding: const EdgeInsets.all(16),
                                  itemCount: filteredCustomers.length,
                                  itemBuilder: (context, index) {
                                    return CustomerListCard(customer: filteredCustomers[index]);
                                  },
                                ),
                          ),
                        ],
                      );
                    },
                    loading: () => const Center(child: CircularProgressIndicator()),
                    error: (err, stack) => Center(child: Text('Error: $err')),
                  ),
                ),
              ),
              const VerticalDivider(width: 1, color: AppColors.ashGrey),
              // Right Section - Details & Edit
              const Expanded(
                flex: 2,
                child: CustomerDetailSection(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomerListCard extends ConsumerWidget {
  final CustomerModel customer;

  const CustomerListCard({super.key, required this.customer});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCustomer = ref.watch(selectedCustomerForEditProvider);
    final isAdding = ref.watch(isAddingCustomerProvider);
    final isSelected = selectedCustomer?.customerID == customer.customerID;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          ref.read(selectedCustomerForEditProvider.notifier).select(customer);
          ref.read(isAddingCustomerProvider.notifier).set(false);
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: (isSelected && !isAdding) ? AppColors.primary : Colors.transparent,
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: (customer.isMember ? AppColors.primary : AppColors.grey).withOpacity(0.1),
                child: Text(
                  customer.firstName.isNotEmpty ? customer.firstName[0].toUpperCase() : 'C',
                  style: TextStyle(
                    color: customer.isMember ? AppColors.primary : AppColors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${customer.firstName} ${customer.lastName}',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      customer.phone,
                      style: const TextStyle(color: AppColors.grey, fontSize: 11),
                    ),
                  ],
                ),
              ),
              if (customer.isMember)
                const Icon(Icons.star, color: Colors.amber, size: 16),
              const Icon(Icons.chevron_right, color: AppColors.ashGrey),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomerDetailSection extends ConsumerWidget {
  const CustomerDetailSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAdding = ref.watch(isAddingCustomerProvider);

    if (isAdding) {
      return const AddCustomerSection();
    }

    return const CustomerEditSection();
  }
}

class CustomerEditSection extends ConsumerStatefulWidget {
  const CustomerEditSection({super.key});

  @override
  ConsumerState<CustomerEditSection> createState() => _CustomerEditSectionState();
}

class _CustomerEditSectionState extends ConsumerState<CustomerEditSection> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _fNameController;
  late TextEditingController _lNameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _addressController;
  late TextEditingController _loyaltyPointsController;
  late TextEditingController _dobController;
  String? _selectedGender;
  bool _isMember = false;
  DateTime? _selectedDob;

  @override
  void initState() {
    super.initState();
    final selected = ref.read(selectedCustomerForEditProvider);
    _initControllers(selected);
  }

  void _initControllers(CustomerModel? selected) {
    _fNameController = TextEditingController(text: selected?.firstName ?? '');
    _lNameController = TextEditingController(text: selected?.lastName ?? '');
    _emailController = TextEditingController(text: selected?.email ?? '');
    _phoneController = TextEditingController(text: selected?.phone ?? '');
    _addressController = TextEditingController(text: selected?.address ?? '');
    _loyaltyPointsController = TextEditingController(text: selected?.loyaltyPoints.toString() ?? '0');
    _selectedGender = selected?.gender;
    _isMember = selected?.isMember ?? false;
    _selectedDob = selected?.dob;
    _dobController = TextEditingController(
      text: _selectedDob != null ? DateFormat('yyyy-MM-dd').format(_selectedDob!) : '',
    );
  }

  @override
  void dispose() {
    _fNameController.dispose();
    _lNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _loyaltyPointsController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedCustomer = ref.watch(selectedCustomerForEditProvider);

    ref.listen<CustomerModel?>(selectedCustomerForEditProvider, (previous, next) {
      if (next != null) {
        _fNameController.text = next.firstName;
        _lNameController.text = next.lastName;
        _emailController.text = next.email;
        _phoneController.text = next.phone;
        _addressController.text = next.address;
        _loyaltyPointsController.text = next.loyaltyPoints.toString();
        setState(() {
          _selectedGender = next.gender;
          _isMember = next.isMember;
          _selectedDob = next.dob;
          _dobController.text = _selectedDob != null ? DateFormat('yyyy-MM-dd').format(_selectedDob!) : '';
        });
      }
    });

    if (selectedCustomer == null) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person_outline, size: 64, color: AppColors.ashGrey),
            SizedBox(height: 16),
            Text(
              'Select a customer to view details',
              style: TextStyle(color: AppColors.grey, fontSize: 16),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: AppColors.primary.withOpacity(0.1),
                  child: Text(
                    selectedCustomer.firstName.isNotEmpty ? selectedCustomer.firstName[0].toUpperCase() : 'C',
                    style: const TextStyle(color: AppColors.primary, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${selectedCustomer.firstName} ${selectedCustomer.lastName}',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Manrope'),
                    ),
                    Text(
                      'Customer ID: #${selectedCustomer.customerID}',
                      style: const TextStyle(color: AppColors.grey, fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text('Personal Information', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: _buildTextField('First Name', _fNameController, icon: Icons.person_outline)),
                const SizedBox(width: 16),
                Expanded(child: _buildTextField('Last Name', _lNameController, icon: Icons.person_outline)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: _buildTextField('Email', _emailController, icon: Icons.email_outlined, keyboardType: TextInputType.emailAddress)),
                const SizedBox(width: 16),
                Expanded(child: _buildTextField('Phone', _phoneController, icon: Icons.phone_outlined, keyboardType: TextInputType.phone)),
              ],
            ),
            const SizedBox(height: 16),
            _buildTextField('Address', _addressController, icon: Icons.location_on_outlined, isMultiline: true),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Gender', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        value: _selectedGender,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.people_outline, size: 20, color: AppColors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.ashGrey)),
                          contentPadding: const EdgeInsets.all(16),
                        ),
                        items: ['Male', 'Female', 'Other', 'N/A'].map((g) => DropdownMenuItem(value: g, child: Text(g))).toList(),
                        onChanged: (val) => setState(() => _selectedGender = val),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Date of Birth', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _dobController,
                        readOnly: true,
                        onTap: () async {
                          final date = await showDatePicker(
                            context: context,
                            initialDate: _selectedDob ?? DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );
                          if (date != null) {
                            setState(() {
                              _selectedDob = date;
                              _dobController.text = DateFormat('yyyy-MM-dd').format(date);
                            });
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.calendar_today_outlined, size: 20, color: AppColors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.ashGrey)),
                          contentPadding: const EdgeInsets.all(16),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.05),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.primary.withOpacity(0.1)),
              ),
              child: Row(
                children: [
                  Checkbox(
                    value: _isMember,
                    onChanged: (val) => setState(() => _isMember = val ?? false),
                    activeColor: AppColors.primary,
                  ),
                  const Text('Loyalty Member', style: TextStyle(fontWeight: FontWeight.bold)),
                  const Spacer(),
                  const Text('Points: ', style: TextStyle(color: AppColors.grey)),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 80,
                    child: TextField(
                      controller: _loyaltyPointsController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(isDense: true, contentPadding: EdgeInsets.symmetric(vertical: 8)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _handleUpdate(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('Update Customer', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 16),
                OutlinedButton(
                  onPressed: () => _handleDelete(context),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.error,
                    side: const BorderSide(color: AppColors.error),
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Icon(Icons.delete_outline),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {IconData? icon, bool isMultiline = false, TextInputType? keyboardType}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          maxLines: isMultiline ? 3 : 1,
          keyboardType: keyboardType,
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            prefixIcon: icon != null ? Icon(icon, color: AppColors.grey, size: 20) : null,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.ashGrey)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.ashGrey)),
            contentPadding: const EdgeInsets.all(16),
          ),
          validator: (val) => val == null || val.isEmpty ? 'Required' : null,
        ),
      ],
    );
  }

  Future<void> _handleUpdate(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;
    
    final selected = ref.read(selectedCustomerForEditProvider);
    if (selected == null) return;

    try {
      final updated = selected.copyWith(
        firstName: _fNameController.text,
        lastName: _lNameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        address: _addressController.text,
        gender: _selectedGender,
        dob: _selectedDob,
        isMember: _isMember,
        loyaltyPoints: int.tryParse(_loyaltyPointsController.text) ?? 0,
      );

      await ref.read(updateCustomerStateProvider.notifier).updateCustomer(updated);
      if (context.mounted) {
        Toaster.success(context: context, message: 'Customer updated successfully', isLandscape: true);
      }
    } catch (e) {
      final failure = ErrorHandler.handleException(e);
      if (context.mounted) {
        Toaster.error(context: context, message: failure.message, isLandscape: true);
      }
    }
  }

  Future<void> _handleDelete(BuildContext context) async {
    final selected = ref.read(selectedCustomerForEditProvider);
    if (selected == null) return;

    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Customer'),
        content: Text('Are you sure you want to delete "${selected.firstName} ${selected.lastName}"?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirm == true && context.mounted) {
      try {
        await ref.read(deleteCustomerStateProvider.notifier).deleteCustomer(selected.customerID);
        if (context.mounted) {
          ref.read(selectedCustomerForEditProvider.notifier).select(null);
          Toaster.success(context: context, message: 'Customer deleted successfully', isLandscape: true);
        }
      } catch (e) {
        final failure = ErrorHandler.handleException(e);
        if (context.mounted) {
          Toaster.error(context: context, message: failure.message, isLandscape: true);
        }
      }
    }
  }
}

class AddCustomerSection extends ConsumerStatefulWidget {
  const AddCustomerSection({super.key});

  @override
  ConsumerState<AddCustomerSection> createState() => _AddCustomerSectionState();
}

class _AddCustomerSectionState extends ConsumerState<AddCustomerSection> {
  final _formKey = GlobalKey<FormState>();
  final _fNameController = TextEditingController();
  final _lNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _loyaltyPointsController = TextEditingController(text: '0');
  final _dobController = TextEditingController();
  String? _selectedGender;
  bool _isMember = false;
  DateTime? _selectedDob;

  @override
  void dispose() {
    _fNameController.dispose();
    _lNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _loyaltyPointsController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => ref.read(isAddingCustomerProvider.notifier).set(false),
                  icon: const Icon(Icons.arrow_back),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Add New Customer',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Manrope'),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(child: _buildTextField('First Name', _fNameController, icon: Icons.person_outline, hint: 'e.g. John')),
                const SizedBox(width: 16),
                Expanded(child: _buildTextField('Last Name', _lNameController, icon: Icons.person_outline, hint: 'e.g. Doe')),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: _buildTextField('Email', _emailController, icon: Icons.email_outlined, hint: 'john@example.com', keyboardType: TextInputType.emailAddress)),
                const SizedBox(width: 16),
                Expanded(child: _buildTextField('Phone', _phoneController, icon: Icons.phone_outlined, hint: '98XXXXXXXX', keyboardType: TextInputType.phone)),
              ],
            ),
            const SizedBox(height: 16),
            _buildTextField('Address', _addressController, icon: Icons.location_on_outlined, hint: 'Customer address...', isMultiline: true),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Gender', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        value: _selectedGender,
                        hint: const Text('Select'),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.people_outline, size: 20, color: AppColors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.ashGrey)),
                          contentPadding: const EdgeInsets.all(16),
                        ),
                        items: ['Male', 'Female', 'Other', 'N/A'].map((g) => DropdownMenuItem(value: g, child: Text(g))).toList(),
                        onChanged: (val) => setState(() => _selectedGender = val),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Date of Birth', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _dobController,
                        readOnly: true,
                        onTap: () async {
                          final date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now().subtract(const Duration(days: 365 * 20)),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );
                          if (date != null) {
                            setState(() {
                              _selectedDob = date;
                              _dobController.text = DateFormat('yyyy-MM-dd').format(date);
                            });
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.calendar_today_outlined, size: 20, color: AppColors.grey),
                          hintText: 'YYYY-MM-DD',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.ashGrey)),
                          contentPadding: const EdgeInsets.all(16),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.05),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.primary.withOpacity(0.1)),
              ),
              child: Row(
                children: [
                  Checkbox(
                    value: _isMember,
                    onChanged: (val) => setState(() => _isMember = val ?? false),
                    activeColor: AppColors.primary,
                  ),
                  const Text('Loyalty Member', style: TextStyle(fontWeight: FontWeight.bold)),
                  const Spacer(),
                  const Text('Initial Points: ', style: TextStyle(color: AppColors.grey)),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 80,
                    child: TextField(
                      controller: _loyaltyPointsController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(isDense: true, contentPadding: EdgeInsets.symmetric(vertical: 8)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _handleCreate(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Create Customer', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {IconData? icon, bool isMultiline = false, String? hint, TextInputType? keyboardType}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          maxLines: isMultiline ? 3 : 1,
          keyboardType: keyboardType,
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: icon != null ? Icon(icon, color: AppColors.grey, size: 20) : null,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.ashGrey)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.ashGrey)),
            contentPadding: const EdgeInsets.all(16),
          ),
          validator: (val) => val == null || val.isEmpty ? 'Required' : null,
        ),
      ],
    );
  }

  Future<void> _handleCreate(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;

    try {
      final newCustomer = CustomerModel(
        customerID: 0,
        firstName: _fNameController.text,
        lastName: _lNameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        address: _addressController.text,
        gender: _selectedGender,
        dob: _selectedDob,
        isMember: _isMember,
        loyaltyPoints: int.tryParse(_loyaltyPointsController.text) ?? 0,
      );

      await ref.read(addCustomerStateProvider.notifier).createCustomer(newCustomer);
      if (context.mounted) {
        Toaster.success(context: context, message: 'Customer created successfully', isLandscape: true);
        ref.read(isAddingCustomerProvider.notifier).set(false);
      }
    } catch (e) {
      final failure = ErrorHandler.handleException(e);
      if (context.mounted) {
        Toaster.error(context: context, message: failure.message, isLandscape: true);
      }
    }
  }
}
