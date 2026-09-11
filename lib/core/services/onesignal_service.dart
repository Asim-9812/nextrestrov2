import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../main.dart'; // To access navigatorKey

import '../../features/order/presentation/pages/order_details_page.dart';
import '../../features/order/presentation/bloc/order_bloc.dart';
import '../../injection_container.dart' as di;

class OneSignalService {
  static const String _appId = "a320a637-fe26-4694-bbc2-43dc677ba436";
  static const String _dialogShownKey = "onesignal_verification_dialog_shown";

  static void init() {
    debugPrint("OneSignal: Initializing...");
    
    // 1. Set Debug Level
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

    // 2. Initialize FIRST to avoid "Must call initWithContext before use"
    OneSignal.initialize(_appId);

    // 3. Setup Listeners AFTER Initialize
    
    // Foreground Notification Listener
    OneSignal.Notifications.addForegroundWillDisplayListener((event) {
      debugPrint("OneSignal: !!! FOREGROUND NOTIFICATION RECEIVED !!!");
      debugPrint("OneSignal:   Title: ${event.notification.title}");
      debugPrint("OneSignal:   Additional Data: ${event.notification.additionalData}");
      
      // Force display the notification banner
      event.notification.display(); 
    });

    // Notification Click Listener
    OneSignal.Notifications.addClickListener((event) {
      debugPrint("OneSignal: Notification clicked!");
      final data = event.notification.additionalData;
      debugPrint("OneSignal:   Additional Data: $data");

      if (data != null && (data['type'] == 'order_status' || data['type'] == 'order_update')) {
        // Handle both string and int for orderId
        final rawOrderId = data['orderId'];
        final orderId = int.tryParse(rawOrderId.toString());
        if (orderId != null) {
          _navigateToOrderDetails(orderId);
        }
      }
    });

    // Subscription Observer
    OneSignal.User.pushSubscription.addObserver((state) {
      debugPrint("OneSignal: Subscription ID changed: ${state.current.id}");
      if (state.current.id != null) {
        _checkAndShowVerificationDialog(state.current.id);
      }
    });

    // 4. Automatically request push permission
    OneSignal.Notifications.requestPermission(true).then((accepted) {
      debugPrint("OneSignal: Permission request completed. Accepted: $accepted");
    });

    // 5. Force check permissions and registration
    _forceCheckStatus();
  }

  static void _navigateToOrderDetails(int orderId) {
    // In release mode, we might need a small delay to ensure the navigator is ready
    // especially if launching from a cold start.
    Future.delayed(const Duration(milliseconds: 500), () {
      final navState = navigatorKey.currentState;
      if (navState != null) {
        navState.push(
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => di.sl<OrderBloc>(),
              child: OrderDetailsPage(orderId: orderId),
            ),
          ),
        );
      } else {
        debugPrint("OneSignal Error: Navigator state is null, cannot navigate to order $orderId");
      }
    });
  }

  static Future<void> _forceCheckStatus() async {
    // Wait a bit for SDK to settle
    await Future.delayed(const Duration(seconds: 2));
    
    final subId = OneSignal.User.pushSubscription.id;
    final hasPermission = await OneSignal.Notifications.permission;
    
    debugPrint("OneSignal: Periodic Status Check:");
    debugPrint("OneSignal:   Subscription ID: $subId");
    debugPrint("OneSignal:   Has Permission: $hasPermission");

    if (subId != null && !hasPermission) {
      debugPrint("OneSignal: Permission not granted, triggering prompt...");
      // For testing purposes, we can trigger the prompt here if not granted
      // but following the ai-prompt guidelines, we use the dialog.
      _checkAndShowVerificationDialog(subId);
    }
  }

  static Future<void> _checkAndShowVerificationDialog(String? subscriptionId) async {
    if (subscriptionId == null || subscriptionId.startsWith("local-")) return;

    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(_dialogShownKey) ?? false) return;

    // Show dialog via navigatorKey context
    _waitForContextAndShowDialog();
  }

  static Future<void> _waitForContextAndShowDialog() async {
    while (navigatorKey.currentContext == null) {
      await Future.delayed(const Duration(milliseconds: 500));
    }

    final context = navigatorKey.currentContext!;
    if (!context.mounted) return;

    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(_dialogShownKey) ?? false) return;
    
    await prefs.setBool(_dialogShownKey, true);
    
    if (context.mounted) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: const Text("Notifications Integrated!"),
          content: const Text("Tap 'Got it' to enable pet updates and reminders."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                // Explicitly request permission here
                OneSignal.Notifications.requestPermission(true);
              },
              child: const Text("Got it"),
            ),
          ],
        ),
      );
    }
  }

  static void login(String externalId) => OneSignal.login(externalId);
  static void logout() => OneSignal.logout();

  static void _navigateToOrderDetails(int orderId) {
    final context = navigatorKey.currentContext;
    if (context != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => di.sl<OrderBloc>(),
            child: OrderDetailsPage(orderId: orderId),
          ),
        ),
      );
    }
  }
}
