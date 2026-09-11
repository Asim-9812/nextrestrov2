import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import 'reset_password_page.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/widgets/app_logo.dart';
import '../widgets/auth_text_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is ForgotPasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Reset link sent to ${state.email}'),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
            ),
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResetPasswordPage(email: state.email),
            ),
          );
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF0F7FC),
        body: Stack(
          children: [
            ..._buildBackgroundWaves(size),
            ..._buildBackgroundPattern(),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  AppSizes.gapH24,
                  AppSizes.gapH24,
                  const Center(
                    child: Hero(
                      tag: 'appLogo',
                      child: AppLogo(size: 45, pawColor: AppColors.white,),
                    ),
                  ),
                  AppSizes.gapH24,
                  AppSizes.gapH24,

                  FadeInUp(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: AppColors.primarySoft,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/images/icons/lockPWicon.png',
                                width: 80,
                                height: 80,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          AppSizes.gapH24,

                          Text(
                            'Forgot Password?',
                            style: AppTextStyles.h2.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          AppSizes.gapH12,
                          Text(
                            'No worries! Enter your email and we\'ll send you a link to reset your password',
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.textSecondary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          AppSizes.gapH32,

                          AuthTextField(
                            controller: _emailController,
                            hintText: 'Email address',
                            icon: Icons.email_outlined,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          AppSizes.gapH24,

                          SizedBox(
                            width: double.infinity,
                            child: BlocBuilder<AuthBloc, AuthState>(
                              builder: (context, state) {
                                return ElevatedButton(
                                  onPressed: state is AuthLoading
                                      ? null
                                      : () {
                                          if (_emailController.text.isNotEmpty) {
                                            context.read<AuthBloc>().add(ForgotPasswordEvent(_emailController.text));
                                          } else {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              const SnackBar(
                                                content: Text('Please enter your email'),
                                                backgroundColor: Colors.orange,
                                                behavior: SnackBarBehavior.floating,
                                              ),
                                            );
                                          }
                                        },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primary,
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    elevation: 0,
                                  ),
                                  child: state is AuthLoading
                                      ? const SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                                        )
                                      : Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'Send Reset Link',
                                              style: TextStyle(
                                                color: AppColors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            AppSizes.gapW8,
                                            const Icon(
                                              FontAwesomeIcons.arrowRight,
                                              color: AppColors.white,
                                              size: 16,
                                            ),
                                          ],
                                        ),
                                );
                              },
                            ),
                          ),
                          AppSizes.gapH24,

                          Row(
                            children: [
                              const Expanded(child: Divider(color: AppColors.textPlaceholder)),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  'OR',
                                  style: AppTextStyles.bodySmall.copyWith(
                                    color: AppColors.textPrimary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const Expanded(child: Divider(color: AppColors.textPlaceholder)),
                            ],
                          ),
                          AppSizes.gapH24,

                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                side: const BorderSide(color: AppColors.textPlaceholder),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    FontAwesomeIcons.phone,
                                    color: AppColors.primary,
                                    size: 16,
                                  ),
                                  AppSizes.gapW12,
                                  Text(
                                    'Reset using Phone Number',
                                    style: AppTextStyles.bodyMedium.copyWith(
                                      color: AppColors.textPrimary,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          AppSizes.gapH32,

                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  FontAwesomeIcons.arrowLeft,
                                  color: AppColors.primary,
                                  size: 14,
                                ),
                                AppSizes.gapW8,
                                Text(
                                  'Back to Login',
                                  style: AppTextStyles.bodyMedium.copyWith(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  AppSizes.gapH24,
                  AppSizes.gapH24,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildBackgroundWaves(Size size) {
    return [
      Positioned(
        top: 100,
        left: 0,
        right: 0,
        bottom: 0,
        child: CustomPaint(
          painter: _SweepingWavePainter(),
        ),
      ),
    ];
  }

  List<Widget> _buildBackgroundPattern() {
    return [
      _PositionedIcon(top: 80, left: 30, icon: FontAwesomeIcons.paw, size: 25),
      _PositionedIcon(top: 150, left: 10, icon: FontAwesomeIcons.paw, size: 20),
      _PositionedIcon(top: 50, right: 30, icon: FontAwesomeIcons.bone, size: 30, angle: 0.5),
      _PositionedIcon(top: 200, right: 10, icon: FontAwesomeIcons.bone, size: 20, angle: -0.5),
      _PositionedIcon(bottom: 20, left: 30, icon: Icons.sports_tennis, size: 25),
      _PositionedIcon(bottom: 10, right: 20, icon: FontAwesomeIcons.heart, size: 25),
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
        opacity: 0.05,
        child: Transform.rotate(
          angle: angle,
          child: Icon(icon, size: size, color: AppColors.primary),
        ),
      ),
    );
  }
}

class _SweepingWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary.withOpacity(0.2)
      ..style = PaintingStyle.fill;

    final path = Path();
    const waveHeight = 200.0;
    path.moveTo(0, waveHeight * 0.4);
    
    path.cubicTo(
      size.width * 0.35, -waveHeight * 0.1, 
      size.width * 0.65, waveHeight * 1.5,
      size.width, waveHeight * 1.0
    );
    
    path.lineTo(size.width, size.height*2);
    path.lineTo(-100, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
