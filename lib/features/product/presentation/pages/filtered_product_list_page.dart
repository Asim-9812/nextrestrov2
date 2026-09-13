import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../dashboard/presentation/widgets/product_card.dart';
import '../bloc/product_bloc.dart';
import '../bloc/product_event.dart';
import '../bloc/product_state.dart';

import '../../../product/domain/entities/product.dart';

class FilteredProductListPage extends StatefulWidget {
  final List<int>? categoryIds;
  final List<int>? petTypeIds;
  final List<Product>? products;
  final String title;

  const FilteredProductListPage({
    super.key,
    this.categoryIds,
    this.petTypeIds,
    this.products,
    this.title = 'Products',
  });

  @override
  State<FilteredProductListPage> createState() => _FilteredProductListPageState();
}

class _FilteredProductListPageState extends State<FilteredProductListPage> {
  @override
  void initState() {
    super.initState();
    if (widget.products == null) {
      context.read<ProductBloc>().add(FilterProductsByMultipleCriteriaEvent(
            categoryIds: widget.categoryIds ?? [],
            petTypeIds: widget.petTypeIds ?? [],
          ));
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
          onPressed: () {
            if (widget.products == null) {
              context.read<ProductBloc>().add(GetAllProductsEvent());
            }
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.title,
          style: AppTextStyles.h2.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w900,
            fontSize: 18,
          ),
        ),
        centerTitle: false,
      ),
      body: widget.products != null 
        ? _buildProductGrid(widget.products!)
        : BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is ProductLoaded) {
                return _buildProductGrid(state.filteredProducts);
              }

              return const SizedBox.shrink();
            },
          ),
    );
  }

  Widget _buildProductGrid(List<Product> products) {
    if (products.isEmpty) return _buildEmptyState();
    
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(product: products[index]);
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inventory_2_outlined, size: 80, color: Colors.grey.shade200),
          const SizedBox(height: 16),
          Text(
            'No products found matching these categories',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey.shade400, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
