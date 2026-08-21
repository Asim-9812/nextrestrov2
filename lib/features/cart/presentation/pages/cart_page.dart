import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/sample_products.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_state.dart';
import '../../../checkout/presentation/pages/checkout_page.dart';
import '../bloc/cart_bloc.dart';
import '../widgets/cart_item_tile.dart';
import '../widgets/free_delivery_banner.dart';
import '../../../dashboard/presentation/widgets/product_card.dart';
import '../../../product/presentation/bloc/product_bloc.dart';
import '../../../product/presentation/bloc/product_state.dart';
import '../../../../core/widgets/app_confirmation_dialog.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Set<int> selectedItemIds = {};

  @override
  void initState() {
    super.initState();
    _loadCart();
  }

  void _loadCart() {
    final authState = context.read<AuthBloc>().state;
    if (authState is Authenticated) {
      context.read<CartBloc>().add(GetCartEvent(authState.user.userId));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Cart', 
          style: AppTextStyles.h2.copyWith(
            color: AppColors.primary,
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is CartLoaded) {
            final cart = state.cart;
            if (cart.items.isEmpty) {
              return const Center(child: Text('Your cart is empty'));
            }

            return RefreshIndicator(
              onRefresh: () async => _loadCart(),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Review your items and proceed to checkout',
                            style: TextStyle(color: Colors.grey.shade600, fontSize: 11, fontWeight: FontWeight.w500),
                          ),
                          const Text(
                            '100% Secure Checkout',
                            style: TextStyle(color: Colors.grey, fontSize: 9),
                          ),
                        ],
                      ),
                    ),
                    AppSizes.gapH16,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: FreeDeliveryBanner(currentTotal: state.totalPrice),
                    ),
                    AppSizes.gapH24,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Checkbox(
                            value: selectedItemIds.length == cart.items.length && cart.items.isNotEmpty,
                            onChanged: (val) {
                              setState(() {
                                if (val == true) {
                                  selectedItemIds = cart.items.map((e) => e.cartItemId).toSet();
                                } else {
                                  selectedItemIds.clear();
                                }
                              });
                            },
                            activeColor: AppColors.primary,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                          ),
                          Text(
                            'Select all (${cart.items.length})',
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                          const Spacer(),
                          Text('${cart.items.length} items', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                          AppSizes.gapW12,
                      if (selectedItemIds.isNotEmpty)
                        GestureDetector(
                          onTap: () {
                            final authState = context.read<AuthBloc>().state;
                            if (authState is Authenticated) {
                              context.read<CartBloc>().add(RemoveSelectedFromCartEvent(
                                    customerId: authState.user.userId,
                                    cartItemIds: selectedItemIds.toList(),
                                  ));
                              setState(() {
                                selectedItemIds.clear();
                              });
                            }
                          },
                          child: Row(
                            children: const [
                              Icon(Icons.delete_sweep_outlined, color: Colors.orangeAccent, size: 18),
                              SizedBox(width: 4),
                              Text('Remove selected', style: TextStyle(color: Colors.orangeAccent, fontSize: 12, fontWeight: FontWeight.w500)),
                            ],
                          ),
                        )
                      else
                        GestureDetector(
                          onTap: () {
                            final authState = context.read<AuthBloc>().state;
                            if (authState is Authenticated) {
                              context.read<CartBloc>().add(ClearCartEvent(authState.user.userId));
                            }
                          },
                          child: Row(
                            children: const [
                              Icon(Icons.delete_outline, color: Colors.redAccent, size: 18),
                              SizedBox(width: 4),
                              Text('Remove all', style: TextStyle(color: Colors.redAccent, fontSize: 12, fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                    ],
                      ),
                    ),
                    AppSizes.gapH12,
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: cart.items.length,
                      itemBuilder: (context, index) {
                        final item = cart.items[index];
                        return CartItemTile(
                          item: item,
                          isSelected: selectedItemIds.contains(item.cartItemId),
                          onSelected: (val) {
                            setState(() {
                              if (val == true) {
                                selectedItemIds.add(item.cartItemId);
                              } else {
                                selectedItemIds.remove(item.cartItemId);
                              }
                            });
                          },
                        );
                      },
                    ),
                    AppSizes.gapH16,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Subtotal', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                              Text('Rs. ${state.totalPrice.toInt()}', style: const TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                _showConfirmationDialog(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                elevation: 0,
                              ),
                              child: const Text(
                                'Proceed to checkout',
                                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppSizes.gapH32,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text('You Might Also Like', style: AppTextStyles.h3),
                    ),
                    AppSizes.gapH16,
                    _buildRecommendationsGrid(),
                    AppSizes.gapH32,
                  ],
                ),
              ),
            );
          }

          if (state is CartError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.message, style: const TextStyle(color: Colors.red)),
                  ElevatedButton(onPressed: _loadCart, child: const Text('Retry')),
                ],
              ),
            );
          }

          return const Center(child: Text('Start adding items to your cart!'));
        },
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showAppConfirmationDialog(
      context,
      title: 'Confirm Checkout',
      message: 'Are you sure you want to proceed to checkout with the selected items?',
      confirmText: 'Checkout',
      icon: Icons.shopping_cart_checkout,
      onConfirm: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CheckoutPage()),
        );
      },
    );
  }

  Widget _buildRecommendationsGrid() {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoaded && state.products.isNotEmpty) {
          final products = List.from(state.products)..shuffle();
          final displayProducts = products.take(5).toList();

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: MasonryGridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              itemCount: displayProducts.length,
              itemBuilder: (context, index) {
                if (index == 1) {
                  return _buildNewArrivalsBanner();
                }
                return ProductCard(
                  product: displayProducts[index],
                  imageHeight: index % 2 == 0 ? 120 : 150,
                );
              },
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildNewArrivalsBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFE985F),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'New\nArrivals!!!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w900,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 12),
          Image.asset(
            'assets/images/dashboard_assets/prodstack.png',
            height: 100,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'View all products',
                  style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 4),
                Icon(Icons.arrow_forward, color: Colors.white, size: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
