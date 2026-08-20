import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:divinepets/core/constants/app_colors.dart';
import 'package:divinepets/core/constants/app_sizes.dart';
import 'package:divinepets/features/product/domain/entities/product.dart';
import 'package:divinepets/features/wishlist/presentation/bloc/wishlist_bloc.dart';
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

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
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
          IconButton(
            icon: const Icon(Icons.share_outlined, color: AppColors.primary),
            onPressed: () {},
          ),
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
                  ProductSizeSelector(
                    sizes: product.sizes,
                    onSizeSelected: (size) {},
                  ),
                  AppSizes.gapH32,

                ],
              ),
            ),
            ProductFAQSection(faqs: product.faqs),
            AppSizes.gapH16,
            const Divider(
              color: AppColors.textSecondary,
              thickness: 0.2,
              endIndent: 8,
              indent: 8,
            ),
            AppSizes.gapH16,
            ProductReviewsSection(product: product),
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
    );
  }
}