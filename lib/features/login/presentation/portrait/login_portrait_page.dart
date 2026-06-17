import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/constants/dimensions.dart';
import 'package:nextrestro/core/constants/gap_manager.dart';
import 'package:nextrestro/core/network/session_service.dart';
import 'package:nextrestro/core/utils/toaster.dart';
import 'package:nextrestro/features/admin_dashboard/presentation/admin_dashboard_page.dart';
import 'package:nextrestro/features/login/presentation/providers/login_provider.dart';

import 'package:nextrestro/features/waiter_dashboard/presentation/waiter_dashboard_page.dart';
import 'package:nextrestro/features/kitchen_dashboard/presentation/kitchen_dashboard_page.dart';
import 'package:nextrestro/features/cashier_dashboard/presentation/cashier_dashboard_page.dart';

class LoginPortraitPage extends ConsumerStatefulWidget {
  const LoginPortraitPage({super.key});

  @override
  ConsumerState<LoginPortraitPage> createState() => _LoginPortraitPageState();
}

class _LoginPortraitPageState extends ConsumerState<LoginPortraitPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _splashOpacityAnimation;
  late Animation<double> _loginOpacityAnimation;
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _rememberMe = false;

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

    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _splashOpacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.5, 1.0, curve: Curves.easeInOutCubic),
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
              message: 'Access Denied: You do not have permission to access any dashboard. Please contact support.',
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

    final loginState = ref.watch(loginProvider);
    final isLoading = loginState.maybeMap(
      loading: (_) => true,
      orElse: () => false,
    );

    return Scaffold(
      body: Stack(
        children: [
          // Splash Screen (fading out)
          FadeTransition(
            opacity: _splashOpacityAnimation,
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
                    const SizedBox(height: 12),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'CRAVE',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                            fontFamily: 'Manrope',
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'RESTRO',
                          style: TextStyle(
                            fontSize: 28,
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
          // Login Screen (fading in)
          FadeTransition(
            opacity: _loginOpacityAnimation,
            child: Container(
              color: AppColors.bg,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.screenPaddingHorizontal,
                    vertical: AppDimensions.screenPaddingVertical,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: MediaQuery.of(context).padding.top + 16),
                        Text(
                          'Welcome Back',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        const SizedBox(height: AppGaps.gapSmall),
                        Text(
                          'Sign in to continue',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: AppGaps.gapXXLarge),
                        Text(
                          'Username',
                          style: Theme.of(context).textTheme.titleMedium,
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
                              return 'Please enter your username';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: AppGaps.gapXLarge),
                        Text(
                          'Password',
                          style: Theme.of(context).textTheme.titleMedium,
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
                              return 'Please enter your password';
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
                              onPressed: isLoading ? null : () {},
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                          color: AppColors.white,
                                        ),
                                  ),
                          ),
                        ),
                        const SizedBox(height: AppGaps.gapXXLarge),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: AppColors.primary.withAlpha(38),
                                thickness: 1,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppGaps.gapMedium,
                              ),
                              child: Text(
                                'Or continue with',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: AppColors.primary.withAlpha(38),
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppGaps.gapXLarge),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildSocialButton(Icons.mail_outline, isLoading),
                            const SizedBox(width: AppGaps.gapXLarge),
                            _buildSocialButton(Icons.phone_outlined, isLoading),
                          ],
                        ),
                        const SizedBox(height: AppGaps.gapXXLarge),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, bool isLoading) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(AppDimensions.textFieldBorderRadius),
      ),
      child: IconButton(
        icon: Icon(icon, color: AppColors.grey),
        onPressed: isLoading ? null : () {},
      ),
    );
  }
}
