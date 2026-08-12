import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../widgets/auth_text_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _isPasswordObscure = true;
  bool _isConfirmPasswordObscure = true;
  bool _agreeToTerms = false;
  int _strengthLevel = 0;
  String _strengthLabel = 'Weak';
  Color _strengthColor = AppColors.accentError;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _checkPasswordStrength(String password) {
    int level = 0;
    if (password.isEmpty) {
      level = 0;
    } else if (password.length < 6) {
      level = 1;
    } else {
      bool hasLowercase = password.contains(RegExp(r'[a-z]'));
      bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
      bool hasDigits = password.contains(RegExp(r'[0-9]'));
      bool hasSpecial = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

      int types = 0;
      if (hasLowercase) types++;
      if (hasUppercase) types++;
      if (hasDigits) types++;
      if (hasSpecial) types++;

      if (password.length >= 10 && types == 4) {
        level = 5;
      } else if (password.length >= 8 && types >= 3) {
        level = 4;
      } else if (types >= 2) {
        level = 3;
      } else {
        level = 2;
      }
    }

    setState(() {
      _strengthLevel = level;
      if (level <= 1) {
        _strengthLabel = 'Weak';
        _strengthColor = AppColors.accentError;
      } else if (level <= 3) {
        _strengthLabel = 'Medium';
        _strengthColor = Colors.orange;
      } else {
        _strengthLabel = 'Strong';
        _strengthColor = AppColors.accentSuccess;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 360;

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Account created successfully! Please login.'),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
            ),
          );
          Navigator.pop(context);
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
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            ..._buildBackgroundWaves(size),
            ..._buildBackgroundPattern(),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSizes.gapH32,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
                          onPressed: () => Navigator.pop(context),
                        ),
                        AppSizes.gapH16,
                        FadeInDown(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Create your',
                                style: AppTextStyles.h2.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              Text(
                                'Divine Pets account',
                                style: AppTextStyles.h1.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.primary,
                                  fontSize: isSmallScreen ? 28 : 32,
                                ),
                              ),
                              AppSizes.gapH8,
                              Text(
                                'Join our pet-loving community and give the best care to your pets.',
                                style: AppTextStyles.bodyMedium.copyWith(
                                  color: AppColors.textSecondary,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                        AppSizes.gapH24,
                        LayoutBuilder(
                          builder: (context, constraints) {
                            final imageWidth = constraints.maxWidth * 0.45;
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      _buildFeatureItem(FontAwesomeIcons.paw, 'Personalized for your pets.'),
                                      AppSizes.gapH12,
                                      _buildFeatureItem(FontAwesomeIcons.tag, 'Exclusive offers & rewards.'),
                                      AppSizes.gapH12,
                                      _buildFeatureItem(FontAwesomeIcons.shieldHalved, '100% Safe & Secure.'),
                                      AppSizes.gapH24,
                                    ],
                                  ),
                                ),
                                FadeInRight(
                                  child: Hero(
                                    tag: 'petsIllustration',
                                    child: Image.asset(
                                      'assets/images/pets.png',
                                      width: imageWidth,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  FadeInUp(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.05),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          AuthTextField(
                            controller: _fullNameController,
                            hintText: 'Full Name',
                            icon: Icons.person_outline,
                            keyboardType: TextInputType.name,
                          ),
                          AppSizes.gapH16,
                          AuthTextField(
                            controller: _emailController,
                            hintText: 'Email address',
                            icon: Icons.email_outlined,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          AppSizes.gapH16,
                          AuthTextField(
                            controller: _phoneController,
                            hintText: 'Phone number',
                            icon: Icons.phone_outlined,
                            keyboardType: TextInputType.phone,
                          ),
                          AppSizes.gapH16,
                          AuthTextField(
                            controller: _passwordController,
                            hintText: 'Password',
                            icon: Icons.lock_outline,
                            isPassword: true,
                            obscureText: _isPasswordObscure,
                            onChanged: _checkPasswordStrength,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordObscure ? Icons.visibility_off : Icons.visibility,
                                color: AppColors.textTertiary,
                              ),
                              onPressed: () => setState(() => _isPasswordObscure = !_isPasswordObscure),
                            ),
                          ),
                          AppSizes.gapH16,
                          AuthTextField(
                            controller: _confirmPasswordController,
                            hintText: 'Confirm password',
                            icon: Icons.lock_outline,
                            isPassword: true,
                            obscureText: _isConfirmPasswordObscure,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isConfirmPasswordObscure ? Icons.visibility_off : Icons.visibility,
                                color: AppColors.textTertiary,
                              ),
                              onPressed: () => setState(() => _isConfirmPasswordObscure = !_isConfirmPasswordObscure),
                            ),
                          ),
                          AppSizes.gapH24,
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.primaryLighter,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.shield_outlined, color: AppColors.primary, size: 18),
                                        AppSizes.gapW8,
                                        Text(
                                          'Password strength',
                                          style: AppTextStyles.bodySmall.copyWith(
                                            color: AppColors.textPrimary,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      _strengthLabel,
                                      style: AppTextStyles.bodySmall.copyWith(
                                        color: _strengthColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                AppSizes.gapH8,
                                Row(
                                  children: List.generate(5, (index) {
                                    return Expanded(
                                      child: Container(
                                        height: 6,
                                        margin: EdgeInsets.only(right: index == 4 ? 0 : 4),
                                        decoration: BoxDecoration(
                                          color: index < _strengthLevel ? _strengthColor : AppColors.textQuaternary,
                                          borderRadius: BorderRadius.circular(3),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ),
                          AppSizes.gapH16,
                          Row(
                            children: [
                              SizedBox(
                                height: 24,
                                width: 24,
                                child: Checkbox(
                                  value: _agreeToTerms,
                                  activeColor: AppColors.primary,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                  onChanged: (value) => setState(() => _agreeToTerms = value ?? false),
                                ),
                              ),
                              AppSizes.gapW12,
                              Expanded(
                                child: Text.rich(
                                  TextSpan(
                                    text: 'I agree to the ',
                                    style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary),
                                    children: [
                                      TextSpan(
                                        text: 'Terms & Conditions',
                                        style: AppTextStyles.bodySmall.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold),
                                      ),
                                      const TextSpan(text: ' and '),
                                      TextSpan(
                                        text: 'Privacy Policy',
                                        style: AppTextStyles.bodySmall.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          AppSizes.gapH24,
                          SizedBox(
                            width: double.infinity,
                            child: BlocBuilder<AuthBloc, AuthState>(
                              builder: (context, state) {
                                return ElevatedButton(
                                  onPressed: (state is AuthLoading || !_agreeToTerms)
                                      ? null
                                      : () {
                                          if (_fullNameController.text.isNotEmpty &&
                                              _emailController.text.isNotEmpty &&
                                              _phoneController.text.isNotEmpty &&
                                              _passwordController.text.isNotEmpty &&
                                              _passwordController.text == _confirmPasswordController.text) {
                                            context.read<AuthBloc>().add(
                                                  RegisterEvent(
                                                    email: _emailController.text,
                                                    password: _passwordController.text,
                                                    fullName: _fullNameController.text,
                                                    phone: _phoneController.text,
                                                  ),
                                                );
                                          } else {
                                            String error = 'Please fill all fields correctly';
                                            if (_passwordController.text != _confirmPasswordController.text) {
                                              error = 'Passwords do not match';
                                            }
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text(error),
                                                backgroundColor: Colors.orange,
                                                behavior: SnackBarBehavior.floating,
                                              ),
                                            );
                                          }
                                        },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primary,
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                    elevation: 0,
                                  ),
                                  child: state is AuthLoading
                                      ? const SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                                        )
                                      : const Text(
                                          'Create Account',
                                          style: TextStyle(color: AppColors.white, fontSize: 18, fontWeight: FontWeight.w600),
                                        ),
                                );
                              },
                            ),
                          ),
                          AppSizes.gapH24,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account? ",
                                style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textPrimary, fontWeight: FontWeight.w500),
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Text(
                                  'Login',
                                  style: AppTextStyles.bodyMedium.copyWith(color: AppColors.primary, fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                          AppSizes.gapH24,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String text) {
    return FadeInLeft(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: AppColors.primarySoft,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(icon, size: 12, color: AppColors.primary),
          ),
          AppSizes.gapW8,
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
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
        child: Opacity(
          opacity: 0.3,
          child: CustomPaint(
            painter: _SignUpWavePainter(),
          ),
        ),
      ),
    ];
  }

  List<Widget> _buildBackgroundPattern() {
    return [
      _PositionedIcon(top: 100, left: 30, icon: FontAwesomeIcons.paw, size: 25),
      _PositionedIcon(top: 150, right: 30, icon: FontAwesomeIcons.paw, size: 20),
      _PositionedIcon(top: 50, right: 100, icon: FontAwesomeIcons.bone, size: 25, angle: 0.5),
      _PositionedIcon(bottom: 50, left: 20, icon: FontAwesomeIcons.paw, size: 30),
      _PositionedIcon(top: 450, right: 20, icon: FontAwesomeIcons.heart, size: 25),
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

class _SignUpWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.fill;

    final path = Path();
    const waveHeight = 300.0;
    path.moveTo(0, waveHeight * 0.8);
    path.cubicTo(
      size.width * -0.005, waveHeight * 1.2,
      size.width * 4, -waveHeight * 1,
      size.width * 3, waveHeight * 1.2,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
