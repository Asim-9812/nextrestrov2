import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/network/session_service.dart';
import 'package:nextrestro/features/admin_dashboard/presentation/admin_dashboard_page.dart';
import 'package:nextrestro/features/login/presentation/login_page.dart';
import 'package:nextrestro/features/waiter_dashboard/presentation/waiter_dashboard_page.dart';
import 'package:nextrestro/features/kitchen_dashboard/presentation/kitchen_dashboard_page.dart';
import 'package:nextrestro/features/cashier_dashboard/presentation/cashier_dashboard_page.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    _handleNavigation();
  }

  Future<void> _handleNavigation() async {
    // Artificial delay for splash visibility
    await Future.delayed(const Duration(seconds: 2));
    
    if (!mounted) return;

    final session = ref.read(sessionServiceProvider);
    
    if (session.hasSession()) {
      final user = session.getUser();
      final role = (user?['role'] as String?)?.toLowerCase();

      Widget dashboard;
      switch (role) {
        case 'admin':
          dashboard = const AdminDashboardPage();
          break;
        case 'waiter':
          dashboard = const WaiterDashboardPage();
          break;
        case 'chef':
        case 'kitchen':
          dashboard = const KitchenDashboardPage();
          break;
        case 'cashier':
          dashboard = const CashierDashboardPage();
          break;
        default:
          // If role is invalid, clear session and go to login
          await session.clearSession();
          dashboard = const LoginPage();
      }

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => dashboard),
      );
    } else {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splash,
      body: Center(
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
    );
  }
}
