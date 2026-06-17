import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/utils/toaster.dart';
import 'package:nextrestro/features/tables/data/models/table_model.dart';
import 'package:nextrestro/features/customer/data/models/customer_model.dart';
import 'package:nextrestro/features/customer/presentation/providers/customer_provider.dart';
import 'package:nextrestro/features/reservation/data/models/reservation_model.dart';
import 'package:nextrestro/features/reservation/presentation/providers/reservation_provider.dart';
import 'package:nextrestro/core/network/session_service.dart';

class ReservationDialog extends ConsumerStatefulWidget {
  final TableModel table;

  const ReservationDialog({super.key, required this.table});

  @override
  ConsumerState<ReservationDialog> createState() => _ReservationDialogState();
}

class _ReservationDialogState extends ConsumerState<ReservationDialog> {
  final _formKey = GlobalKey<FormState>();
  final _customerFormKey = GlobalKey<FormState>();
  
  late DateTime _selectedDate;
  late TimeOfDay _selectedTime;
  late TextEditingController _personsController;
  late TextEditingController _specialRequestController;
  
  // New Customer Controllers
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _selectedTime = TimeOfDay.now();
    _personsController = TextEditingController(text: widget.table.capacity.toString());
    _specialRequestController = TextEditingController();
  }

  @override
  void dispose() {
    _personsController.dispose();
    _specialRequestController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null) {
      setState(() => _selectedTime = picked);
    }
  }

  void _saveNewCustomer() async {
    if (_customerFormKey.currentState!.validate()) {
      final newCustomer = CustomerModel(
        customerID: 0,
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        address: _addressController.text,
        loyaltyPoints: 0,
        isMember: false,
        gender: 'N/A',
        dob: DateTime.now(),
      );
      
      await ref.read(createCustomerStateProvider.notifier).createAndSelect(newCustomer);
      
      final state = ref.read(createCustomerStateProvider);
      if (state.hasError) {
        if (mounted) {
          Toaster.error(context: context, message: 'Failed to create customer: ${state.error}', isLandscape: true);
        }
      } else {
        if (mounted) {
           Toaster.success(context: context, message: 'Customer created and selected', isLandscape: true);
        }
      }
    }
  }

  void _confirmReservation() async {
    if (_formKey.currentState!.validate()) {
      final selectedCustomer = ref.read(selectedCustomerProvider);
      if (selectedCustomer == null) {
        Toaster.warning(context: context, message: 'Please select a customer', isLandscape: true);
        return;
      }

      final reservationDateTime = DateTime(
        _selectedDate.year,
        _selectedDate.month,
        _selectedDate.day,
        _selectedTime.hour,
        _selectedTime.minute,
      );

      final sessionService = ref.read(sessionServiceProvider);
      final userId = sessionService.getUser()?['userId'] ?? 0;

      final request = ReservationRequest(
        customerID: selectedCustomer.customerID,
        reservationDate: reservationDateTime,
        specialRequest: _specialRequestController.text,
        advanceAmount: 0.0,
        createdBy: userId,
        reservationDetails: [
          ReservationDetail(
            tableID: widget.table.tableID,
            noOfPersons: int.parse(_personsController.text),
            reservationStatus: 1, // 1 for Confirmed/Pending?
            remarks: 'Direct Reservation',
          ),
        ],
      );

      // Show confirmation dialog
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Confirm Reservation'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Table: ${widget.table.tableNumber}'),
              Text('Customer: ${selectedCustomer.firstName} ${selectedCustomer.lastName}'),
              Text('Date: ${DateFormat('yyyy-MM-dd').format(_selectedDate)}'),
              Text('Time: ${_selectedTime.format(context)}'),
              Text('Persons: ${_personsController.text}'),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
              child: const Text('Confirm', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      );

      if (confirmed == true) {
        // Show loading toast or indicator if needed, but here we wait for API
        await ref.read(reservationStateProvider.notifier).createReservation(request);
        
        // Use the context from the widget to ensure we pop the right dialog
        if (mounted) {
          final state = ref.read(reservationStateProvider);
          if (state.hasError) {
            Toaster.error(
              context: context, 
              message: 'Reservation failed: ${state.error}', 
              isLandscape: true,
            );
          } else {
            Toaster.success(
              context: context, 
              message: 'Reservation successful!', 
              isLandscape: true,
            );
            // This pops the ReservationDialog
            Navigator.of(context).pop();
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final customersAsync = ref.watch(customersProvider);
    final isNewCustomer = ref.watch(isNewCustomerProvider);
    final selectedCustomer = ref.watch(selectedCustomerProvider);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 600,
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Set Reservation - Table ${widget.table.tableNumber}',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close)),
                  ],
                ),
                const Divider(),
                const SizedBox(height: 16),
                
                // Table Details
                Row(
                  children: [
                    _InfoChip(label: 'Capacity: ${widget.table.capacity}', icon: Icons.people),
                    const SizedBox(width: 12),
                    _InfoChip(label: 'Floor: ${widget.table.floorName}', icon: Icons.layers),
                  ],
                ),
                const SizedBox(height: 24),

                // Date and Time Pickers
                Row(
                  children: [
                    Expanded(
                      child: _PickerField(
                        label: 'Reservation Date',
                        value: DateFormat('yyyy-MM-dd').format(_selectedDate),
                        icon: Icons.calendar_today,
                        onTap: _pickDate,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _PickerField(
                        label: 'Reservation Time',
                        value: _selectedTime.format(context),
                        icon: Icons.access_time,
                        onTap: _pickTime,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Persons Expected
                TextFormField(
                  controller: _personsController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Number of Persons Expected',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.group),
                  ),
                  validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 24),

                // Customer Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Customer Details', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    TextButton.icon(
                      onPressed: () => ref.read(isNewCustomerProvider.notifier).toggle(),
                      icon: Icon(isNewCustomer ? Icons.search : Icons.add),
                      label: Text(isNewCustomer ? 'Select Existing' : 'New Customer'),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Animated Customer Switcher
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, 0.1),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      ),
                    );
                  },
                  child: isNewCustomer 
                    ? _buildNewCustomerForm() 
                    : _buildCustomerDropdown(customersAsync, selectedCustomer),
                ),

                const SizedBox(height: 16),
                TextFormField(
                  controller: _specialRequestController,
                  maxLines: 2,
                  decoration: const InputDecoration(
                    labelText: 'Special Request',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 32),

                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: _confirmReservation,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text('Confirm Reservation', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomerDropdown(AsyncValue<List<CustomerModel>> customersAsync, CustomerModel? selected) {
    return customersAsync.when(
      data: (customers) => DropdownSearch<CustomerModel>(
        items: (filter, props) => customers.where((c) => 
          c.firstName.toLowerCase().contains(filter.toLowerCase()) || 
          c.lastName.toLowerCase().contains(filter.toLowerCase()) ||
          c.phone.contains(filter)
        ).toList(),
        itemAsString: (item) => '${item.firstName} ${item.lastName}',
        selectedItem: selected,
        onSelected: (val) => ref.read(selectedCustomerProvider.notifier).select(val),
        compareFn: (item1, item2) => item1.customerID == item2.customerID,
        decoratorProps: const DropDownDecoratorProps(
          decoration: InputDecoration(
            hintText: 'Select Customer',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.person),
          ),
        ),
        popupProps: PopupProps.menu(
          showSearchBox: true,
          searchFieldProps: const TextFieldProps(
            decoration: InputDecoration(
              hintText: 'Search by name or phone...',
              prefixIcon: Icon(Icons.search),
            ),
          ),
          itemBuilder: (context, item, isSelected, isHighlighted) => ListTile(
            title: Text('${item.firstName} ${item.lastName}'),
            subtitle: Text(item.phone),
            trailing: isSelected ? const Icon(Icons.check, color: AppColors.primary) : null,
          ),
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Text('Error loading customers: $err'),
    );
  }

  Widget _buildNewCustomerForm() {
    return Form(
      key: _customerFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _firstNameController,
                  decoration: const InputDecoration(labelText: 'First Name', border: OutlineInputBorder()),
                  validator: (val) => val!.isEmpty ? 'Required' : null,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(labelText: 'Last Name', border: OutlineInputBorder()),
                  validator: (val) => val!.isEmpty ? 'Required' : null,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _phoneController,
            decoration: const InputDecoration(labelText: 'Phone', border: OutlineInputBorder()),
            validator: (val) => val!.isEmpty ? 'Required' : null,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _addressController,
            decoration: const InputDecoration(labelText: 'Address', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: _saveNewCustomer,
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.primary,
                side: const BorderSide(color: AppColors.primary),
              ),
              child: const Text('Save & Select the Customer'),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final String label;
  final IconData icon;

  const _InfoChip({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: AppColors.primary),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 13)),
        ],
      ),
    );
  }
}

class _PickerField extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final VoidCallback onTap;

  const _PickerField({
    required this.label,
    required this.value,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          prefixIcon: Icon(icon),
        ),
        child: Text(value),
      ),
    );
  }
}
