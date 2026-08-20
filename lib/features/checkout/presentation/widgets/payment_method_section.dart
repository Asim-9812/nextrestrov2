import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';

class PaymentMethodSection extends StatefulWidget {
  final Function(int) onPaymentMethodChanged;
  const PaymentMethodSection({super.key, required this.onPaymentMethodChanged});

  @override
  State<PaymentMethodSection> createState() => _PaymentMethodSectionState();
}

class _PaymentMethodSectionState extends State<PaymentMethodSection> {
  int _selectedMethodIndex = 0; // 0: COD, 1: eSewa, 2: Khalti

  @override
  void initState() {
    super.initState();
    // Report initial selection
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onPaymentMethodChanged(_selectedMethodIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.payment, color: AppColors.primary, size: 20),
              SizedBox(width: 8),
              Text(
                'Payment Method',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.primary),
              ),
            ],
          ),
          AppSizes.gapH16,
          _buildPaymentTile(
            index: 0,
            title: 'Cash on delivery',
            description: 'Pay in cash when you receive your order',
            icon: Icons.payments,
            iconColor: AppColors.accentSuccess,
          ),
          _buildPaymentTile(
            index: 1,
            title: 'eSewa',
            description: 'Pay with your eSewa account',
            imagePath: 'assets/images/dashboard_assets/esewa_logo.png', // Assuming logo exists or use generic
            useIcon: false,
          ),
          _buildPaymentTile(
            index: 2,
            title: 'Khalti',
            description: 'Pay with your khalti account',
            imagePath: 'assets/images/dashboard_assets/khalti_logo.png', // Assuming logo exists
            useIcon: false,
          ),
          
          AppSizes.gapH8,
          
          Center(
            child: InkWell(
              onTap: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('See more', style: TextStyle(color: AppColors.primary, fontSize: 11, fontWeight: FontWeight.w600)),
                  Icon(Icons.keyboard_arrow_down, color: AppColors.primary, size: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentTile({
    required int index,
    required String title,
    required String description,
    IconData? icon,
    Color? iconColor,
    String? imagePath,
    bool useIcon = true,
  }) {
    final isSelected = _selectedMethodIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() => _selectedMethodIndex = index);
        widget.onPaymentMethodChanged(index);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF7F8FA) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? AppColors.primary.withOpacity(0.1) : Colors.grey.shade100),
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: AppColors.primary,
              size: 18,
            ),
            AppSizes.gapW12,
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade100),
              ),
              child: useIcon 
                ? Icon(icon, color: iconColor, size: 20)
                : (imagePath != null 
                    ? Image.asset(imagePath, height: 20, width: 20, errorBuilder: (_, __, ___) => const Icon(Icons.account_balance_wallet, size: 20, color: AppColors.primary))
                    : const Icon(Icons.account_balance_wallet, size: 20)),
            ),
            AppSizes.gapW12,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                  Text(description, style: const TextStyle(color: Colors.grey, fontSize: 10)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
