import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nextrestro/core/network/session_service.dart';
import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Set preferred orientations based on device type
    final view = PlatformDispatcher.instance.implicitView;
    if (view != null) {
      final pixelRatio = view.devicePixelRatio;
      final logicalSize = view.physicalSize / pixelRatio;
      final shortestSide = logicalSize.shortestSide;

      if (shortestSide >= 600) {
        // Tablet - Landscape
        await SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
      } else {
        // Mobile - Portrait
        await SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      }
    }

    // Initialize Hive
    await Hive.initFlutter();
    
    // Initialize Session Service
    final sessionService = SessionService();
    await sessionService.init();

    // Set to true to enable device preview for testing different screen sizes
    const bool enableDevicePreview = !kReleaseMode;
    
    runApp(
      ProviderScope(
        overrides: [
          sessionServiceProvider.overrideWithValue(sessionService),
        ],
        child: const MyApp(enableDevicePreview: enableDevicePreview),
      ),
    );
  } catch (e) {
    debugPrint('Initialization Error: $e');
  }
}
