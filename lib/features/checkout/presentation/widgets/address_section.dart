import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';

class AddressItem {
  final TextEditingController titleController;
  final TextEditingController addressController;
  bool isEditing;

  AddressItem({
    required String title,
    required String address,
    this.isEditing = false,
  }) : titleController = TextEditingController(text: title),
       addressController = TextEditingController(text: address);

  void dispose() {
    titleController.dispose();
    addressController.dispose();
  }
}

class AddressSection extends StatefulWidget {
  final String title;
  final IconData icon;

  const AddressSection({
    super.key,
    required this.title,
    required this.icon,
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
      address: 'Asan, Kathmandu-27\nKathmandu, Bagmati Province\nNepal'
    ));
    _addresses.add(AddressItem(
      title: 'Office', 
      address: 'New Baneshwor, Kathmandu'
    ));
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
              titleController: item.titleController,
              addressController: item.addressController,
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
    required TextEditingController titleController, 
    required TextEditingController addressController,
    required bool isEditing,
    required VoidCallback onEditToggle,
  }) {
    final isSelected = _selectedAddressIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedAddressIndex = index),
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
                    ? TextField(
                        controller: titleController,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 4),
                          border: InputBorder.none,
                          hintText: 'Label (e.g. Home)',
                        ),
                      )
                    : Text(titleController.text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                  const SizedBox(height: 4),
                  isEditing 
                    ? TextField(
                        controller: addressController,
                        maxLines: null,
                        style: const TextStyle(fontSize: 11),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 4),
                          isDense: true,
                          border: InputBorder.none,
                          hintText: 'Enter new address...',
                        ),
                      )
                    : Text(
                        addressController.text,
                        style: TextStyle(color: Colors.grey.shade600, fontSize: 11, height: 1.4),
                      ),
                ],
              ),
            ),
            TextButton(
              onPressed: onEditToggle,
              style: TextButton.styleFrom(minimumSize: Size.zero, padding: EdgeInsets.zero),
              child: Row(
                children: [
                  Icon(isEditing ? Icons.check : Icons.edit, size: 14, color: AppColors.primary),
                  const SizedBox(width: 4),
                  Text(
                    isEditing ? 'Save' : 'Edit', 
                    style: const TextStyle(color: AppColors.primary, fontSize: 11, fontWeight: FontWeight.bold)
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
