import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import 'package:intl/intl.dart';

class PetEditPage extends StatefulWidget {
  final String? petName;
  final String? petType;
  final String? petAge;
  final String? petImage;

  const PetEditPage({
    super.key,
    this.petName,
    this.petType,
    this.petAge,
    this.petImage,
  });

  @override
  State<PetEditPage> createState() => _PetEditPageState();
}

class _PetEditPageState extends State<PetEditPage> {
  final _formKey = GlobalKey<FormState>();
  
  late TextEditingController _nameController;
  late TextEditingController _breedController;
  late TextEditingController _ageController;
  late TextEditingController _weightController;
  
  String _selectedType = 'Dog';
  String _selectedGender = 'Male';

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.petName ?? '');
    _breedController = TextEditingController(text: widget.petName != null ? 'Golden Retriever' : '');
    _ageController = TextEditingController(text: widget.petAge ?? '');
    _weightController = TextEditingController(text: widget.petName != null ? '12 kg' : '');
    _selectedType = widget.petType ?? 'Dog';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _breedController.dispose();
    _ageController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
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
        _ageController.text = DateFormat('MMMM dd, yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.petName != null;

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
          isEditing ? 'Edit Pet' : 'Add New Pet',
          style: AppTextStyles.h2.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w900,
            fontSize: 22,
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
              _buildPetPhotoSection(),
              AppSizes.gapH32,
              
              _buildSectionHeader(Icons.pets_outlined, 'Pet Information'),
              _buildInputField('Pet Name', _nameController, hint: 'e.g. Daisy'),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildDropdownField('Pet Type', _selectedType, ['Dog', 'Cat', 'Bird', 'Rabbit'], (val) => setState(() => _selectedType = val!))),
                  const SizedBox(width: 12),
                  Expanded(child: _buildInputField('Breed', _breedController, hint: 'e.g. Golden Retriever')),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildDropdownField('Gender', _selectedGender, ['Male', 'Female'], (val) => setState(() => _selectedGender = val!))),
                  const SizedBox(width: 12),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _selectDate(context),
                      child: AbsorbPointer(
                        child: _buildInputField('Birth Date / Age', _ageController, suffixIcon: Icons.calendar_month_outlined),
                      ),
                    ),
                  ),
                ],
              ),
              
              AppSizes.gapH32,
              _buildSectionHeader(Icons.health_and_safety_outlined, 'Health Details'),
              Row(
                children: [
                  Expanded(child: _buildInputField('Weight', _weightController, hint: 'e.g. 15 kg')),
                  const SizedBox(width: 12),
                  const Spacer(), // Placeholder for future health fields
                ],
              ),
              
              AppSizes.gapH32,
              _buildSectionHeader(Icons.info_outline_rounded, 'About Your Pet'),
              _buildLargeInputField('Tell us something about your pet...', TextEditingController(), hint: 'Likes, dislikes, allergies etc.'),
              
              const SizedBox(height: 40),
              if (isEditing)
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: const BorderSide(color: Colors.redAccent, width: 1),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    icon: const Icon(Icons.delete_outline_rounded, color: Colors.redAccent),
                    label: const Text('Remove Pet Information', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
                  ),
                ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPetPhotoSection() {
    return Center(
      child: Stack(
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              color: const Color(0xFFF2EEFF),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: AppColors.primary.withOpacity(0.1), width: 2),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: widget.petImage != null 
                ? Image.asset(widget.petImage!, fit: BoxFit.cover)
                : const Icon(Icons.pets, color: AppColors.primary, size: 50),
            ),
          ),
          Positioned(
            bottom: -5,
            right: -5,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                ),
                child: const Icon(Icons.camera_alt_rounded, color: Colors.white, size: 18),
              ),
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
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller, {IconData? suffixIcon, String? hint}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                  maxLines: 1,
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: TextStyle(color: Colors.grey.shade300, fontWeight: FontWeight.normal, fontSize: 12),
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

  Widget _buildLargeInputField(String label, TextEditingController controller, {String? hint}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(color: Colors.grey.shade500, fontSize: 10, fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            maxLines: 4,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey.shade300, fontWeight: FontWeight.normal, fontSize: 12),
              isDense: true,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField(String label, String value, List<String> items, Function(String?) onChanged) {
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
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: Colors.black),
              onChanged: onChanged,
              items: items.map<DropdownMenuItem<String>>((String val) {
                return DropdownMenuItem<String>(
                  value: val,
                  child: Text(val, maxLines: 1, overflow: TextOverflow.ellipsis),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
