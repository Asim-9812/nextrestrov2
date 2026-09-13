import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../cart/presentation/bloc/cart_bloc.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_state.dart';
import '../../../product/domain/entities/product.dart';
import '../../../product/presentation/pages/product_details_page.dart';
import '../../../product/presentation/bloc/product_bloc.dart';
import '../../../product/presentation/bloc/product_state.dart';
import '../../../../core/widgets/app_product_image.dart';
import 'package:divinepets/features/wishlist/presentation/bloc/wishlist_bloc.dart';

class FeaturedDeals extends StatefulWidget {
  const FeaturedDeals({super.key});

  @override
  State<FeaturedDeals> createState() => _FeaturedDealsState();
}

class _FeaturedDealsState extends State<FeaturedDeals> {
  int _selectedDealIndex = 0;
  final ScrollController _dealScrollController = ScrollController();
  List<Product>? _shuffledDeals;

  void _onDealTap(int index) {
    if (_shuffledDeals == null) return;
    setState(() {
      _selectedDealIndex = index;
    });
    // Smoothly scroll to the selected item
    double offset = index * 166.0;
    _dealScrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _dealScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading && _shuffledDeals == null) {
          return const SizedBox(
            height: 200,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is ProductLoaded) {
          _shuffledDeals ??= (List<Product>.from(state.products)..shuffle()).take(8).toList();
        }

        if (_shuffledDeals == null || _shuffledDeals!.isEmpty) {
          return const SizedBox.shrink();
        }

        final deals = _shuffledDeals!;

        return Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 20),
          color: AppColors.white,
          child: Stack(
            children: [
              Container(
                color: AppColors.accentInfo,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 32),
                    // Header Row
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Today\'s Featured Deals',
                            style: AppTextStyles.h3.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('Expires in', style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 9)),
                              AppSizes.gapH4,
                              Row(
                                children: [
                                  _buildTimerBox('00'),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 2),
                                    child: Text(':', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10)),
                                  ),
                                  _buildTimerBox('00'),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 2),
                                    child: Text(':', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10)),
                                  ),
                                  _buildTimerBox('00'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    AppSizes.gapH16,
                    // Horizontal Scrolling Cards with selection UX
                    SizedBox(
                      height: 140, 
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ListView.builder(
                            controller: _dealScrollController,
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            itemCount: deals.length,
                            itemBuilder: (context, index) {
                              final isSelected = index == _selectedDealIndex;
                              return GestureDetector(
                                onTap: () => _onDealTap(index),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeInOut,
                                  width: isSelected ? 280 : 100, 
                                  margin: const EdgeInsets.only(right: 12),
                                  child: isSelected ? _buildLargeDealCard(deals[index]) : _buildSmallDealCard(deals[index]),
                                ),
                              );
                            },
                          ),
                          // Arrows
                          if (_selectedDealIndex > 0)
                            Positioned(
                              left: 8,
                              child: _buildArrowButton(Icons.chevron_left, () => _onDealTap(_selectedDealIndex - 1)),
                            ),
                          if (_selectedDealIndex < deals.length - 1)
                            Positioned(
                              right: 8,
                              child: _buildArrowButton(Icons.chevron_right, () => _onDealTap(_selectedDealIndex + 1)),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
              // Top Wave
              Positioned(
                top: -1,
                left: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/dashboard_assets/wv1.png',
                  fit: BoxFit.fitWidth,
                  color: Colors.white,
                ),
              ),
              // Bottom Wave
              Positioned(
                bottom: -1,
                left: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/dashboard_assets/wv2.png',
                  fit: BoxFit.fitWidth,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildArrowButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: AppColors.accentInfo.withOpacity(0.9),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white.withOpacity(0.5)),
        ),
        child: Icon(icon, color: Colors.white, size: 24),
      ),
    );
  }

  Widget _buildLargeDealCard(Product product) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isVisible = constraints.maxWidth > 275;

        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: !isVisible 
            ? const SizedBox.shrink() 
            : SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product Image
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade100),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: AppProductImage(
                                imageUrl: product.images.isNotEmpty ? product.images.first : null,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        AppSizes.gapW8,
                        // Info
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      product.name,
                                      style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.bold, fontSize: 13),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                    decoration: BoxDecoration(color: const Color(0xFFFFEAF2), borderRadius: BorderRadius.circular(6)),
                                    child: const Text('23%', style: TextStyle(color: Color(0xFFFF4D7D), fontSize: 7, fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                              AppSizes.gapH4,
                              Row(
                                children: [
                                  Text('Rs. ${product.price.toInt()}', style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.bold, color: AppColors.primary, fontSize: 14)),
                                  AppSizes.gapW4,
                                  if (product.oldPrice != null)
                                    Text('Rs. ${product.oldPrice!.toInt()}', style: AppTextStyles.bodySmall.copyWith(decoration: TextDecoration.lineThrough, fontSize: 8, color: Colors.grey.shade300)),
                                  const Spacer(),
                                  BlocBuilder<WishlistBloc, WishlistState>(
                                    builder: (context, state) {
                                      final isFav = state.isFavorite(product.id);
                                      return GestureDetector(
                                        onTap: () {
                                          context.read<WishlistBloc>().add(ToggleWishlist(product));
                                        },
                                        child: Icon(
                                          isFav ? Icons.favorite_rounded : Icons.favorite_border,
                                          color: AppColors.primary,
                                          size: 18,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              AppSizes.gapH4,
                              Text(
                                product.description,
                                style: AppTextStyles.bodySmall.copyWith(color: Colors.grey, fontSize: 8, height: 1.1),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildSmallProductThumb(image: product.images.isNotEmpty ? product.images[0] : null),
                              _buildSmallProductThumb(image: product.images.length > 1 ? product.images[1] : (product.images.isNotEmpty ? product.images[0] : null)),
                            ],
                          ),
                        ),
                        AppSizes.gapW8,
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    final authState = context.read<AuthBloc>().state;
                                    if (authState is Authenticated) {
                                      context.read<CartBloc>().add(
                                            AddToCartEvent(
                                              customerId: authState.user.userId,
                                              productId: product.productId ?? 0,
                                              quantity: 1,
                                              unitPrice: product.price,
                                              productVariantId: product.productVariantId,
                                              productBatchId: product.productBatchId,
                                            ),
                                          );
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text('${product.name} added to cart!'),
                                          duration: const Duration(seconds: 1),
                                          backgroundColor: AppColors.primary,
                                          behavior: SnackBarBehavior.floating,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text('Please login to add items to cart'),
                                          backgroundColor: Colors.orange,
                                          behavior: SnackBarBehavior.floating,
                                        ),
                                      );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primary,
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                                    minimumSize: const Size(0, 28),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                  ),
                                  child: const Text('Add', style: TextStyle(color: Colors.white, fontSize: 9)),
                                ),
                              ),
                              AppSizes.gapW8,
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProductDetailsPage(product: product),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.bgSecondary,
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                                    minimumSize: const Size(0, 28),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                  ),
                                  child: const Text('Details', style: TextStyle(color: AppColors.textPrimary, fontSize: 9)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
        );
      },
    );
  }

  Widget _buildSmallDealCard(Product product) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 75,
            child: AppProductImage(
              imageUrl: product.images.isNotEmpty ? product.images.first : null,
              fit: BoxFit.contain,
            ),
          ),
          const Spacer(),
          Text(
            product.name, 
            style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.bold, fontSize: 11), 
            overflow: TextOverflow.ellipsis
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, color: AppColors.secondary, size: 10),
              Text(' ${product.rating}', style: AppTextStyles.bodySmall.copyWith(fontSize: 9)),
              const Spacer(),
              BlocBuilder<WishlistBloc, WishlistState>(
                builder: (context, state) {
                  final isFav = state.isFavorite(product.id);
                  return GestureDetector(
                    onTap: () {
                      context.read<WishlistBloc>().add(ToggleWishlist(product));
                    },
                    child: Icon(
                      isFav ? Icons.favorite_rounded : Icons.favorite_border,
                      color: AppColors.primary,
                      size: 14,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimerBox(String value) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(5)),
      child: Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
    );
  }

  Widget _buildSmallProductThumb({double size = 40, String? image}) {
    return Container(
      width: size,
      height: size,
      margin: const EdgeInsets.only(top: 4),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF2E1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: AppProductImage(imageUrl: image, fit: BoxFit.contain),
    );
  }
}
