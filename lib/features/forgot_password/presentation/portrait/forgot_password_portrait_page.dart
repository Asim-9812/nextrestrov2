import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/constants/dimensions.dart';
import 'package:nextrestro/core/constants/gap_manager.dart';
import 'package:nextrestro/core/utils/toaster.dart';
import 'package:nextrestro/features/forgot_password/presentation/providers/forgot_password_provider.dart';
import 'package:nextrestro/features/forgot_password/presentation/providers/forgot_password_state.dart';
import 'package:nextrestro/features/forgot_password/presentation/widgets/resend_otp_timer.dart';
import 'package:pinput/pinput.dart';

class ForgotPasswordPortraitPage extends ConsumerStatefulWidget {
  const ForgotPasswordPortraitPage({super.key});

  @override
  ConsumerState<ForgotPasswordPortraitPage> createState() => _ForgotPasswordPortraitPageState();
}

class _ForgotPasswordPortraitPageState extends ConsumerState<ForgotPasswordPortraitPage> {
  final _emailController = TextEditingController();
  final _otpController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _otpController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleSendOtp() {
    if (_formKey.currentState?.validate() ?? false) {
      ref.read(forgotPasswordProvider.notifier).sendOtp(_emailController.text.trim());
    }
  }

  void _handleResetPassword(String email) {
    if (_formKey.currentState?.validate() ?? false) {
      if (_passwordController.text != _confirmPasswordController.text) {
        Toaster.error(context: context, message: 'Passwords do not match');
        return;
      }
      
      ref.read(forgotPasswordProvider.notifier).resetPassword(
        email: email,
        otp: _otpController.text,
        newPassword: _passwordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(forgotPasswordProvider);
    
    ref.listen<ForgotPasswordState>(forgotPasswordProvider, (previous, next) {
      next.maybeMap(
        success: (_) {
          Toaster.success(
            context: context, 
            message: 'Password reset successful! Please login with your new password.',
          );
          Navigator.pop(context); // Go back to login
        },
        error: (errorState) {
          Toaster.error(context: context, message: errorState.message);
        },
        orElse: () {},
      );
    });

    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.screenPaddingHorizontal,
          vertical: AppDimensions.screenPaddingVertical,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Forgot Password',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: AppGaps.gapSmall),
              Text(
                state.maybeMap(
                  otpSent: (_) => 'Enter the 6-digit code sent to your email and set your new password.',
                  orElse: () => 'Enter your email address below. We will send you an OTP to reset your password.',
                ),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: AppGaps.gapXXLarge),
              
              state.maybeMap(
                otpSent: (s) => _buildResetForm(s.email),
                orElse: () => _buildEmailForm(),
              ),
              
              const SizedBox(height: AppGaps.gapXLarge),
              
              state.maybeMap(
                loading: (_) => const Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                ),
                otpSent: (s) => SizedBox(
                  width: double.infinity,
                  height: AppDimensions.buttonHeight,
                  child: ElevatedButton(
                    onPressed: () => _handleResetPassword(s.email),
                    child: const Text('Confirm Reset Password'),
                  ),
                ),
                orElse: () => SizedBox(
                  width: double.infinity,
                  height: AppDimensions.buttonHeight,
                  child: ElevatedButton(
                    onPressed: _handleSendOtp,
                    child: const Text('Send OTP'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email Address',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: AppGaps.gapSmall),
        TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            hintText: 'name@example.com',
            prefixIcon: Icon(Icons.email_outlined),
            prefixIconColor: AppColors.grey,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) return 'Please enter your email';
            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
              return 'Please enter a valid email';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildResetForm(String email) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Verification Code',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: AppGaps.gapMedium),
        Center(
          child: Pinput(
            length: 6,
            controller: _otpController,
            defaultPinTheme: PinputTheme.defaultTheme,
            focusedPinTheme: PinputTheme.focusedTheme,
            submittedPinTheme: PinputTheme.submittedTheme,
            validator: (value) {
              if (value == null || value.length < 6) return 'Enter 6-digit OTP';
              return null;
            },
          ),
        ),
        const SizedBox(height: AppGaps.gapSmall),
        ResendOtpTimer(
          onResend: () => ref.read(forgotPasswordProvider.notifier).sendOtp(email),
        ),
        const SizedBox(height: AppGaps.gapXLarge),
        Text(
          'New Password',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: AppGaps.gapSmall),
        TextFormField(
          controller: _passwordController,
          obscureText: _obscurePassword,
          decoration: InputDecoration(
            hintText: 'Enter new password',
            prefixIcon: const Icon(Icons.lock_outline),
            suffixIcon: IconButton(
              icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
              onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) return 'Please enter new password';
            if (value.length < 6) return 'Password must be at least 6 characters';
            return null;
          },
        ),
        const SizedBox(height: AppGaps.gapXLarge),
        Text(
          'Confirm Password',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: AppGaps.gapSmall),
        TextFormField(
          controller: _confirmPasswordController,
          obscureText: _obscureConfirmPassword,
          decoration: InputDecoration(
            hintText: 'Confirm new password',
            prefixIcon: const Icon(Icons.lock_reset),
            suffixIcon: IconButton(
              icon: Icon(_obscureConfirmPassword ? Icons.visibility_off : Icons.visibility),
              onPressed: () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) return 'Please confirm your password';
            return null;
          },
        ),
      ],
    );
  }
}

class PinputTheme {
  static final defaultTheme = PinTheme(
    width: 45,
    height: 50,
    textStyle: const TextStyle(fontSize: 20, color: AppColors.black, fontWeight: FontWeight.bold),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: AppColors.border),
    ),
  );

  static final focusedTheme = defaultTheme.copyDecorationWith(
    border: Border.all(color: AppColors.primary),
  );

  static final submittedTheme = defaultTheme.copyWith(
    decoration: defaultTheme.decoration?.copyWith(
      color: AppColors.bg,
    ),
  );
}
