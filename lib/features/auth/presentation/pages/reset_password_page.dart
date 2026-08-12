import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pinput/pinput.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/widgets/app_logo.dart';
import '../widgets/auth_text_field.dart';

class ResetPasswordPage extends StatefulWidget {
  final String email;
  const ResetPasswordPage({super.key, required this.email});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _isPasswordObscure = true;
  bool _isConfirmPasswordObscure = true;
  int _strengthLevel = 0;
  String _strengthLabel = 'Weak';
  Color _strengthColor = AppColors.accentError;

  @override
  void dispose() {
    _otpController.dispose();
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

      if (password.length >= 8 && types >= 3) {
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

    final defaultPinTheme = PinTheme(
      width: 45,
      height: 55,
      textStyle: AppTextStyles.h2.copyWith(color: AppColors.primary),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.textPlaceholder),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: AppColors.primary, width: 1.5),
      ),
    );

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Password reset successfully! Please login.'),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
            ),
          );
          Navigator.of(context).popUntil((route) => route.isFirst);
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
            ..._buildBackgroundWaves(size),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  AppSizes.gapH24,
                  AppSizes.gapH24,
                  const Center(
                    child: Hero(
                      tag: 'appLogo',
                      child: AppLogo(size: 45, pawColor: AppColors.white),
                    ),
                  ),
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
                          Text(
                            'Reset Password',
                            style: AppTextStyles.h2.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          AppSizes.gapH12,
                          Text(
                            'Create a new password for ${widget.email}',
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.textSecondary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          AppSizes.gapH32,

                          Text(
                            'Enter 6-digit code',
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.textSecondary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          AppSizes.gapH4,
                          Text(
                            'We\'ve sent a 6-digit verification code to your email address.',
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.textTertiary,
                              fontSize: 11,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          AppSizes.gapH16,
                          Pinput(
                            length: 6,
                            controller: _otpController,
                            defaultPinTheme: defaultPinTheme,
                            focusedPinTheme: focusedPinTheme,
                          ),
                          AppSizes.gapH32,

                          AuthTextField(
                            controller: _passwordController,
                            hintText: 'New Password',
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
                          AppSizes.gapH12,

                          Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                                size: 18,
                                color: _strengthLevel >= 4 ? AppColors.accentSuccess : AppColors.textQuaternary,
                              ),
                              AppSizes.gapW8,
                              Expanded(
                                child: Text(
                                  'Use at least 8 characters with a number, uppercase letter and a special character',
                                  style: AppTextStyles.bodySmall.copyWith(
                                    color: AppColors.textSecondary,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          AppSizes.gapH24,

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
                          AppSizes.gapH32,

                          SizedBox(
                            width: double.infinity,
                            child: BlocBuilder<AuthBloc, AuthState>(
                              builder: (context, state) {
                                return ElevatedButton(
                                  onPressed: state is AuthLoading
                                      ? null
                                      : () {
                                          if (_otpController.text.length == 6 &&
                                              _passwordController.text.isNotEmpty &&
                                              _passwordController.text == _confirmPasswordController.text) {
                                            context.read<AuthBloc>().add(
                                                  ResetPasswordEvent(
                                                    email: widget.email,
                                                    otp: _otpController.text,
                                                    newPassword: _passwordController.text,
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
                                              'Reset Password',
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
                          AppSizes.gapH32,

                          GestureDetector(
                            onTap: () => Navigator.of(context).popUntil((route) => route.isFirst),
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
    
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
