import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../dashboard/presentation/pages/main_navigation_page.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import 'forgot_password_page.dart';
import 'sign_up_page.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/widgets/app_logo.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/social_login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordObscure = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MainNavigationPage()),
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
        backgroundColor: const Color(0xFFF7F3FF),
        body: Stack(
          children: [
            // 1. Background Waves (Bottom Layer)
            ..._buildBackgroundWaves(size),

            // 2. Background Pattern Icons
            ..._buildBackgroundPattern(),

            // 4. Main Scrollable Content
            LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: size.height * 0.08),

                        // Logo and Tagline
                        Center(
                          child: Column(
                            children: [
                              const Hero(
                                tag: 'appLogo',
                                child: AppLogo(
                                  size: 180,
                                ),
                              ),
                              AppSizes.gapH8,
                              FadeInDown(
                                child: Column(
                                  children: [
                                    Text(
                                      'Everything your pet needs',
                                      style: AppTextStyles.bodyMedium.copyWith(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      'all in one place',
                                      style: AppTextStyles.bodyMedium.copyWith(
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

                        AppSizes.gapH24,

                        // Pets Illustration and Login Form Card with Precise Overlap
                        Stack(
                          alignment: Alignment.topCenter,
                          clipBehavior: Clip.none,
                          children: [
                            // Login Form Card
                            Container(
                              margin: const EdgeInsets.only(top: 155),
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                              decoration: const BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  FadeInUp(
                                    child: Column(
                                      children: [
                                        Text(
                                          'Welcome back!',
                                          style: AppTextStyles.h2.copyWith(
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        AppSizes.gapH4,
                                        Text(
                                          'Login to continue to your account',
                                          style: AppTextStyles.bodyLarge.copyWith(
                                            color: AppColors.textPrimary,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  AppSizes.gapH32,

                                  // Input Fields
                                  FadeInUp(
                                    delay: const Duration(milliseconds: 200),
                                    child: Column(
                                      children: [
                                        AuthTextField(
                                          controller: _usernameController,
                                          hintText: 'Username',
                                          icon: Icons.person_outline,
                                          keyboardType: TextInputType.emailAddress,
                                        ),
                                        AppSizes.gapH16,
                                        AuthTextField(
                                          controller: _passwordController,
                                          hintText: 'Password',
                                          icon: Icons.lock_outline,
                                          isPassword: true,
                                          obscureText: _isPasswordObscure,
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              _isPasswordObscure ? Icons.visibility_off : Icons.visibility,
                                              color: AppColors.textTertiary,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _isPasswordObscure = !_isPasswordObscure;
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Forgot Password
                                  FadeInUp(
                                    delay: const Duration(milliseconds: 300),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => const ForgotPasswordPage(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'Forgot password?',
                                          style: AppTextStyles.bodyMedium.copyWith(
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  AppSizes.gapH8,

                                  // Login Button
                                  FadeInUp(
                                    delay: const Duration(milliseconds: 400),
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: BlocBuilder<AuthBloc, AuthState>(
                                        builder: (context, state) {
                                          return ElevatedButton(
                                            onPressed: state is AuthLoading
                                                ? null
                                                : () {
                                                    if (_usernameController.text.isNotEmpty &&
                                                        _passwordController.text.isNotEmpty) {
                                                      context.read<AuthBloc>().add(
                                                            LoginEvent(
                                                              username: _usernameController.text,
                                                              password: _passwordController.text,
                                                            ),
                                                          );
                                                    } else {
                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                        const SnackBar(
                                                          content: Text('Please enter credentials'),
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
                                            ),
                                            child: state is AuthLoading
                                                ? const SizedBox(
                                                    height: 20,
                                                    width: 20,
                                                    child: CircularProgressIndicator(
                                                      color: Colors.white,
                                                      strokeWidth: 2,
                                                    ),
                                                  )
                                                : const Text(
                                                    'Login',
                                                    style: TextStyle(
                                                      color: AppColors.white,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),

                                  AppSizes.gapH24,

                                // OR Divider
                                FadeInUp(
                                  delay: const Duration(milliseconds: 500),
                                  child: Row(
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
                                ),

                                AppSizes.gapH24,

                                // Social Login
                                FadeInUp(
                                  delay: const Duration(milliseconds: 600),
                                  child: Row(
                                    children: [
                                      SocialLoginButton(
                                        text: 'Continue with google',
                                        icon: FontAwesomeIcons.google,
                                        onPressed: () {},
                                      ),
                                      AppSizes.gapW16,
                                      SocialLoginButton(
                                        text: 'Continue with apple',
                                        icon: FontAwesomeIcons.apple,
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ),

                                AppSizes.gapH32,

                                // Sign Up Footer
                                FadeInUp(
                                  delay: const Duration(milliseconds: 700),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Don't have an account? ",
                                        style: AppTextStyles.bodyMedium.copyWith(
                                          color: AppColors.textPrimary,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => const SignUpPage(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'Sign Up',
                                          style: AppTextStyles.bodyMedium.copyWith(
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                AppSizes.gapH32,
                                AppSizes.gapH32,
                                AppSizes.gapH32,
                              ],
                            ),
                          ),

                          // Pets Illustration
                          Positioned(
                            top: 0,
                            child: FadeIn(
                              duration: const Duration(milliseconds: 1000),
                              child: Hero(
                                tag: 'petsIllustration',
                                child: Image.asset(
                                  'assets/images/pets.png',
                                  height: 180,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],

      ),
    ));
  }

  List<Widget> _buildBackgroundWaves(Size size) {
    return [
      Positioned(
        top: 150, // Positioned behind the pets illustration
        left: 0,
        right: 0,
        bottom: 0, // Fill all the way to the bottom
        child: FadeIn(
          delay: Duration(milliseconds: 500),
          child: CustomPaint(
            painter: _PetWavePainter(),
          ),
        ),
      ),
    ];
  }

  List<Widget> _buildBackgroundPattern() {
    return [
      _PositionedIcon(top: 100, left: 30, icon: FontAwesomeIcons.paw, size: 25),
      _PositionedIcon(top: 150, right: 30, icon: FontAwesomeIcons.paw, size: 20),
      _PositionedIcon(top: 50, right: 100, icon: FontAwesomeIcons.paw, size: 15),
      _PositionedIcon(top: 350, right: 50, icon: FontAwesomeIcons.bone, size: 30, angle: 0.8),
      _PositionedIcon(top: 150, left: 120, icon: Icons.sports_tennis, size: 20),
      _PositionedIcon(top: 400, left: 80, icon: FontAwesomeIcons.heart, size: 25),
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

class _PetWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    final path = Path();
    // We want the wave to be at the top of this container
    const waveHeight = 150.0;
    path.moveTo(0, waveHeight * 0.6);
    
    path.cubicTo(
      size.width * 0.35, -waveHeight * 0.2, 
      size.width * 0.65, waveHeight * 1.8,
      size.width, waveHeight * 1.2
    );
    
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
