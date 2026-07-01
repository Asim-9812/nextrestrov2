import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/constants/dimensions.dart';
import 'package:nextrestro/core/constants/gap_manager.dart';
import 'package:nextrestro/core/network/session_service.dart';
import 'package:nextrestro/core/utils/toaster.dart';
import 'package:nextrestro/features/admin_dashboard/presentation/admin_dashboard_page.dart';
import 'package:nextrestro/features/login/presentation/providers/login_provider.dart';
import 'package:nextrestro/features/forgot_password/presentation/providers/forgot_password_provider.dart';
import 'package:nextrestro/features/forgot_password/presentation/providers/forgot_password_state.dart';
import 'package:nextrestro/features/forgot_password/presentation/portrait/forgot_password_portrait_page.dart';
import 'package:nextrestro/features/forgot_password/presentation/widgets/resend_otp_timer.dart';

import 'package:nextrestro/features/waiter_dashboard/presentation/waiter_dashboard_page.dart';
import 'package:nextrestro/features/kitchen_dashboard/presentation/kitchen_dashboard_page.dart';
import 'package:nextrestro/features/cashier_dashboard/presentation/cashier_dashboard_page.dart';
import 'package:pinput/pinput.dart';

class LoginLandscapePage extends ConsumerStatefulWidget {
  const LoginLandscapePage({super.key});

  @override
  ConsumerState<LoginLandscapePage> createState() => _LoginLandscapePageState();
}

