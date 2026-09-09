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
  // --- TEMPORARY FORM IMPLEMENTATION ---
  late AddressItem _formAddress;
  late TextEditingController _nameController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: 'Asim Shrestha');
    _phoneController = TextEditingController(text: '+977 9818327838');
    
    _formAddress = AddressItem(
      title: 'Delivery',
      address: '',
      city: '',
      state: '',
      postalCode: '',
      landmark: '',
      deliveryNotes: ''
    );

    // Listen to changes and report back
    _formAddress.addressController.addListener(_notifyParent);
    _formAddress.cityController.addListener(_notifyParent);
    _formAddress.stateController.addListener(_notifyParent);
    _formAddress.postalCodeController.addListener(_notifyParent);
    _formAddress.landmarkController.addListener(_notifyParent);
    _formAddress.deliveryNotesController.addListener(_notifyParent);

    // Initial notification to parent
    WidgetsBinding.instance.addPostFrameCallback((_) => _notifyParent());
  }

  void _notifyParent() {
    widget.onAddressSelected(_formAddress);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _formAddress.dispose();
    super.dispose();
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
          
          _buildFieldLabel('Full Name'),
          _buildSmallTextField(_nameController, 'Enter your name'),
          AppSizes.gapH12,
          
          _buildFieldLabel('Phone Number'),
          _buildSmallTextField(_phoneController, 'Enter phone number', keyboardType: TextInputType.phone),
          AppSizes.gapH12,

          _buildFieldLabel('Street Address'),
          _buildSmallTextField(_formAddress.addressController, 'e.g. Asan, Kathmandu-27'),
          AppSizes.gapH12,

          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFieldLabel('City'),
                    _buildSmallTextField(_formAddress.cityController, 'e.g. Kathmandu'),
                  ],
                ),
              ),
              AppSizes.gapW12,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFieldLabel('State/Province'),
                    _buildSmallTextField(_formAddress.stateController, 'e.g. Bagmati'),
                  ],
                ),
              ),
            ],
          ),
          AppSizes.gapH12,

          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFieldLabel('Postal Code'),
                    _buildSmallTextField(_formAddress.postalCodeController, 'e.g. 44600', keyboardType: TextInputType.number),
                  ],
                ),
              ),
              AppSizes.gapW12,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFieldLabel('Landmark'),
                    _buildSmallTextField(_formAddress.landmarkController, 'e.g. Near Annapurna Mandir'),
                  ],
                ),
              ),
            ],
          ),
          AppSizes.gapH12,

          _buildFieldLabel('Delivery Notes (Optional)'),
          _buildSmallTextField(_formAddress.deliveryNotesController, 'e.g. Leave at the front gate'),
        ],
      ),
    );
  }

  Widget _buildFieldLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6, left: 2),
      child: Text(
        label,
        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.black87),
      ),
    );
  }

  Widget _buildSmallTextField(TextEditingController controller, String hint, {TextInputType? keyboardType}) {
    return TextField(
      controller: controller,
      style: const TextStyle(fontSize: 13),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 12),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        filled: true,
        fillColor: const Color(0xFFF7F8FA),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade100),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade100),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.primary, width: 1),
        ),
        isDense: true,
      ),
    );
  }

  /* --- ORIGINAL ADDRESS SELECTION UI (COMMENTED OUT TEMPORARILY) ---
  int _selectedAddressIndex = 0;
  bool _isEditingContact = false;
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  final List<AddressItem> _addresses = [];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: 'Asim Shrestha');
    _phoneController = TextEditingController(text: '+977 9818327838');
    
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
        isEditing: true,
      );
      _addresses.add(newItem);
      _selectedAddressIndex = _addresses.length - 1;
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
  */
}
