import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';

class ProductSizeSelector extends StatefulWidget {
  final List<String> sizes;
  final Function(String) onSizeSelected;

  const ProductSizeSelector({
    super.key,
    required this.sizes,
    required this.onSizeSelected,
  });

  @override
  State<ProductSizeSelector> createState() => _ProductSizeSelectorState();
}

class _ProductSizeSelectorState extends State<ProductSizeSelector> {
  String selectedSize = '';

  @override
  void initState() {
    super.initState();
    if (widget.sizes.isNotEmpty) {
      selectedSize = widget.sizes.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select Size', style: AppTextStyles.h3),
        AppSizes.gapH12,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: widget.sizes.map((size) {
              final isSelected = selectedSize == size;
              return GestureDetector(
                onTap: () {
                  setState(() => selectedSize = size);
                  widget.onSizeSelected(size);
                },
                child: Container(
                  margin: const EdgeInsets.only(right: AppSizes.s12),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primaryLighter : AppColors.white,
                    border: Border.all(
                      color: isSelected ? AppColors.primary : AppColors.textPlaceholder,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    size,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: isSelected ? AppColors.primary : AppColors.textPrimary,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
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
}
