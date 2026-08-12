import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class NewArrivalsBanner extends StatelessWidget {
  const NewArrivalsBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double screenWidth = constraints.maxWidth;
        // Responsive sizing
        final double titleFontSize = (screenWidth * 0.08).clamp(24.0, 32.0);
        final double bagHeight = (screenWidth * 0.35).clamp(100.0, 150.0);

        return Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 20),
          color: AppColors.white,
          child: Stack(
            children: [

              Container(
                color: AppColors.secondaryVariant,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16,left: 16, top: 36, bottom: 56),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: AppTextStyles.h1.copyWith(
                                  fontSize: titleFontSize,
                                  fontWeight: FontWeight.w900,
                                  height: 1.0,
                                ),
                                children: [
                                  const TextSpan(text: 'New\n', style: TextStyle(color: Colors.white)),
                                  const TextSpan(text: 'Arrivals', style: TextStyle(color: Color(0xFF4D1F00))),
                                ],
                              ),
                            ),
                            // const SizedBox(height: 4),
                            Text(
                              'Fresh products your pets\nwill love!',
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: Colors.white,
                                fontSize: (screenWidth * 0.03).clamp(10.0, 12.0),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF4D1F00),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                elevation: 0,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'View all products',
                                    style: AppTextStyles.button.copyWith(
                                      fontSize: (screenWidth * 0.025).clamp(9.0, 11.0),
                                      color: Colors.white
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  const Icon(Icons.arrow_forward, color: Colors.white, size: 12),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Image.asset(
                          'assets/images/dashboard_assets/prodstack.png',
                          height: bagHeight,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Top Wave
              Positioned(
                top: -1,
                left: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/dashboard_assets/wv5.png',
                  fit: BoxFit.fitWidth,
                  color: Colors.white,
                ),
              ),
              // Bottom Wave
              Positioned(
                bottom: -1,
                left: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/dashboard_assets/wv6.png',
                  fit: BoxFit.fitWidth,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
