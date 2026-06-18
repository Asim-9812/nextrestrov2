import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/utils/toaster.dart';
import 'package:nextrestro/features/customer/data/models/customer_model.dart';
import 'package:nextrestro/features/customer/presentation/providers/customer_provider.dart';

class CustomerPortraitPage extends ConsumerStatefulWidget {
  const CustomerPortraitPage({super.key});

  @override
  ConsumerState<CustomerPortraitPage> createState() => _CustomerPortraitPageState();
}

class _CustomerPortraitPageState extends ConsumerState<CustomerPortraitPage> {
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
    _initControllers(null);
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
    final filteredCustomers = ref.watch(filteredCustomersProvider);
    final selectedCustomer = ref.watch(selectedCustomerForEditProvider);
    final isAdding = ref.watch(isAddingCustomerProvider);

    // Sync controllers for edit
    ref.listen<CustomerModel?>(selectedCustomerForEditProvider, (prev, next) {
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
      } else {
        _resetForm();
      }
    });

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Column(
        children: [
          // Tab Bar
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.ashGrey.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  _buildTabItem(0, 'Customers', Icons.people_outline, !isAdding),
                  _buildTabItem(1, 'Add New', Icons.person_add_alt_1, isAdding),
                ],
              ),
            ),
          ),

          // Search & Filter (Only in list mode)
          if (!isAdding && selectedCustomer == null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Column(
                children: [
                  TextField(
                    onChanged: (val) => ref.read(customerSearchQueryProvider.notifier).set(val),
                    decoration: InputDecoration(
                      hintText: 'Search by name or phone...',
                      prefixIcon: const Icon(Icons.search, size: 20),
                      filled: true,
                      fillColor: Colors.white,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 36,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildFilterChip(CustomerFilterType.all, 'All'),
                        _buildFilterChip(CustomerFilterType.member, 'Members'),
                        _buildFilterChip(CustomerFilterType.nonMember, 'Regular'),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          Expanded(
            child: isAdding 
              ? _buildFormSection(null) 
              : (selectedCustomer != null ? _buildFormSection(selectedCustomer) : _buildList(filteredCustomers)),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(int index, String label, IconData icon, bool isSelected) {
    return Expanded(
      child: InkWell(
        onTap: () {
          if (index == 0) {
            ref.read(isAddingCustomerProvider.notifier).set(false);
            ref.read(selectedCustomerForEditProvider.notifier).select(null);
          } else {
            ref.read(isAddingCustomerProvider.notifier).set(true);
            ref.read(selectedCustomerForEditProvider.notifier).select(null);
            _resetForm();
          }
        },
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 16, color: isSelected ? AppColors.primary : AppColors.grey),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? AppColors.primary : AppColors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChip(CustomerFilterType type, String label) {
    final active = ref.watch(customerFilterProvider) == type;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label, style: TextStyle(fontSize: 11, color: active ? Colors.white : AppColors.grey)),
        selected: active,
        onSelected: (v) => ref.read(customerFilterProvider.notifier).set(type),
        selectedColor: AppColors.primary,
        backgroundColor: Colors.white,
        checkmarkColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide(color: active ? AppColors.primary : AppColors.ashGrey)),
      ),
    );
  }

  Widget _buildList(List<CustomerModel> list) {
    if (list.isEmpty) return const Center(child: Text('No customers found', style: TextStyle(color: AppColors.grey)));
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: list.length,
      itemBuilder: (context, index) {
        final c = list[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: const BorderSide(color: AppColors.ashGrey, width: 0.5)),
          child: ListTile(
            onTap: () => ref.read(selectedCustomerForEditProvider.notifier).select(c),
            leading: CircleAvatar(
              backgroundColor: (c.isMember ? AppColors.primary : AppColors.grey).withOpacity(0.1),
              child: Text(c.firstName.isNotEmpty ? c.firstName[0].toUpperCase() : 'C', style: TextStyle(color: c.isMember ? AppColors.primary : AppColors.grey, fontWeight: FontWeight.bold)),
            ),
            title: Text('${c.firstName} ${c.lastName}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            subtitle: Text(c.phone, style: const TextStyle(fontSize: 12)),
            trailing: const Icon(Icons.chevron_right, size: 20, color: AppColors.ashGrey),
          ),
        );
      },
    );
  }

  Widget _buildFormSection(CustomerModel? selected) {
    final isEdit = selected != null;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isEdit) ...[
              InkWell(
                onTap: () => ref.read(selectedCustomerForEditProvider.notifier).select(null),
                child: Row(
                  children: [
                    const Icon(Icons.arrow_back_ios, size: 14, color: AppColors.primary),
                    Text('Back to list', style: TextStyle(fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
            _buildField('First Name', _fNameController),
            const SizedBox(height: 12),
            _buildField('Last Name', _lNameController),
            const SizedBox(height: 12),
            _buildField('Phone', _phoneController, keyboardType: TextInputType.phone),
            const SizedBox(height: 12),
            _buildField('Email', _emailController, keyboardType: TextInputType.emailAddress),
            const SizedBox(height: 12),
            _buildField('Address', _addressController, isMultiline: true),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _buildGenderDropdown()),
                const SizedBox(width: 12),
                Expanded(child: _buildDobPicker()),
              ],
            ),
            const SizedBox(height: 20),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Loyalty Member', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              value: _isMember,
              onChanged: (v) => setState(() => _isMember = v),
              activeTrackColor: AppColors.primary,
            ),
            if (_isMember)
               _buildField('Loyalty Points', _loyaltyPointsController, keyboardType: TextInputType.number),
            
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => isEdit ? _handleUpdate(selected) : _handleCreate(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(isEdit ? 'Save Changes' : 'Create Customer', style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            if (isEdit) ...[
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () => _handleDelete(selected),
                  icon: const Icon(Icons.delete_outline, size: 18),
                  label: const Text('Delete Customer'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.error,
                    side: const BorderSide(color: AppColors.error),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildField(String label, TextEditingController controller, {bool isMultiline = false, TextInputType? keyboardType}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          maxLines: isMultiline ? 3 : 1,
          keyboardType: keyboardType,
          style: const TextStyle(fontSize: 13),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(12),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: AppColors.ashGrey)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: AppColors.ashGrey)),
          ),
          validator: (val) => val == null || val.isEmpty ? 'Required' : null,
        ),
      ],
    );
  }

  Widget _buildGenderDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Gender', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        DropdownButtonFormField<String>(
          initialValue: _selectedGender,
          items: ['Male', 'Female', 'Other', 'N/A'].map((g) => DropdownMenuItem(value: g, child: Text(g, style: const TextStyle(fontSize: 13)))).toList(),
          onChanged: (v) => setState(() => _selectedGender = v),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: AppColors.ashGrey)),
          ),
        ),
      ],
    );
  }

  Widget _buildDobPicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Birth Date', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        TextFormField(
          controller: _dobController,
          readOnly: true,
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: _selectedDob ?? DateTime.now().subtract(const Duration(days: 365 * 20)),
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
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            filled: true,
            fillColor: Colors.white,
            suffixIcon: const Icon(Icons.calendar_today, size: 16),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: AppColors.ashGrey)),
          ),
        ),
      ],
    );
  }

  void _resetForm() {
    _fNameController.clear();
    _lNameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _addressController.clear();
    _loyaltyPointsController.text = '0';
    _dobController.clear();
    _selectedGender = null;
    _isMember = false;
    _selectedDob = null;
  }

  Future<void> _handleUpdate(CustomerModel old) async {
    if (!_formKey.currentState!.validate()) return;
    try {
      final updated = old.copyWith(
        firstName: _fNameController.text,
        lastName: _lNameController.text,
        phone: _phoneController.text,
        email: _emailController.text,
        address: _addressController.text,
        gender: _selectedGender,
        dob: _selectedDob,
        isMember: _isMember,
        loyaltyPoints: int.tryParse(_loyaltyPointsController.text) ?? 0,
      );
      await ref.read(updateCustomerStateProvider.notifier).updateCustomer(updated);
      if (mounted) Toaster.success(context: context, message: 'Updated');
    } catch (e) {
      if (mounted) Toaster.error(context: context, message: 'Update failed');
    }
  }

  Future<void> _handleCreate() async {
    if (!_formKey.currentState!.validate()) return;
    try {
      final c = CustomerModel(
        customerID: 0,
        firstName: _fNameController.text,
        lastName: _lNameController.text,
        phone: _phoneController.text,
        email: _emailController.text,
        address: _addressController.text,
        gender: _selectedGender,
        dob: _selectedDob,
        isMember: _isMember,
        loyaltyPoints: int.tryParse(_loyaltyPointsController.text) ?? 0,
      );
      await ref.read(addCustomerStateProvider.notifier).createCustomer(c);
      if (mounted) {
        Toaster.success(context: context, message: 'Created');
        ref.read(isAddingCustomerProvider.notifier).set(false);
      }
    } catch (e) {
      if (mounted) Toaster.error(context: context, message: 'Creation failed');
    }
  }

  Future<void> _handleDelete(CustomerModel c) async {
     final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Customer'),
        content: Text('Delete "${c.firstName} ${c.lastName}"?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          TextButton(onPressed: () => Navigator.pop(context, true), style: TextButton.styleFrom(foregroundColor: AppColors.error), child: const Text('Delete')),
        ],
      ),
    );

    if (confirm == true && mounted) {
      try {
        await ref.read(deleteCustomerStateProvider.notifier).deleteCustomer(c.customerID);
        if (mounted) {
          ref.read(selectedCustomerForEditProvider.notifier).select(null);
          Toaster.success(context: context, message: 'Deleted');
        }
      } catch (e) {
        if (mounted) Toaster.error(context: context, message: 'Delete failed');
      }
    }
  }
}
