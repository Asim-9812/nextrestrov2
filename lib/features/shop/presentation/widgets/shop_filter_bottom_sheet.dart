import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';

class ShopFilterBottomSheet extends StatefulWidget {
  const ShopFilterBottomSheet({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const ShopFilterBottomSheet(),
    );
  }

  @override
  State<ShopFilterBottomSheet> createState() => _ShopFilterBottomSheetState();
}

class _ShopFilterBottomSheetState extends State<ShopFilterBottomSheet> {
  String _selectedSort = 'Popularity';
  RangeValues _priceRange = const RangeValues(0, 10000);
  String _selectedPetType = 'All';
  String _selectedBreed = 'All';
  String _selectedProductType = 'All';
  String _selectedLifeStage = 'All';
  String _selectedDiet = 'All';
  String _selectedRating = 'All';
  bool _availability = true;
  bool _discount = true;

  Set<String> _selectedBrands = {'Royal Cain', 'Pedigree'};

  void _clearAll() {
    setState(() {
      _selectedSort = 'Popularity';
      _priceRange = const RangeValues(0, 10000);
      _selectedPetType = 'All';
      _selectedBreed = 'All';
      _selectedProductType = 'All';
      _selectedLifeStage = 'All';
      _selectedDiet = 'All';
      _selectedRating = 'All';
      _availability = true;
      _discount = true;
      _selectedBrands = {};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          _buildHeader(),
          const Divider(height: 1),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSortBy(),
                  AppSizes.gapH24,
                  _buildPriceRange(),
                  AppSizes.gapH24,
                  _buildPetType(),
                  AppSizes.gapH24,
                  _buildBreedType(),
                  AppSizes.gapH24,
                  _buildProductType(),
                  AppSizes.gapH24,
                  _buildBrands(),
                  AppSizes.gapH24,
                  _buildLifeStage(),
                  AppSizes.gapH24,
                  _buildDietPreferences(),
                  AppSizes.gapH24,
                  _buildRatings(),
                  AppSizes.gapH24,
                  _buildToggles(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          const Row(
            children: [
              Icon(Icons.tune, color: Colors.black, size: 20),
              SizedBox(width: 8),
              Text('Filters', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ],
          ),
          TextButton(
            onPressed: _clearAll,
            child: const Text('Clear all', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildSortBy() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Sort by', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: _selectedSort,
            icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.primary),
            style: const TextStyle(color: AppColors.primary, fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'Baloo2'),
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() => _selectedSort = newValue);
              }
            },
            items: <String>['Popularity', 'Price: Low to High', 'Price: High to Low', 'Newest Arrivals', 'Rating']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildPriceRange() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Price Range', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Rs. ${_priceRange.start.toInt()}', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
            Text('Rs. ${_priceRange.end.toInt()}${_priceRange.end == 10000 ? "+" : ""}', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
          ],
        ),
        RangeSlider(
          values: _priceRange,
          min: 0,
          max: 10000,
          activeColor: AppColors.primary,
          inactiveColor: AppColors.primary.withOpacity(0.1),
          onChanged: (values) => setState(() => _priceRange = values),
        ),
      ],
    );
  }

  Widget _buildPetType() {
    return _buildSelectionSection(
      'Pet Type',
      ['All', '🐶 Dog', '🐱 Cat'],
      _selectedPetType,
      (val) => setState(() => _selectedPetType = val),
    );
  }

  Widget _buildBreedType() {
    return _buildSelectionSection(
      'Breed Type',
      ['All', 'Golden Retriever', 'Labrador', 'Japanese Spitz'],
      _selectedBreed,
      (val) => setState(() => _selectedBreed = val),
      isScrollable: true,
    );
  }

  Widget _buildProductType() {
    return _buildSelectionSection(
      'Product Type',
      ['All', 'Food', 'Treats', 'Toys', 'Grooming', 'Health', 'Accessories', 'Furniture'],
      _selectedProductType,
      (val) => setState(() => _selectedProductType = val),
    );
  }

  Widget _buildBrands() {
    final List<String> brands = ['Royal Cain', 'Pedigree', 'Vet\'s Best', 'Hills', 'Purina', 'Drools'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Brands', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        const SizedBox(height: 16),
        Container(
          height: 45,
          decoration: BoxDecoration(
            color: const Color(0xFFF7F8FA),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const TextField(
            decoration: InputDecoration(
              hintText: 'Search for brands...',
              hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
              prefixIcon: Icon(Icons.search, size: 20),
              border: InputBorder.none,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 12,
          children: brands.map((brand) {
            final isSelected = _selectedBrands.contains(brand);
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (isSelected) {
                    _selectedBrands.remove(brand);
                  } else {
                    _selectedBrands.add(brand);
                  }
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: isSelected ? AppColors.primary : Colors.grey.shade300),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.primary : Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: isSelected ? AppColors.primary : Colors.grey.shade400),
                      ),
                      child: isSelected ? const Icon(Icons.check, color: Colors.white, size: 12) : null,
                    ),
                    const SizedBox(width: 8),
                    Text(brand, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 12),
        InkWell(
          onTap: () {},
          child: Row(
            children: const [
              Text('See more', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 12)),
              Icon(Icons.keyboard_arrow_down, color: AppColors.primary, size: 18),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLifeStage() {
    return _buildSelectionSection(
      'Life Stage',
      ['All', 'Puppy', 'Adult', 'Senior'],
      _selectedLifeStage,
      (val) => setState(() => _selectedLifeStage = val),
    );
  }

  Widget _buildDietPreferences() {
    return _buildSelectionSection(
      'Diet Preferences',
      ['All', 'Grain Free', 'High Protein', 'Natural', 'Vegetarian', 'Sensitive Stomach'],
      _selectedDiet,
      (val) => setState(() => _selectedDiet = val),
    );
  }

  Widget _buildRatings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Ratings', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: ['All', '4', '3', '2'].map((rate) {
              final isSelected = _selectedRating == rate;
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: GestureDetector(
                  onTap: () => setState(() => _selectedRating = rate),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primary : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: isSelected ? AppColors.primary : Colors.grey.shade300),
                    ),
                    child: Row(
                      children: [
                        Text(
                          rate == 'All' ? 'All' : rate,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        if (rate != 'All') ...[
                          const SizedBox(width: 4),
                          Icon(Icons.star, color: isSelected ? Colors.white : Colors.orange, size: 14),
                          const SizedBox(width: 4),
                          Text(
                            '& above',
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildToggles() {
    return Column(
      children: [
        _buildToggleRow('Availability', _availability, (v) => setState(() => _availability = v)),
        const SizedBox(height: 16),
        _buildToggleRow('Discount', _discount, (v) => setState(() => _discount = v), subtitle: 'On sale only'),
      ],
    );
  }

  Widget _buildToggleRow(String title, bool value, ValueChanged<bool> onChanged, {String? subtitle}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            if (subtitle != null) Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 10)),
          ],
        ),
        Switch.adaptive(
          value: value,
          onChanged: onChanged,
          activeColor: AppColors.primary,
        ),
      ],
    );
  }

  Widget _buildSelectionSection(String title, List<String> options, String selectedValue, ValueChanged<String> onSelected, {bool isScrollable = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        const SizedBox(height: 16),
        isScrollable
            ? SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: options.map((opt) => _buildSelectionItem(opt, selectedValue, onSelected)).toList()),
              )
            : Wrap(
                spacing: 12,
                runSpacing: 12,
                children: options.map((opt) => _buildSelectionItem(opt, selectedValue, onSelected)).toList(),
              ),
      ],
    );
  }

  Widget _buildSelectionItem(String label, String selectedValue, ValueChanged<String> onSelected) {
    final isSelected = selectedValue == label;
    return GestureDetector(
      onTap: () => onSelected(label),
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: isSelected ? AppColors.primary : Colors.grey.shade300),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5)),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: OutlinedButton.icon(
              onPressed: _clearAll,
              icon: const Icon(Icons.history, size: 18),
              label: const Text('Reset', style: TextStyle(fontWeight: FontWeight.bold)),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                side: BorderSide(color: Colors.grey.shade300),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 3,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 0,
              ),
              child: const Text('Apply Filters', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}
