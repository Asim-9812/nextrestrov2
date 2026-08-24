import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';

class ProductDescription extends StatefulWidget {
  final String description;

  const ProductDescription({super.key, required this.description});

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  bool isDescriptionExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Product Description', style: AppTextStyles.h3),
        AppSizes.gapH8,
        Container(
          constraints: isDescriptionExpanded ? null : const BoxConstraints(maxHeight: 100),
          child: HtmlWidget(
            widget.description,
            textStyle: AppTextStyles.bodyMedium,
          ),
        ),
        if (!isDescriptionExpanded && widget.description.length > 150)
          InkWell(
            onTap: () => setState(() => isDescriptionExpanded = true),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'See more',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.primary,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        if (isDescriptionExpanded)
          InkWell(
            onTap: () => setState(() => isDescriptionExpanded = false),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'See less',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_up,
                    color: AppColors.primary,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