class _LoginLandscapePageState extends ConsumerState<LoginLandscapePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _logoWidthAnimation;
  late Animation<double> _loginOpacityAnimation;
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;

  // Forgot Password Controllers
  late TextEditingController _emailController;
  late TextEditingController _otpController;
  late TextEditingController _newPasswordController;
  late TextEditingController _confirmPasswordController;

  final _formKey = GlobalKey<FormState>();
  final _forgotFormKey = GlobalKey<FormState>();

  bool _obscurePassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;
  bool _rememberMe = false;
  bool _isForgotPassword = false;

  @override
  void initState() {
    super.initState();
    final session = ref.read(sessionServiceProvider);
    _rememberMe = session.isRememberMeEnabled();
    _usernameController = TextEditingController(
      text: _rememberMe ? session.getSavedUsername() : '',
    );
    _passwordController = TextEditingController(
      text: _rememberMe ? session.getSavedPassword() : '',
    );

    _emailController = TextEditingController();
    _otpController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();

    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _logoWidthAnimation = Tween<double>(begin: 1.0, end: 0.6).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeInOutCubic),
      ),
    );

    _loginOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.5, 1.0, curve: Curves.easeInOutCubic),
      ),
    );

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        _animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _otpController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleLogin() async {
    if (_formKey.currentState?.validate() ?? false) {
      final username = _usernameController.text.trim();
      final password = _passwordController.text.trim();

      // Save remember me preference before login
      await ref.read(sessionServiceProvider).saveRememberMe(
            _rememberMe,
            username: username,
            password: password,
          );

      await ref.read(loginProvider.notifier).login(username, password);
    }
  }

  void _handleSendOtp() {
    if (_forgotFormKey.currentState?.validate() ?? false) {
      ref
          .read(forgotPasswordProvider.notifier)
          .sendOtp(_emailController.text.trim());
    }
  }

  void _handleResetPassword(String email) {
    if (_forgotFormKey.currentState?.validate() ?? false) {
      if (_newPasswordController.text != _confirmPasswordController.text) {
        Toaster.error(context: context, message: 'Passwords do not match');
        return;
      }

      ref.read(forgotPasswordProvider.notifier).resetPassword(
            email: email,
            otp: _otpController.text,
            newPassword: _newPasswordController.text,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<LoginState>(loginProvider, (previous, next) {
      next.maybeMap(
        success: (state) {
          final role = (state.response.role ?? '').toLowerCase();
          Widget dashboard;

          if (role == 'admin') {
            dashboard = const AdminDashboardPage();
          } else if (role == 'waiter') {
            dashboard = const WaiterDashboardPage();
          } else if (role == 'chef' || role == 'kitchen') {
            dashboard = const KitchenDashboardPage();
          } else if (role == 'cashier') {
            dashboard = const CashierDashboardPage();
          } else {
            Toaster.error(
              context: context,
              message:
                  'Access Denied: You do not have permission to access any dashboard. Please contact support.',
            );
            return;
          }

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => dashboard),
          );
        },
        error: (state) {
          Toaster.error(context: context, message: state.message);
        },
        orElse: () {},
      );
    });

    ref.listen<ForgotPasswordState>(forgotPasswordProvider, (previous, next) {
      next.maybeMap(
        success: (_) {
          Toaster.success(
            context: context,
            message: 'Password reset successful! Please login.',
          );
          setState(() {
            _isForgotPassword = false;
            ref.read(forgotPasswordProvider.notifier).resetToInitial();
          });
        },
        error: (state) {
          Toaster.error(context: context, message: state.message);
        },
        orElse: () {},
      );
    });

    final loginState = ref.watch(loginProvider);
    final forgotState = ref.watch(forgotPasswordProvider);

    final isLoading = loginState.maybeMap(
          loading: (_) => true,
          orElse: () => false,
        ) ||
        forgotState.maybeMap(
          loading: (_) => true,
          orElse: () => false,
        );

    return Scaffold(
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          double screenWidth = MediaQuery.of(context).size.width;
          double logoWidth = screenWidth * _logoWidthAnimation.value;
          double loginWidth = screenWidth - logoWidth;

          return Row(
            children: [
              // Splash Logo Section
              SizedBox(
                width: logoWidth,
                child: Container(
                  color: AppColors.splash,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/tempLogo.png',
                          width: 160,
                          height: 160,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.restaurant,
                              size: 160,
                              color: AppColors.white,
                            );
                          },
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'CRAVE',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.black,
                                fontFamily: 'Manrope',
                              ),
                            ),
                            SizedBox(width: 4),
                            Text(
                              'RESTRO',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white,
                                fontFamily: 'Manrope',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Content Section (Login or Forgot Password)
              SizedBox(
                width: loginWidth,
                child: FadeTransition(
                  opacity: _loginOpacityAnimation,
                  child: Container(
                    color: AppColors.bg,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppDimensions.screenPaddingHorizontal,
                          vertical: AppDimensions.screenPaddingVertical,
                        ),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: _isForgotPassword
                                ? _buildForgotPasswordContent(
                                    forgotState, isLoading)
                                : _buildLoginContent(isLoading),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildLoginContent(bool isLoading) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome Back',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: AppGaps.gapSmall),
          Text(
            'Sign in to continue',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: AppGaps.gapXLarge),
          Text(
            'Username',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: AppGaps.gapSmall),
          TextFormField(
            controller: _usernameController,
            enabled: !isLoading,
            decoration: const InputDecoration(
              hintText: 'Enter your username',
              prefixIcon: Icon(Icons.person_outline),
              prefixIconColor: AppColors.grey,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Required';
              }
              return null;
            },
          ),
          const SizedBox(height: AppGaps.gapLarge),
          Text(
            'Password',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: AppGaps.gapSmall),
          TextFormField(
            controller: _passwordController,
            obscureText: _obscurePassword,
            enabled: !isLoading,
            decoration: InputDecoration(
              hintText: 'Enter your password',
              prefixIcon: const Icon(Icons.lock_outline),
              prefixIconColor: AppColors.grey,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
              suffixIconColor: AppColors.grey,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Required';
              }
              return null;
            },
          ),
          const SizedBox(height: AppGaps.gapLarge),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: _rememberMe,
                    onChanged: isLoading
                        ? null
                        : (value) {
                            setState(() {
                              _rememberMe = value ?? false;
                            });
                          },
                    activeColor: AppColors.primary,
                  ),
                  Text(
                    'Remember me',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              TextButton(
                onPressed: isLoading
                    ? null
                    : () {
                        setState(() {
                          _isForgotPassword = true;
                        });
                      },
                child: Text(
                  'Forgot Password?',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppGaps.gapXLarge),
          SizedBox(
            width: double.infinity,
            height: AppDimensions.buttonHeight,
            child: ElevatedButton(
              onPressed: isLoading ? null : _handleLogin,
              child: isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.white,
                      ),
                    )
                  : Text(
                      'Login',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppColors.white,
                          ),
                    ),
            ),
          ),
          const SizedBox(height: AppGaps.gapXXLarge),
        ],
      ),
    );
  }

  Widget _buildForgotPasswordContent(ForgotPasswordState state, bool isLoading) {
    return Form(
      key: _forgotFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                _isForgotPassword = false;
                ref.read(forgotPasswordProvider.notifier).resetToInitial();
              });
            },
            icon: const Icon(Icons.arrow_back),
            padding: EdgeInsets.zero,
            alignment: Alignment.centerLeft,
          ),
          const SizedBox(height: AppGaps.gapSmall),
          Text(
            'Forgot Password',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: AppGaps.gapSmall),
          Text(
            state.maybeMap(
              otpSent: (_) =>
                  'Enter the 6-digit code sent to your email and set your new password.',
              orElse: () => 'Enter your email address to receive an OTP.',
            ),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: AppGaps.gapXLarge),
          state.maybeMap(
            otpSent: (s) => _buildLandscapeResetFields(),
            orElse: () => _buildLandscapeEmailField(),
          ),
          const SizedBox(height: AppGaps.gapLarge),
          SizedBox(
            width: double.infinity,
            height: AppDimensions.buttonHeight,
            child: ElevatedButton(
              onPressed: isLoading
                  ? null
                  : () {
                      state.maybeMap(
                        otpSent: (s) => _handleResetPassword(s.email),
                        orElse: () => _handleSendOtp(),
                      );
                    },
              child: isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                          strokeWidth: 2, color: AppColors.white),
                    )
                  : Text(state.maybeMap(
                      otpSent: (_) => 'Reset Password', orElse: () => 'Send OTP')),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLandscapeEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Email Address', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: AppGaps.gapSmall),
        TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            hintText: 'Enter your email',
            prefixIcon: Icon(Icons.email_outlined),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) return 'Required';
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildLandscapeResetFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Pinput(
            length: 6,
            controller: _otpController,
            defaultPinTheme: PinputTheme.defaultTheme,
            focusedPinTheme: PinputTheme.focusedTheme,
          ),
        ),
        const SizedBox(height: AppGaps.gapSmall),
        ResendOtpTimer(
          onResend: () => ref.read(forgotPasswordProvider.notifier).sendOtp(_emailController.text.trim()),
        ),
        const SizedBox(height: AppGaps.gapLarge),
        TextFormField(
          controller: _newPasswordController,
          obscureText: _obscureNewPassword,
          decoration: InputDecoration(
            hintText: 'New Password',
            prefixIcon: const Icon(Icons.lock_outline),
            suffixIcon: IconButton(
              icon: Icon(_obscureNewPassword
                  ? Icons.visibility_off
                  : Icons.visibility),
              onPressed: () =>
                  setState(() => _obscureNewPassword = !_obscureNewPassword),
            ),
          ),
        ),
        const SizedBox(height: AppGaps.gapSmall),
        TextFormField(
          controller: _confirmPasswordController,
          obscureText: _obscureConfirmPassword,
          decoration: InputDecoration(
            hintText: 'Confirm Password',
            prefixIcon: const Icon(Icons.lock_reset),
            suffixIcon: IconButton(
              icon: Icon(_obscureConfirmPassword
                  ? Icons.visibility_off
                  : Icons.visibility),
              onPressed: () => setState(
                  () => _obscureConfirmPassword = !_obscureConfirmPassword),
            ),
          ),
        ),
      ],
    );
  }
}
