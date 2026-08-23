import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/address_data.dart';
import '../../../pets/domain/entities/pet_model.dart';
import '../../../pets/presentation/pages/pet_edit_page.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  
  // Personal Info
  final _nameController = TextEditingController(text: 'Asim Shrestha');
  final _phoneController = TextEditingController(text: '+977 9859598745');
  final _emailController = TextEditingController(text: 'asim981201@gmail.com');
  final _dobController = TextEditingController(text: 'May 15, 1998');

  // Address Lists
  final List<AddressData> _billingAddresses = [
    AddressData(
      label: 'Home', 
      address: 'Asan, Kathmandu - 27', 
      city: 'Kathmandu', 
      state: 'Bagmati', 
      postalCode: '44600',
      landmark: 'Near Annapurna Mandir',
      deliveryNotes: '',
    ),
  ];

  final List<AddressData> _deliveryAddresses = [
    AddressData(
      label: 'Office', 
      address: 'New Baneshwor', 
      city: 'Kathmandu', 
      state: 'Bagmati', 
      postalCode: '44601',
      landmark: 'Main Road',
      deliveryNotes: 'Call before delivery',
    ),
  ];

  final List<PetModel> _myPets = [
    PetModel(name: 'Daisy', type: 'Dog', age: '2 years 3 months', image: 'assets/images/dashboard_assets/pup.png'),
  ];

  bool _emailNotif = true;
  bool _smsNotif = true;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1998, 5, 15),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: AppColors.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _dobController.text = DateFormat('MMMM dd, yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Edit Profile',
          style: AppTextStyles.h2.copyWith(
            color: AppColors.primary, 
            fontWeight: FontWeight.w900, 
            fontSize: 18,
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16, top: 12, bottom: 12),
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              child: const Text('Save', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              _buildProfilePicSection(),
              AppSizes.gapH32,
              
              _buildSectionHeader(Icons.person_outline_rounded, 'Personal Information'),
              Row(
                children: [
                  Expanded(child: _buildInputField('Full Name', _nameController)),
                  const SizedBox(width: 12),
                  Expanded(child: _buildInputField('Phone Number', _phoneController)),
                ],
              ),
              const SizedBox(height: 12),
              _buildInputField('Email Address', _emailController),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _selectDate(context),
                      child: AbsorbPointer(
                        child: _buildInputField('DOB', _dobController, suffixIcon: Icons.calendar_month_outlined),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(child: _buildDropdownField('Gender', 'Male', ['Male', 'Female', 'Other'], (val) {})),
                ],
              ),
              
              AppSizes.gapH32,
              _buildHeaderWithAction('Billing Address', () {
                setState(() => _billingAddresses.add(AddressData(
                  label: '', 
                  address: '', 
                  city: 'Kathmandu', 
                  state: 'Bagmati', 
                  postalCode: '',
                  landmark: '',
                  deliveryNotes: '',
                  isEditing: true
                )));
              }),
              ..._billingAddresses.map((addr) => _buildAddressItem(addr, () => setState(() => _billingAddresses.remove(addr)))),
              
              AppSizes.gapH32,
              _buildHeaderWithAction('Delivery Address', () {
                setState(() => _deliveryAddresses.add(AddressData(
                  label: '', 
                  address: '', 
                  city: 'Kathmandu', 
                  state: 'Bagmati', 
                  postalCode: '',
                  landmark: '',
                  deliveryNotes: '',
                  isEditing: true
                )));
              }),
              ..._deliveryAddresses.map((addr) => _buildAddressItem(addr, () => setState(() => _deliveryAddresses.remove(addr)))),
              
              AppSizes.gapH32,
              _buildSectionHeader(Icons.pets_outlined, 'My Pets'),
              ..._myPets.map((pet) => _buildPetItem(pet)),
              const SizedBox(height: 12),
              _buildAddAction('Add New Pet', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PetEditPage()),
                );
              }),
              
              AppSizes.gapH32,
              _buildSectionHeader(Icons.mail_outline_rounded, 'Preferences'),
              _buildPreferencesCard(),
              
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfilePicSection() {
    return Center(
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primary.withOpacity(0.2), width: 2),
            ),
            child: const CircleAvatar(
              radius: 50,
              backgroundColor: AppColors.primary,
              foregroundImage: AssetImage('assets/images/profile.jpg'),
              child: Icon(Icons.person, color: Colors.white, size: 50),
            ),
          ),
          Positioned(
            bottom: 2,
            right: 2,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4)],
              ),
              child: const Icon(Icons.camera_alt, color: AppColors.primary, size: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 22),
          const SizedBox(width: 10),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildHeaderWithAction(String title, VoidCallback onAdd) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.location_on_outlined, color: AppColors.primary, size: 22),
              const SizedBox(width: 10),
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ],
          ),
          _buildAddAction('Add New', onAdd),
        ],
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller, {IconData? suffixIcon, bool isDense = true, String? hint, Function(String)? onChanged, double fontSize = 13}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: isDense ? 6 : 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(color: Colors.grey.shade500, fontSize: 9, fontWeight: FontWeight.w500)),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  onChanged: onChanged,
                  maxLines: 1,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: fontSize),
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: TextStyle(color: Colors.grey.shade300, fontWeight: FontWeight.normal, fontSize: fontSize - 1),
                    isDense: true,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 4),
                  ),
                ),
              ),
              if (suffixIcon != null) Icon(suffixIcon, color: Colors.grey.shade600, size: 16),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField(String label, String value, List<String> items, Function(String?) onChanged, {double fontSize = 13}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(color: Colors.grey.shade500, fontSize: 9, fontWeight: FontWeight.w500)),
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              isDense: true,
              isExpanded: true,
              icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey.shade800, size: 18),
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: fontSize, color: Colors.black),
              onChanged: onChanged,
              items: items.map<DropdownMenuItem<String>>((String val) {
                return DropdownMenuItem<String>(
                  value: val,
                  child: Text(
                    val,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressItem(AddressData addr, VoidCallback onDelete) {
    if (addr.isEditing) {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade100),
        ),
        child: Column(
          children: [
            _buildInputField('Label (e.g. Home, Office)', TextEditingController(text: addr.label), onChanged: (v) => addr.label = v, hint: 'Home / Office'),
            const SizedBox(height: 10),
            _buildInputField('Street Address', TextEditingController(text: addr.address), onChanged: (v) => addr.address = v, hint: 'Asan, Kathmandu - 27'),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(child: _buildInputField('City', TextEditingController(text: addr.city), onChanged: (v) => addr.city = v, hint: 'Kathmandu', fontSize: 11)),
                const SizedBox(width: 8),
                Expanded(child: _buildInputField('State / Province', TextEditingController(text: addr.state), onChanged: (v) => addr.state = v, hint: 'Bagmati', fontSize: 11)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(child: _buildInputField('Postal Code', TextEditingController(text: addr.postalCode), onChanged: (v) => addr.postalCode = v, hint: '44600', fontSize: 11)),
                const SizedBox(width: 8),
                Expanded(child: _buildInputField('Landmark', TextEditingController(text: addr.landmark), onChanged: (v) => addr.landmark = v, hint: 'Near Temple', fontSize: 11)),
              ],
            ),
            const SizedBox(height: 10),
            _buildInputField('Delivery Notes', TextEditingController(text: addr.deliveryNotes), onChanged: (v) => addr.deliveryNotes = v, hint: 'Extra instructions...'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: onDelete,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text('Remove', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 11)),
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () {
                    if (addr.label.isEmpty) addr.label = 'Other';
                    setState(() => addr.isEditing = false);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text('Done', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11)),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.location_on_rounded, color: AppColors.primary, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(addr.label.isEmpty ? 'Address' : addr.label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                Text('${addr.address}, ${addr.city}, ${addr.state} ${addr.postalCode}', style: const TextStyle(color: Colors.grey, fontSize: 11), maxLines: 1, overflow: TextOverflow.ellipsis),
                if (addr.landmark.isNotEmpty)
                  Text('Landmark: ${addr.landmark}', style: const TextStyle(color: Colors.grey, fontSize: 10), maxLines: 1, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          IconButton(
            onPressed: () => setState(() => addr.isEditing = true),
            icon: const Icon(Icons.edit_outlined, color: AppColors.primary, size: 20),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          const SizedBox(width: 12),
          IconButton(
            onPressed: onDelete,
            icon: const Icon(Icons.delete_outline_rounded, color: Colors.redAccent, size: 20),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }

  Widget _buildPetItem(PetModel pet) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ClipRRect(borderRadius: BorderRadius.circular(12), child: Image.asset(pet.image, height: 45, width: 45, fit: BoxFit.cover)),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(pet.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)), Text('${pet.type} • ${pet.age}', style: const TextStyle(color: Colors.grey, fontSize: 11))])),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PetEditPage(
                    petName: pet.name,
                    petType: pet.type,
                    petAge: pet.age,
                    petImage: pet.image,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.edit_outlined, color: AppColors.primary, size: 20),
          ),
          IconButton(onPressed: () => setState(() => _myPets.remove(pet)), icon: const Icon(Icons.delete_outline_rounded, color: Colors.redAccent, size: 20)),
        ],
      ),
    );
  }

  Widget _buildAddAction(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          const Icon(Icons.add_circle_outline_rounded, color: AppColors.primary, size: 20),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildPreferencesCard() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _buildPreferenceTile('Email Notifications', 'Receive updates about orders, offers and more', _emailNotif, (v) => setState(() => _emailNotif = v)),
          const Divider(height: 1, thickness: 0.5, indent: 16, endIndent: 16, color: Colors.white),
          _buildPreferenceTile('SMS Notifications', 'Receive order updates and important alerts', _smsNotif, (v) => setState(() => _smsNotif = v)),
        ],
      ),
    );
  }

  Widget _buildPreferenceTile(String title, String subtitle, bool value, Function(bool) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)), const SizedBox(height: 2), Text(subtitle, style: TextStyle(color: Colors.grey.shade500, fontSize: 10))])),
          Switch.adaptive(value: value, onChanged: onChanged, activeColor: AppColors.primary),
        ],
      ),
    );
  }
}
