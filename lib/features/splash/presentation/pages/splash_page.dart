import 'package:animate_do/animate_do.dart';
import 'package:divinepets/features/auth/presentation/pages/login_page.dart';
import 'package:divinepets/features/dashboard/presentation/pages/main_navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/widgets/app_logo.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_state.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
  }

  void _handleNavigation(AuthState state) async {
    await Future.delayed(const Duration(milliseconds: 3000));
    if (!mounted) return;

    if (state is Authenticated) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const MainNavigationPage()),
      );
    } else if (state is Unauthenticated || state is AuthError) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated || state is Unauthenticated || state is AuthError) {
          _handleNavigation(state);
        }
      },
      child: Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFF7F3FF),
                  AppColors.white,
                  Color(0xFFF7F3FF),
                ],
              ),
            ),
          ),
          
          // Background Pattern Icons
          ..._buildBackgroundPattern(),

          // Centered Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeInDown(
                  duration: const Duration(milliseconds: 800),
                  child: const Hero(
                    tag: 'appLogo',
                    child: AppLogo(
                      size: 60,
                      pawColor: AppColors.white,
                    ),
                  ),
                ),
                AppSizes.gapH24,
                
                // Divider with Paw
                FadeIn(
                  delay: const Duration(milliseconds: 500),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60.0),
                    child: Row(
                      children: [
                        const Expanded(child: Divider(color: AppColors.textPlaceholder, thickness: 1)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: BounceInDown(
                            delay: const Duration(milliseconds: 1000),
                            child: const Icon(
                              FontAwesomeIcons.paw,
                              color: Color(0xFFFF782C), // Orange paw
                              size: 20,
                            ),
                          ),
                        ),
                        const Expanded(child: Divider(color: AppColors.textPlaceholder, thickness: 1)),
                      ],
                    ),
                  ),
                ),
                
                AppSizes.gapH24,
                
                // Subtext
                FadeInUp(
                  delay: const Duration(milliseconds: 1200),
                  child: Column(
                    children: [
                      Text(
                        'Everything your pet needs',
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'all in one place',
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),);
  }

  List<Widget> _buildBackgroundPattern() {
    return [
      _PositionedIcon(top: 100, left: 50, icon: FontAwesomeIcons.paw, size: 30),
      _PositionedIcon(top: 150, right: 40, icon: FontAwesomeIcons.heart, size: 25),
      _PositionedIcon(top: 250, left: 100, icon: FontAwesomeIcons.bone, size: 40, angle: 0.5),
      _PositionedIcon(bottom: 150, right: 60, icon: FontAwesomeIcons.paw, size: 25, angle: -0.2),
      _PositionedIcon(bottom: 250, left: 40, icon: FontAwesomeIcons.heart, size: 20),
      _PositionedIcon(top: 400, left: 30, icon: Icons.sports_tennis, size: 35, angle: 0.8),
      _PositionedIcon(bottom: 400, right: 40, icon: FontAwesomeIcons.bone, size: 30, angle: -0.5),
      _PositionedIcon(bottom: 100, left: 120, icon: Icons.sports_tennis, size: 25),
    ];
  }
}

class _PositionedIcon extends StatelessWidget {
  final double? top, bottom, left, right;
  final IconData icon;
  final double size;
  final double angle;

  const _PositionedIcon({
    this.top,
    this.bottom,
    this.left,
    this.right,
    required this.icon,
    required this.size,
    this.angle = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Opacity(
        opacity: 0.05, // Very faint as in the image
        child: Transform.rotate(
          angle: angle,
          child: Icon(icon, size: size, color: AppColors.primary),
        ),
      ),
    );
  }
}
