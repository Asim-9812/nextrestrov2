import 'package:flutter/material.dart';
import 'package:divinepets/core/constants/app_colors.dart';
import 'package:divinepets/core/constants/app_sizes.dart';
import 'package:divinepets/core/constants/app_text_styles.dart';
import '../widgets/order_summary_info.dart';
import '../widgets/tracking_status_card.dart';
import '../widgets/billing_details_card.dart';
import '../widgets/delivery_details_card.dart';
import '../widgets/help_support_card.dart';

class OrderTrackingPage extends StatelessWidget {
  const OrderTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Order',
          style: AppTextStyles.h2.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w900,
            fontSize: 24,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.headset_mic_outlined, color: AppColors.primary, size: 28),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              'Track and view your order status',
              style: TextStyle(color: Colors.black87, fontSize: 14, fontWeight: FontWeight.w500),
            ),
            AppSizes.gapH24,
            
            const OrderSummaryInfo(),
            AppSizes.gapH24,
            
            const TrackingStatusCard(),
            AppSizes.gapH24,
            
            const BillingDetailsCard(),
            AppSizes.gapH24,
            
            const DeliveryDetailsCard(),
            AppSizes.gapH24,
            
            const HelpSupportCard(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
