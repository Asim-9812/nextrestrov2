import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/widgets/app_confirmation_dialog.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_state.dart';
import '../../../cart/presentation/bloc/cart_bloc.dart';
import '../../../order/presentation/bloc/order_bloc.dart';
import '../../../order/presentation/bloc/order_event.dart';
import '../../../order/presentation/bloc/order_state.dart';
import '../../../order/domain/entities/delivery_entity.dart';
import '../widgets/address_section.dart';
import '../widgets/delivery_details_section.dart';
import '../widgets/payment_method_section.dart';
import '../widgets/order_summary_section.dart';
import 'thank_you_page.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int _selectedPaymentMethod = 0; // 0: COD, 1: eSewa, 2: Khalti
  DeliveryEntity? _deliveryAddress;

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderBloc, OrderState>(
      listener: (context, state) {
        if (state is OrderLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const Center(child: CircularProgressIndicator()),
          );
        } else if (state is CODOrderSuccess) {
          Navigator.pop(context); // Close loading dialog
          
          // Clear Cart
          final authState = context.read<AuthBloc>().state;
          if (authState is Authenticated) {
            context.read<CartBloc>().add(ClearCartEvent(authState.user.userId));
          }
          
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ThankYouPage(orderResponse: state.response),
            ),
          );
        } else if (state is OrderError) {
          Navigator.pop(context); // Close loading dialog
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: AppColors.accentError),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.primary, size: 28),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Checkout', 
            style: AppTextStyles.h2.copyWith(
              color: AppColors.primary,
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Complete Your Order',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                ),
              ),
              AppSizes.gapH16,
              
            // Delivery Address Section
            AddressSection(
              title: 'Delivery Address',
              icon: Icons.location_on,
              onAddressSelected: (item) {
                setState(() {
                  _deliveryAddress = DeliveryEntity(
                    address: item.addressController.text,
                    city: item.cityController.text,
                    state: item.stateController.text,
                    postalCode: item.postalCodeController.text,
                    landmark: item.landmarkController.text,
                    deliveryNotes: item.deliveryNotesController.text,
                  );
                });
              },
            ),
              
              AppSizes.gapH16,
              
              // Delivery Details Section
              const DeliveryDetailsSection(),
              
              AppSizes.gapH16,
              
              // Payment Method Section
              PaymentMethodSection(
                onPaymentMethodChanged: (index) {
                  setState(() => _selectedPaymentMethod = index);
                },
              ),
              
              AppSizes.gapH16,
              
              // Coupon Section
              _buildCouponSection(),
              
              AppSizes.gapH16,
              
              // Order Summary Section
              const OrderSummarySection(),
              
              AppSizes.gapH32,
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomButton(),
      ),
    );
  }

  Widget _buildCouponSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF2EEFF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.percent, color: AppColors.primary, size: 20),
          ),
          AppSizes.gapW12,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Have a coupon code?',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                ),
                Text(
                  'Apply to get exciting discounts!',
                  style: TextStyle(color: Colors.grey, fontSize: 9),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE1D5FF),
              foregroundColor: AppColors.primary,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: AppColors.primary, width: 0.5),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('Apply Coupon', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                SizedBox(width: 4),
                Icon(Icons.chevron_right, size: 14),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButton() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: ElevatedButton(
        onPressed: () {
          _showConfirmationDialog(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
        ),
        child: const Text(
          'Proceed to checkout',
          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showAppConfirmationDialog(
      context,
      title: 'Confirm Order',
      message: 'Are you sure you want to place this order?',
      confirmText: 'Place Order',
      icon: Icons.check_circle_outline,
      iconColor: AppColors.accentSuccess,
      onConfirm: () {
        _handleCheckout();
      },
    );
  }

  void _handleCheckout() {
    final authState = context.read<AuthBloc>().state;
    final cartState = context.read<CartBloc>().state;

    if (authState is! Authenticated) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please login to place an order')),
      );
      return;
    }

    if (cartState is! CartLoaded || cartState.cart.items.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Your cart is empty')),
      );
      return;
    }

    if (_selectedPaymentMethod == 0) {
      // COD
      if (_deliveryAddress == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a delivery address')),
        );
        return;
      }

      final details = cartState.cart.items.map((item) {
        return {
          'productId': item.productId,
          'quantity': item.quantity,
          'unitPrice': item.unitPrice,
          'discountAmount': item.discountAmount,
        };
      }).toList();

      context.read<OrderBloc>().add(
            CreateCODOrderEvent(
              customerId: authState.user.userId,
              voucherTypeId: 1,
              createdBy: authState.user.userId,
              remarks: 'Order placed from mobile app',
              delivery: _deliveryAddress!,
              details: details,
            ),
          );
    } else {
      // Online payment (eSewa/Khalti) - To be implemented
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Online payment integration coming soon')),
      );
    }
  }
}
