import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/network/session_service.dart';
import 'package:nextrestro/core/theme/app_theme.dart';
import 'package:nextrestro/features/login/presentation/login_page.dart';
import 'package:nextrestro/features/splash/presentation/splash_page.dart';

class MyApp extends ConsumerWidget {
  final bool enableDevicePreview;

  const MyApp({super.key, this.enableDevicePreview = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasSession = ref.watch(sessionServiceProvider).hasSession();

    return DevicePreview(
      enabled: enableDevicePreview,
      builder: (context) => MaterialApp(
        title: 'The Next Restro',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.light,
        // ignore: deprecated_member_use
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        home: hasSession ? const SplashPage() : const LoginPage(),
      ),
    );
  }
}
