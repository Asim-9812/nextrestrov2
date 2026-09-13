import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../category/domain/entities/category_entity.dart';
import '../../../category/presentation/bloc/category_bloc.dart';
import '../../../category/presentation/bloc/category_event.dart';
import '../../../category/presentation/bloc/category_state.dart';
import '../../../category/presentation/pages/category_products_page.dart';
import '../../../category/presentation/pages/category_list_page.dart';

class DashboardCategories extends StatelessWidget {
  const DashboardCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const SizedBox(
            height: 50,
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

        final displayCategories = categories.length > 10 ? categories.take(10).toList() : categories;
        final hasMore = categories.length > 10;

        return Container(
          height: 40,
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            itemCount: displayCategories.length + (hasMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == displayCategories.length) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CategoryListPage()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            'See all',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(Icons.arrow_forward, color: Colors.white, size: 14),
                        ],
                      ),
                    ),
                  ),
                );
              }

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
                        style: AppTextStyles.bodySmall.copyWith(
                          fontWeight: FontWeight.bold,
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
