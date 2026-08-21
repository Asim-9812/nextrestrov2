import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../dashboard/presentation/widgets/featured_deals.dart';
import '../../../dashboard/presentation/widgets/product_card.dart';
import '../../../product/domain/entities/product.dart';
import '../../../product/presentation/bloc/product_bloc.dart';
import '../../../product/presentation/bloc/product_event.dart';
import '../../../product/presentation/bloc/product_state.dart';
import '../widgets/shop_category_icons.dart';
import '../widgets/shop_by_pets_section.dart';
import '../../../dashboard/presentation/widgets/new_arrivals_banner.dart' as dashboard;
import '../widgets/shop_by_brands_section.dart';
import '../widgets/shop_filter_bottom_sheet.dart';
import '../../../cart/presentation/pages/cart_page.dart';
import '../../../cart/presentation/bloc/cart_bloc.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearch(String query) {
    context.read<ProductBloc>().add(SearchProductsEvent(query));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            final isSearching = state is ProductLoaded && state.searchQuery != null && state.searchQuery!.isNotEmpty;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  _buildSearchBar(),
                  if (isSearching)
                    _buildSearchResults(state as ProductLoaded)
                  else
                    _buildShopContent(state),
                  const SizedBox(height: 100),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Shop',
                      style: AppTextStyles.h3.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.pets, color: AppColors.primary, size: 20),
                  ],
                ),
                const Text(
                  'Everything your pet loves, all in one place.',
                  style: TextStyle(color: Colors.black54, fontSize: 11, fontWeight: FontWeight.w500),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          _buildCartIcon(),
        ],
      ),
    );
  }

  Widget _buildCartIcon() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CartPage()),
        );
      },
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(Icons.shopping_cart_outlined, size: 26),
              if (state.totalItems > 0)
                Positioned(
                  right: -4,
                  top: -4,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF782C),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1.5),
                    ),
                    child: Center(
                      child: Text(
                        '${state.totalItems}',
                        style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold, height: 1),
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFFF7F8FA),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: _onSearch,
                decoration: InputDecoration(
                  hintText: 'Search for products, brands...',
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
                  prefixIcon: const Icon(Icons.search, color: Colors.black),
                  suffixIcon: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.grid_view_rounded, color: Colors.white, size: 18),
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: () => ShopFilterBottomSheet.show(context),
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: const Row(
                children: [
                  Icon(Icons.tune, color: Colors.black, size: 20),
                  SizedBox(width: 8),
                  Text('Filters', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults(ProductLoaded state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Search Results (${state.filteredProducts.length})',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 16),
          state.filteredProducts.isEmpty
              ? const Center(child: Text('No products found'))
              : GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.65,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: state.filteredProducts.length,
                  itemBuilder: (context, index) {
                    return ProductCard(product: state.filteredProducts[index]);
                  },
                ),
        ],
      ),
    );
  }

  Widget _buildShopContent(ProductState state) {
    if (state is ProductLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    
    if (state is ProductLoaded) {
      final allProducts = List<Product>.from(state.products);
      allProducts.shuffle();
      
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FeaturedDeals(),
          const ShopCategoryIcons(),
          AppSizes.gapH24,
          _buildSectionHeader('Best Sellers 🔥', onSeeAll: () {}),
          _buildProductGrid(allProducts.take(4).toList()),
          AppSizes.gapH24,
          _buildSectionHeader('For Pet 1', onSeeAll: () {}),
          _buildHorizontalProductList(allProducts.skip(4).take(5).toList()),
          AppSizes.gapH24,
          _buildSectionHeader('For Pet 2', onSeeAll: () {}),
          _buildHorizontalProductList(allProducts.skip(9).take(5).toList()),
          AppSizes.gapH24,
          const ShopByPetsSection(),
          AppSizes.gapH24,
          const dashboard.NewArrivalsBanner(),
          AppSizes.gapH24,
          const ShopByBrandsSection(),
          AppSizes.gapH24,
          _buildAnotherArrivalsSection(allProducts.skip(14).take(3).toList()),
        ],
      );
    }
    
    return const SizedBox.shrink();
  }

  Widget _buildSectionHeader(String title, {required VoidCallback onSeeAll}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          GestureDetector(
            onTap: onSeeAll,
            child: Row(
              children: [
                Text(
                  'See all',
                  style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 13),
                ),
                Icon(Icons.chevron_right, color: AppColors.primary, size: 18),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductGrid(List<Product> products) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
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
      ),
    );
  }

  Widget _buildHorizontalProductList(List<Product> products) {
    return SizedBox(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ProductCard(product: products[index], width: 160),
          );
        },
      ),
    );
  }

  Widget _buildAnotherArrivalsSection(List<Product> products) {
    if (products.length < 3) return const SizedBox.shrink();
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: ProductCard(product: products[0])),
              const SizedBox(width: 16),
              Expanded(child: _buildSmallArrivalsTile()),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: ProductCard(product: products[1])),
              const SizedBox(width: 16),
              Expanded(child: ProductCard(product: products[2])),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSmallArrivalsTile() {
    return Container(
      height: 240,
      decoration: BoxDecoration(
        color: const Color(0xFFFE985F),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'New\nArrivals!!!',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900, height: 1.1),
          ),
          const SizedBox(height: 12),
          Image.asset('assets/images/dashboard_assets/prodstack.png', height: 100),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(20)),
            child: const Text('View all products', style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
