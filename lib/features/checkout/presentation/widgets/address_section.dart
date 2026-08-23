import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';

class AddressItem {
  final TextEditingController titleController;
  final TextEditingController addressController;
  final TextEditingController cityController;
  final TextEditingController stateController;
  final TextEditingController postalCodeController;
  final TextEditingController landmarkController;
  final TextEditingController deliveryNotesController;
  bool isEditing;

  AddressItem({
    required String title,
    required String address,
    String city = '',
    String state = '',
    String postalCode = '',
    String landmark = '',
    String deliveryNotes = '',
    this.isEditing = false,
  }) : titleController = TextEditingController(text: title),
       addressController = TextEditingController(text: address),
       cityController = TextEditingController(text: city),
       stateController = TextEditingController(text: state),
       postalCodeController = TextEditingController(text: postalCode),
       landmarkController = TextEditingController(text: landmark),
       deliveryNotesController = TextEditingController(text: deliveryNotes);

  void dispose() {
    titleController.dispose();
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    postalCodeController.dispose();
    landmarkController.dispose();
    deliveryNotesController.dispose();
  }
}

class AddressSection extends StatefulWidget {
  final String title;
  final IconData icon;
  final Function(AddressItem) onAddressSelected;

  const AddressSection({
    super.key,
    required this.title,
    required this.icon,
    required this.onAddressSelected,
  });

  @override
  State<AddressSection> createState() => _AddressSectionState();
}

class _AddressSectionState extends State<AddressSection> {
  int _selectedAddressIndex = 0;
  
  // State for contact editing
  bool _isEditingContact = false;
  late TextEditingController _nameController;
  late TextEditingController _phoneController;

