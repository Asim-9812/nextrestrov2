import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../category/domain/entities/category_entity.dart';
import '../../../category/presentation/bloc/category_bloc.dart';
import '../../../category/presentation/bloc/category_state.dart';
import '../../../category/presentation/pages/category_products_page.dart';

class ShopCategoryIcons extends StatelessWidget {
  const ShopCategoryIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const SizedBox(
            height: 40,
            child: Center(child: CircularProgressIndicator()),
          );
        }
        
        List<CategoryEntity> categories = [];
        if (state is CategoryLoaded) {
          categories = state.categories;
        } else if (state is CategoryError) {
          return Center(child: Text(state.message, style: const TextStyle(fontSize: 10, color: Colors.red)));
        }

        if (categories.isEmpty) return const SizedBox.shrink();

        // Limit to 10 for the quick bar
        final displayCategories = categories.length > 10 ? categories.take(10).toList() : categories;

        return Container(
          height: 40,
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            itemCount: displayCategories.length,
            itemBuilder: (context, index) {
              final category = displayCategories[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryProductsPage(category: category),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.primaryLightest,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.primarySoft),
                    ),
                    child: Center(
                      child: Text(
                        category.categoryName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold, 
                          fontSize: 12,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
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
