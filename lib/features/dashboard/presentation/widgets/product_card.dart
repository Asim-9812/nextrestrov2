import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:divinepets/core/constants/app_colors.dart';
import 'package:divinepets/core/constants/app_text_styles.dart';
import 'package:divinepets/features/product/domain/entities/product.dart';
import 'package:divinepets/features/product/presentation/pages/product_details_page.dart';
import 'package:divinepets/features/wishlist/presentation/bloc/wishlist_bloc.dart';
import 'package:divinepets/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:divinepets/features/cart/domain/entities/cart_item.dart';

import 'package:divinepets/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:divinepets/features/auth/presentation/bloc/auth_state.dart';
import 'package:divinepets/core/widgets/app_product_image.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final bool showBadge;
  final String? badgeText;
  final double? width;
  final double imageHeight;

  const ProductCard({
    super.key,
    required this.product,
    this.showBadge = false,
    this.badgeText,
    this.width,
    this.imageHeight = 120,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(product: product),
          ),
        );
      },
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade100),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image
                Container(
                  width: double.infinity,
                  height: imageHeight,
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F8FA),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: AppProductImage(
                      imageUrl: product.images.isNotEmpty ? product.images.first : null,
                      height: imageHeight * 0.75,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        product.name,
                        style: AppTextStyles.bodyLarge.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.black,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        product.category,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: Colors.grey.shade500,
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.star,
                                      color: AppColors.secondary, size: 12),
                                  const SizedBox(width: 2),
                                  Text(
                                    product.rating.toString(),
                                    style: AppTextStyles.bodySmall.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Rs. ${product.price.toInt()}',
                                style: AppTextStyles.bodyMedium.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.primary,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              final authState = context.read<AuthBloc>().state;
                              if (authState is Authenticated) {
                                context.read<CartBloc>().add(
                                      AddToCartEvent(
                                        customerId: authState.user.userId,
                                        productId: product.productId ?? 0,
                                        quantity: 1,
                                        unitPrice: product.salesPrice ?? 100,
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
                            child: Container(
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.primary.withOpacity(0.3),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: const Icon(Icons.add,
                                  color: Colors.white, size: 18),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (showBadge)
              Positioned(
                left: 12,
                top: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF782C),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFFF782C).withOpacity(0.3),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    badgeText ?? '-23%',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            Positioned(
              right: 12,
              top: 12,
              child: BlocBuilder<WishlistBloc, WishlistState>(
                builder: (context, state) {
                  final isFav = state.isFavorite(product.id);
                  return GestureDetector(
                    onTap: () {
                      context.read<WishlistBloc>().add(ToggleWishlist(product));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isFav ? Icons.favorite_rounded : Icons.favorite_border,
                        size: 18,
                        color: AppColors.primary,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