  // Dynamic list of addresses
  final List<AddressItem> _addresses = [];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: 'Asim Shrestha');
    _phoneController = TextEditingController(text: '+977 9818327838');
    
    // Initialize default addresses
    _addresses.add(AddressItem(
      title: 'Home', 
      address: 'Asan, Kathmandu-27',
      city: 'Kathmandu',
      state: 'Bagmati',
      postalCode: '44600',
      landmark: 'Near Annapurna Mandir'
    ));
    _addresses.add(AddressItem(
      title: 'Office', 
      address: 'New Baneshwor',
      city: 'Kathmandu',
      state: 'Bagmati',
      postalCode: '44601'
    ));

    // Report initial selection
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_addresses.isNotEmpty) {
        widget.onAddressSelected(_addresses[_selectedAddressIndex]);
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    for (var item in _addresses) {
      item.dispose();
    }
    super.dispose();
  }

  void _addNewAddress() {
    setState(() {
      final newItem = AddressItem(
        title: 'New Label', 
        address: 'Enter address details here...',
        isEditing: true, // Immediately editable
      );
      _addresses.add(newItem);
      _selectedAddressIndex = _addresses.length - 1; // Select the new one
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(widget.icon, color: AppColors.primary, size: 20),
              AppSizes.gapW8,
              Text(
                widget.title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.primary),
              ),
            ],
          ),
          AppSizes.gapH16,
          
          // User Contact Info
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F8FA),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade100),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                ),
                AppSizes.gapW12,
                Expanded(
                  child: _isEditingContact 
                    ? Column(
                        children: [
                          _buildSmallTextField(_nameController, 'Name'),
                          const SizedBox(height: 8),
                          _buildSmallTextField(_phoneController, 'Phone'),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_nameController.text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              const Icon(Icons.phone, size: 12, color: AppColors.primary),
                              const SizedBox(width: 4),
                              Text(_phoneController.text, style: const TextStyle(color: Colors.grey, fontSize: 11)),
                            ],
                          ),
                        ],
                      ),
                ),
                TextButton(
                  onPressed: () => setState(() => _isEditingContact = !_isEditingContact),
                  style: TextButton.styleFrom(minimumSize: Size.zero, padding: EdgeInsets.zero),
                  child: Row(
                    children: [
                      Icon(_isEditingContact ? Icons.check : Icons.edit, size: 14, color: AppColors.primary),
                      const SizedBox(width: 4),
                      Text(
                        _isEditingContact ? 'Save' : 'Edit', 
                        style: const TextStyle(color: AppColors.primary, fontSize: 11, fontWeight: FontWeight.bold)
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          AppSizes.gapH12,
          
          // Dynamic Addresses List
          ...List.generate(_addresses.length, (index) {
            final item = _addresses[index];
            return _buildAddressTile(
              index: index,
              item: item,
              isEditing: item.isEditing,
              onEditToggle: () => setState(() => item.isEditing = !item.isEditing),
            );
          }),
          
          AppSizes.gapH12,
          
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _addNewAddress,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text('Add new address', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallTextField(TextEditingController controller, String hint) {
    return SizedBox(
      height: 35,
      child: TextField(
        controller: controller,
        style: const TextStyle(fontSize: 12),
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          isDense: true,
        ),
      ),
    );
  }

  Widget _buildAddressTile({
    required int index, 
    required AddressItem item,
    required bool isEditing,
    required VoidCallback onEditToggle,
  }) {
    final isSelected = _selectedAddressIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() => _selectedAddressIndex = index);
        widget.onAddressSelected(_addresses[index]);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF7F8FA) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? AppColors.primary.withOpacity(0.1) : Colors.grey.shade100),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Icon(
                isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
                color: AppColors.primary,
                size: 18,
              ),
            ),
            AppSizes.gapW12,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  isEditing 
                    ? _buildSmallTextField(item.titleController, 'Label (e.g. Home)')
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(item.titleController.text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                          _buildEditButton(index, isEditing, onEditToggle),
                        ],
                      ),
                  const SizedBox(height: 8),
                  isEditing 
                    ? Column(
                        children: [
                          _buildSmallTextField(item.addressController, 'Street Address'),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(child: _buildSmallTextField(item.cityController, 'City')),
                              const SizedBox(width: 8),
                              Expanded(child: _buildSmallTextField(item.stateController, 'State')),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(child: _buildSmallTextField(item.postalCodeController, 'Postal Code')),
                              const SizedBox(width: 8),
                              Expanded(child: _buildSmallTextField(item.landmarkController, 'Landmark')),
                            ],
                          ),
                          const SizedBox(height: 8),
                          _buildSmallTextField(item.deliveryNotesController, 'Delivery Notes (Optional)'),
                          const SizedBox(height: 8),
                          Align(
                            alignment: Alignment.centerRight,
                            child: _buildEditButton(index, isEditing, onEditToggle),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${item.addressController.text}, ${item.cityController.text}',
                            style: TextStyle(color: Colors.grey.shade600, fontSize: 11, height: 1.4),
                          ),
                          Text(
                            '${item.stateController.text} ${item.postalCodeController.text}',
                            style: TextStyle(color: Colors.grey.shade600, fontSize: 11, height: 1.4),
                          ),
                          if (item.landmarkController.text.isNotEmpty)
                            Text(
                              'Landmark: ${item.landmarkController.text}',
                              style: TextStyle(color: Colors.grey.shade600, fontSize: 11, height: 1.4),
                            ),
                        ],
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditButton(int index, bool isEditing, VoidCallback onEditToggle) {
    return TextButton(
      onPressed: () {
        onEditToggle();
        // If we just finished editing, report the update
        if (isEditing) {
          widget.onAddressSelected(_addresses[index]);
        }
      },
      style: TextButton.styleFrom(minimumSize: Size.zero, padding: EdgeInsets.zero),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(isEditing ? Icons.check : Icons.edit, size: 14, color: AppColors.primary),
          const SizedBox(width: 4),
          Text(
            isEditing ? 'Save' : 'Edit', 
            style: const TextStyle(color: AppColors.primary, fontSize: 11, fontWeight: FontWeight.bold)
          ),
        ],
      ),
    );
  }
}
