import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../injection_container.dart';
import 'package:divinepets/core/constants/app_colors.dart';
import 'package:divinepets/core/constants/app_sizes.dart';
import 'package:divinepets/features/product/domain/entities/product.dart';
import 'package:divinepets/features/wishlist/presentation/bloc/wishlist_bloc.dart';
import '../../../cart/presentation/bloc/cart_bloc.dart';
import '../../../cart/presentation/pages/cart_page.dart';
import '../bloc/review_cubit.dart';
import '../bloc/review_state.dart';
import '../bloc/product_variant_cubit.dart';
import '../bloc/product_variant_state.dart';
import '../widgets/product_image_gallery.dart';
import '../widgets/product_info_header.dart';
import '../widgets/product_description.dart';
import '../widgets/product_size_selector.dart';
import '../widgets/product_faq_section.dart';
import '../widgets/product_reviews_section.dart';
import '../widgets/product_recommendations.dart';
import '../widgets/product_bottom_action_bar.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;
  final int? orderId;

  const ProductDetailsPage({super.key, required this.product, this.orderId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<ReviewCubit>()..getProductReviews(product.productId ?? 0),
        ),
        BlocProvider(
          create: (context) => sl<ProductVariantCubit>()..getProductVariants(product.productId ?? 0),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.primary, size: 28),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            BlocBuilder<WishlistBloc, WishlistState>(
              builder: (context, state) {
                final isFav = state.isFavorite(product.id);
                return IconButton(
                  icon: Icon(
                    isFav ? Icons.favorite : Icons.favorite_border,
                    color: AppColors.primary,
                  ),
                  onPressed: () {
                    context.read<WishlistBloc>().add(ToggleWishlist(product));
                  },
                );
              },
            ),
            const SizedBox(width: 12,),
            GestureDetector(
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
                            constraints: const BoxConstraints(
                              minWidth: 16,
                              minHeight: 16,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFF782C),
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 1.5),
                            ),
                            child: Center(
                              child: Text(
                                '${state.totalItems}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 9,
                                  fontWeight: FontWeight.bold,
                                  height: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(width: 12,)
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Section: Images & Info Header
              Padding(
                padding: const EdgeInsets.all(AppSizes.s16),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 4,
                        child: ProductImageGallery(images: product.images),
                      ),
                      AppSizes.gapW16,
                      Expanded(
                        flex: 4,
                        child: ProductInfoHeader(product: product),
                      ),
                    ],
                  ),
                ),
              ),

              // Middle Sections: Description, Size, FAQs, Reviews
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.s16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductDescription(description: product.description),
                    AppSizes.gapH24,
                    BlocBuilder<ProductVariantCubit, ProductVariantState>(
                      builder: (context, state) {
                        if (state is ProductVariantLoaded && state.variants.isNotEmpty) {
                          final uniqueSizes = state.variants
                              .map((v) => v.size)
                              .where((s) => s != null && s.isNotEmpty)
                              .cast<String>()
                              .toSet()
                              .toList();

                          if (uniqueSizes.isNotEmpty) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ProductSizeSelector(
                                  sizes: uniqueSizes,
                                  onSizeSelected: (size) {},
                                ),
                                AppSizes.gapH32,
                              ],
                            );
                          }
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ],
                ),
              ),
              // ProductFAQSection(faqs: product.faqs),
              // AppSizes.gapH16,
              const Divider(
                color: AppColors.textSecondary,
                thickness: 0.2,
                endIndent: 8,
                indent: 8,
              ),
              AppSizes.gapH16,
              BlocConsumer<ReviewCubit, ReviewState>(
                listener: (context, state) {
                  if (state is ReviewActionSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  } else if (state is ReviewError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is ReviewLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ReviewLoaded) {
                    return ProductReviewsSection(
                      product: product,
                      reviews: state.reviews,
                      orderId: orderId,
                    );
                  } else if (state is ReviewActionLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  
                  // For ReviewActionSuccess or ReviewInitial, if we don't have reviews yet,
                  // it might be better to show something or just wait for the auto-refresh.
                  // But ReviewCubit.createProductReview calls getProductReviews, 
                  // which will emit ReviewLoading then ReviewLoaded.
                  return ProductReviewsSection(
                    product: product,
                    reviews: const [],
                    orderId: orderId,
                  );
                },
              ),
              AppSizes.gapH32,

              // Bottom Sections: Recommendations
              RelatedProductsSection(currentProduct: product),
              AppSizes.gapH32,
              RecommendedProductsSection(currentProduct: product),
              AppSizes.gapH32,
            ],
          ),
        ),
        bottomNavigationBar: ProductBottomActionBar(product: product),
      ),
    );
  }
}