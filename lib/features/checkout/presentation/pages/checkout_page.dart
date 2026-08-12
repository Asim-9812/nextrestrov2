import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../widgets/address_section.dart';
import '../widgets/delivery_details_section.dart';
import '../widgets/payment_method_section.dart';
import '../widgets/order_summary_section.dart';
import '../../../../core/widgets/app_confirmation_dialog.dart';
import 'thank_you_page.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Checkout', style: AppTextStyles.h2.copyWith(color: AppColors.primary)),
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
            
            // Billing Address Section
            const AddressSection(
              title: 'Billing Address',
              icon: Icons.location_on,
            ),
            
            AppSizes.gapH16,
            
            // Delivery Address Section
            const AddressSection(
              title: 'Delivery Address',
              icon: Icons.location_on,
            ),
            
            AppSizes.gapH16,
            
            // Delivery Details Section
            const DeliveryDetailsSection(),
            
            AppSizes.gapH16,
            
            // Payment Method Section
            const PaymentMethodSection(),
            
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ThankYouPage()),
        );
      },
    );
  }
}
