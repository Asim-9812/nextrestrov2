import 'dart:math';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:divinepets/core/constants/app_colors.dart';
import 'package:divinepets/core/constants/app_sizes.dart';
import 'package:divinepets/core/constants/app_text_styles.dart';
import 'package:divinepets/features/dashboard/presentation/pages/main_navigation_page.dart';
import 'package:intl/intl.dart';
import '../../../order/domain/entities/cod_order_response_entity.dart';

class ThankYouPage extends StatelessWidget {
  final CODOrderResponseEntity? orderResponse;
  const ThankYouPage({super.key, this.orderResponse});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F3FF),
      body: Stack(
        children: [
          // Static Background Particles
          const Positioned.fill(
            child: StaticParticlesBackground(),
          ),

          // Main Content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  
                  // Animated Checkmark
                  ZoomIn(
                    duration: const Duration(milliseconds: 600),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.check, color: Colors.white, size: 50),
                        ),
                      ),
                    ),
                  ),
                  
                  AppSizes.gapH24,
                  
                  FadeInDown(
                    delay: const Duration(milliseconds: 400),
                    child: Text(
                      'Thank You!',
                      style: AppTextStyles.h1.copyWith(
                        fontWeight: FontWeight.w900, 
                        fontSize: 28,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  
                  AppSizes.gapH16,
                  
                  FadeInUp(
                    delay: const Duration(milliseconds: 600),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: AppTextStyles.bodyLarge.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
                        children: [
                          const TextSpan(text: 'Your order has been\n'),
                          TextSpan(
                            text: 'placed successfully',
                            style: TextStyle(color: AppColors.primary),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  AppSizes.gapH32,
                  
                  // Order Info Card
                  FadeInRight(
                    delay: const Duration(milliseconds: 800),
                    child: _buildInfoCard(
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            _buildOrderInfoItem(
                              icon: Icons.shopping_bag_outlined,
                              label: 'Order Number',
                              value: orderResponse?.transactionReference ?? 'N/A',
                              showCopy: true,
                            ),
                            const VerticalDivider(color: Colors.grey, thickness: 0.2, indent: 5, endIndent: 5),
                            _buildOrderInfoItem(
                              icon: Icons.calendar_today_outlined,
                              label: 'Order Date',
                              value: DateFormat('MMM dd, yyyy hh:mm a').format(DateTime.now()),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  
                  AppSizes.gapH16,
                  
                  // Delivery Card
                  FadeInLeft(
                    delay: const Duration(milliseconds: 1000),
                    child: _buildInfoCard(
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.local_shipping_outlined, color: AppColors.primary, size: 20),
                          ),
                          AppSizes.gapW12,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Estimated Delivery', style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w500)),
                                Text('May 26 - May 28, 2026', style: AppTextStyles.bodySmall.copyWith(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          const Text('1 - 3 days', style: TextStyle(color: AppColors.accentSuccess, fontWeight: FontWeight.bold, fontSize: 13)),
                        ],
                      ),
                    ),
                  ),
                  
                  AppSizes.gapH16,
                  
                  // What's Next Section
                  FadeInUp(
                    delay: const Duration(milliseconds: 1200),
                    child: _buildInfoCard(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("What's Next?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                          AppSizes.gapH24,
                          _buildTrackingProgress(),
                          AppSizes.gapH32,
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () => Navigator.pushAndRemoveUntil(
                                    context, 
                                    MaterialPageRoute(builder: (_) => const MainNavigationPage()), 
                                    (route) => false
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(vertical: 14),
                                    side: BorderSide(color: AppColors.primary.withOpacity(0.2)),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                  ),
                                  child: const Text('Continue Shopping', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 12)),
                                ),
                              ),
                              AppSizes.gapW16,
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () => Navigator.pushAndRemoveUntil(
                                    context, 
                                    MaterialPageRoute(builder: (_) => const MainNavigationPage()), 
                                    (route) => false
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primary,
                                    padding: const EdgeInsets.symmetric(vertical: 14),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                    elevation: 0,
                                  ),
                                  child: const Text('Go to home', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 12)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({required Widget child, EdgeInsets? padding}) {
    return Container(
      padding: padding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primary.withOpacity(0.05)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildOrderInfoItem({
    required IconData icon,
    required String label,
    required String value,
    bool showCopy = false,
  }) {
    return Expanded(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: AppColors.primary, size: 20),
          ),
          AppSizes.gapW12,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(label, style: const TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w500)),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        value, 
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: AppColors.primary),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (showCopy) ...[
                      const SizedBox(width: 4),
                      Icon(Icons.copy, size: 12, color: Colors.grey.shade400),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrackingProgress() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTrackingStep(icon: Icons.check, label: 'Order\nConfirmed', isActive: true),
        _buildDotLine(),
        _buildTrackingStep(icon: Icons.inventory_2, label: 'Processing', isActive: false),
        _buildDotLine(),
        _buildTrackingStep(icon: Icons.local_shipping, label: 'On the way', isActive: false),
        _buildDotLine(),
        _buildTrackingStep(icon: Icons.home, label: 'Delivered', isActive: false),
      ],
    );
  }

  Widget _buildTrackingStep({required IconData icon, required String label, bool isActive = false}) {
    return Column(
      children: [
        Container(
          height: 38,
          width: 38,
          decoration: BoxDecoration(
            color: isActive ? AppColors.accentSuccess : AppColors.primary.withOpacity(0.08),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: isActive ? Colors.white : AppColors.primary, size: 18),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 9,
            fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
            color: isActive ? Colors.black : Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Widget _buildDotLine() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          children: List.generate(5, (index) => Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              height: 1.5,
              color: Colors.grey.shade300,
            ),
          )),
        ),
      ),
    );
  }
}

class StaticParticlesBackground extends StatelessWidget {
  const StaticParticlesBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ParticlesPainter(),
    );
  }
}

class ParticlesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final random = Random(42); // Seed for consistency
    final colors = [
      AppColors.primary,
      Colors.orange,
      Colors.pink,
      Colors.blue,
      Colors.green,
      Colors.yellow,
    ];

    for (int i = 0; i < 40; i++) {
      final color = colors[random.nextInt(colors.length)].withOpacity(0.3);
      final paint = Paint()..color = color;
      
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final particleSize = random.nextDouble() * 6 + 2;

      if (random.nextBool()) {
        // Draw square
        canvas.drawRect(
          Rect.fromLTWH(x, y, particleSize, particleSize),
          paint,
        );
      } else {
        // Draw dot
        canvas.drawCircle(Offset(x, y), particleSize / 2, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
