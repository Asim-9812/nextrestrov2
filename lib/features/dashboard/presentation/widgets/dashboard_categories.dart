import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/sample_data.dart';
import '../../../product_type/domain/entities/product_type_entity.dart';
import '../../../product_type/presentation/bloc/product_type_bloc.dart';
import '../../../product_type/presentation/bloc/product_type_state.dart';
import '../../../product_type/presentation/pages/product_type_products_page.dart';

class DashboardCategories extends StatelessWidget {
  const DashboardCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Color> pastelColors = [
      const Color(0xFFFFF2E1),
      const Color(0xFFFFEBF6),
      const Color(0xFFFFF8E1),
      const Color(0xFFE1FFF2),
      const Color(0xFFE1F5FF),
      const Color(0xFFF2EEFF),
    ];

    return BlocBuilder<ProductTypeBloc, ProductTypeState>(
      builder: (context, state) {
        if (state is ProductTypeLoading) {
          return const SizedBox(
            height: 100,
            child: Center(child: CircularProgressIndicator()),
          );
        }
        
        List<ProductTypeEntity> displayTypes = [];
        if (state is ProductTypeLoaded) {
          displayTypes = state.productTypes;
        } else {
          displayTypes = sampleProductTypes;
        }

        if (displayTypes.isEmpty) return const SizedBox.shrink();

        return Container(
          height: 100,
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            itemCount: displayTypes.length,
            itemBuilder: (context, index) {
              final type = displayTypes[index];
              final color = pastelColors[index % pastelColors.length];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductTypeProductsPage(productType: type),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(Icons.pets, color: Colors.black54, size: 24),
                        ),
                      ),
                      AppSizes.gapH8,
                      SizedBox(
                        width: 80,
                        child: Text(
                          type.productTypeName,
                          style: AppTextStyles.bodySmall.copyWith(
                            fontWeight: FontWeight.w600, 
                            color: Colors.black,
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
