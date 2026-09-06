import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_colors.dart';
import '../../domain/entities/chat_message.dart';
import '../../../product/presentation/pages/product_details_page.dart';
import '../../../product/domain/entities/product.dart';
import '../../../cart/presentation/bloc/cart_bloc.dart';
import '../../../wishlist/presentation/bloc/wishlist_bloc.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_state.dart';
import '../../../auth/presentation/pages/login_page.dart';
import '../../../../core/widgets/app_product_image.dart';
import 'typewriter_text.dart';
import '../../../product/presentation/pages/filtered_product_list_page.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isUser = message.type == MessageType.user;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (isUser) _buildCopyButton(context),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isUser ? AppColors.primary : AppColors.bgSecondary,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(16),
                    topRight: const Radius.circular(16),
                    bottomLeft: Radius.circular(isUser ? 16 : 0),
                    bottomRight: Radius.circular(isUser ? 0 : 16),
                  ),
                ),
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.75,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isUser || message.isAnimated)
                      Text(
                        message.text,
                        style: TextStyle(
                          color: isUser ? Colors.white : AppColors.textPrimary,
                          fontSize: 16,
                        ),
                      )
                    else
                      TypewriterText(
                        text: message.text,
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 16,
                        ),
                        onFinished: () => message.isAnimated = true,
                      ),
                    if (message.products != null && message.products!.isNotEmpty) ...[
                      const SizedBox(height: 12),
                      const Divider(color: Colors.black12),
                      const SizedBox(height: 8),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: message.products!.length,
                        separatorBuilder: (context, index) => const SizedBox(height: 12),
                        itemBuilder: (context, index) => _buildProductItem(context, message.products![index]),
                      ),
                      const SizedBox(height: 12),
                      _buildSeeMoreButton(context),
                    ],
                  ],
                ),
              ),
              if (!isUser) _buildCopyButton(context),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            _formatTime(message.timestamp),
            style: const TextStyle(
              color: AppColors.textTertiary,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSeeMoreButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          final categoryIds = message.products!
              .map((p) => p.categoryId)
              .where((id) => id != null)
              .cast<int>()
              .toSet()
              .toList();
          final petTypeIds = message.products!
              .map((p) => p.petTypeId)
              .where((id) => id != null)
              .cast<int>()
              .toSet()
              .toList();

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FilteredProductListPage(
                categoryIds: categoryIds,
                petTypeIds: petTypeIds,
                title: "Related Products",
              ),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: AppColors.primary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: AppColors.primary),
          ),
        ),
        child: const Text("See More", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildCopyButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.copy_rounded, size: 16, color: AppColors.textTertiary),
      onPressed: () {
        Clipboard.setData(ClipboardData(text: message.text));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("Copied to clipboard"),
            duration: const Duration(seconds: 2),
            backgroundColor: AppColors.primary,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        );
      },
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      splashRadius: 16,
    );
  }

  Widget _buildProductItem(BuildContext context, Product product) {
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
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.bgSecondary),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.bgSecondary,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: AppProductImage(
                      imageUrl: product.images.isNotEmpty ? product.images.first : null,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: AppColors.textPrimary,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (product.brandName != null)
                        Text(
                          product.brandName!,
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 12,
                          ),
                        ),
                      Text(
                        "NPR ${product.price}",
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _addToCart(context, product),
                    icon: const Icon(Icons.add_shopping_cart, size: 16),
                    label: const Text("Cart", style: TextStyle(fontSize: 12)),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      foregroundColor: AppColors.primary,
                      side: const BorderSide(color: AppColors.primary),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                BlocBuilder<WishlistBloc, WishlistState>(
                  builder: (context, state) {
                    final isFavorite = state.isFavorite(product.id);
                    return IconButton(
                      onPressed: () {
                        context.read<WishlistBloc>().add(ToggleWishlist(product));
                        final message = isFavorite 
                          ? "${product.name} removed from wishlist" 
                          : "${product.name} added to wishlist";
                        
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(message),
                            duration: const Duration(seconds: 2),
                            backgroundColor: AppColors.primary,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                        );
                      },
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : AppColors.textSecondary,
                        size: 20,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.bgSecondary,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _addToCart(BuildContext context, Product product) {
    final authState = context.read<AuthBloc>().state;
    if (authState is Authenticated) {
      context.read<CartBloc>().add(AddToCartEvent(
            customerId: authState.user.userId,
            productId: product.productId ?? 0,
            quantity: 1,
            unitPrice: product.price,
          ));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("${product.name} added to cart!"),
          duration: const Duration(seconds: 2),
          backgroundColor: AppColors.primary,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Please login to add items to cart"),
          backgroundColor: Colors.orange,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
      Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginPage()));
    }
  }

  String _formatTime(DateTime timestamp) {
    return "${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')}";
  }
}
