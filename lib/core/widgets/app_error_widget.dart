import 'dart:math';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import '../constants/app_text_styles.dart';
import '../../features/dashboard/presentation/pages/main_navigation_page.dart';

class AppErrorWidget extends StatelessWidget {
  final String? title;
  final String? message;
  final VoidCallback? onTryAgain;
  final VoidCallback? onGoHome;

  const AppErrorWidget({
    super.key,
    this.title,
    this.message,
    this.onTryAgain,
    this.onGoHome,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F3FF), // Light purple background
      body: Stack(
        children: [
          // Background Decorative Icons (Improved Grid-based Distribution)
          const Positioned.fill(child: _BackgroundPattern()),
          
          // Back Button
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.primary, size: 28),
              onPressed: () => Navigator.pop(context),
            ),
          ),

          // Main Content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Error Icon
                  ZoomIn(
                    duration: const Duration(milliseconds: 500),
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.3),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.warning_rounded,
                        color: Colors.white,
                        size: 60,
                      ),
                    ),
                  ),
                  
                  AppSizes.gapH32,
                  
                  // Title
                  FadeInDown(
                    delay: const Duration(milliseconds: 200),
                    child: Text(
                      title ?? 'Oops! Something went wrong',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.h3.copyWith(
                        fontWeight: FontWeight.w900,
                        fontSize: 22,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  
                  AppSizes.gapH16,
                  
                  // Message
                  FadeInUp(
                    delay: const Duration(milliseconds: 400),
                    child: Text(
                      message ?? "We're having trouble loading this page. Please check your internet connection and try again.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 13,
                        height: 1.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  
                  AppSizes.gapH24,
                  
                  // Tiny Paw Icon
                  FadeIn(
                    delay: const Duration(milliseconds: 600),
                    child: const Icon(
                      FontAwesomeIcons.paw,
                      color: AppColors.primary,
                      size: 24,
                    ),
                  ),
                  
                  AppSizes.gapH24,
                  AppSizes.gapH24,

                  // Buttons
                  FadeInUp(
                    delay: const Duration(milliseconds: 800),
                    child: Column(
                      children: [
                        // Try Again Button (Fixed Color & Logic)
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: onGoHome ?? () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => const MainNavigationPage()),
                                    (route) => false,
                              );
                            },
                            icon: const Icon(Icons.refresh_rounded, size: 20),
                            label: const Text('Try Again'),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: AppColors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              side: BorderSide(color: Colors.grey.shade200),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 0,
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 16),
                        
                        // Go Home Button
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            onPressed: onGoHome ?? () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => const MainNavigationPage()),
                                (route) => false,
                              );
                            },
                            icon: const Icon(Icons.home_rounded, size: 20),
                            label: const Text('Go to home'),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: AppColors.primary,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              side: BorderSide(color: Colors.grey.shade200),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BackgroundPattern extends StatelessWidget {
  const _BackgroundPattern();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final random = Random(42);
        final icons = [
          FontAwesomeIcons.paw,
          FontAwesomeIcons.heart,
          Icons.sports_baseball,
          FontAwesomeIcons.bone,
        ];
        
        const int rows = 5;
        const int cols = 3;
        final double cellWidth = constraints.maxWidth / cols;
        final double cellHeight = constraints.maxHeight / rows;
        
        List<Widget> patternItems = [];
        
        // Let's use a generation loop that ensures separation
        for (int r = 0; r < rows; r++) {
          for (int c = 0; c < cols; c++) {
            final icon = icons[random.nextInt(icons.length)];
            final size = random.nextDouble() * 30 + 30;
            final opacity = random.nextDouble() * 0.04 + 0.04;
            final rotation = random.nextDouble() * pi;
            
            // Jitter within the cell to keep it "random" but "separate"
            final left = (c * cellWidth) + (random.nextDouble() * (cellWidth - size));
            final top = (r * cellHeight) + (random.nextDouble() * (cellHeight - size));
            
            patternItems.add(
              Positioned(
                left: left,
                top: top,
                child: Transform.rotate(
                  angle: rotation,
                  child: Opacity(
                    opacity: opacity,
                    child: Icon(icon, size: size, color: AppColors.primary),
                  ),
                ),
              ),
            );
          }
        }
        
        return Stack(children: patternItems);
      },
    );
  }
}
