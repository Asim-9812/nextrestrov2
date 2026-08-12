import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';

class DashboardMainBanner extends StatelessWidget {
  const DashboardMainBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bannerWidth = constraints.maxWidth;
        // Balance the pup size - Responsive to resolution
        final pupWidth = (bannerWidth * 0.4).clamp(120.0, 180.0);

        return Container(
          height: 220,
          width: double.infinity,
          color: Colors.white,
          child: Stack(
            children: [
              // Banner Purple Background
              Positioned.fill(
                child: Container(
                  color: const Color(0xFFE1D5FF).withOpacity(0.8),
                ),
              ),
              // Content - Increased left padding to center the group better
              Padding(
                padding: const EdgeInsets.only(left: 35, right: 0, top: 30, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          'PAMPER YOUR PET',
                          style: AppTextStyles.bodySmall.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                            fontSize: 11,
                          ),
                        ),
                        AppSizes.gapW4,
                        const Icon(FontAwesomeIcons.paw, size: 11, color: AppColors.primary),
                      ],
                    ),
                    // AppSizes.gapH12,
                    RichText(
                      text: TextSpan(
                        style: AppTextStyles.h2.copyWith(
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                          fontSize: 20,
                        ),
                        children: [
                          const TextSpan(text: 'Extra '),
                          TextSpan(text: '15% OFF', style: TextStyle(color: Colors.orange.shade800)),
                        ],
                      ),
                    ),
                    // AppSizes.gapH4,
                    SizedBox(
                      width: bannerWidth * 0.5,
                      child: Text(
                        'on All Puppy & Kitten Products',
                        style: AppTextStyles.bodyLarge.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    AppSizes.gapH12,
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                        elevation: 0,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Shop Now',
                            style: AppTextStyles.button.copyWith(fontSize: 13),
                          ),
                          AppSizes.gapW8,
                          const Icon(Icons.arrow_forward, color: Colors.white, size: 15),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Pet Image (Behind the waves)
              Positioned(
                right: 5,
                bottom: 5,
                child: Image.asset(
                  'assets/images/dashboard_assets/pup.png',
                  width: pupWidth,
                  fit: BoxFit.contain,
                ),
              ),
              // Top Wave
              Positioned(
                top: -1,
                left: 0,
                right: 0,
                child: SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/dashboard_assets/wv1.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              // Bottom Wave
              Positioned(
                bottom: -1,
                left: 0,
                right: 0,
                child: SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/dashboard_assets/wv2.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
