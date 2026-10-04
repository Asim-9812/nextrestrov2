import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';
import 'core/services/onesignal_service.dart';
import 'core/constants/constants.dart';
import 'core/network/session_manager.dart';
import 'core/theme/app_theme.dart';
import 'package:divinepets/features/auth/presentation/bloc/auth_state.dart';
import 'package:divinepets/features/auth/presentation/pages/login_page.dart';
import 'package:divinepets/features/splash/presentation/pages/splash_page.dart';
import 'package:divinepets/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:divinepets/features/wishlist/presentation/bloc/wishlist_bloc.dart';
import 'package:divinepets/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:divinepets/features/auth/presentation/bloc/auth_event.dart';
import 'package:divinepets/features/brand/presentation/bloc/brand_bloc.dart';
import 'package:divinepets/features/brand/presentation/bloc/brand_event.dart';
import 'package:divinepets/features/category/presentation/bloc/category_bloc.dart';
import 'package:divinepets/features/category/presentation/bloc/category_event.dart';
import 'package:divinepets/features/pet_type/presentation/bloc/pet_type_bloc.dart';
import 'package:divinepets/features/pet_type/presentation/bloc/pet_type_event.dart';
import 'package:divinepets/features/order/presentation/bloc/order_bloc.dart';
import 'package:divinepets/features/product/presentation/bloc/product_bloc.dart';
import 'package:divinepets/features/product/presentation/bloc/product_event.dart';
import 'package:divinepets/features/chatbot/presentation/bloc/chat_bloc.dart';
import 'package:divinepets/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:divinepets/features/notification/presentation/bloc/notification_event.dart';
import 'package:divinepets/injection_container.dart' as di;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  OneSignalService.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await di.init();
  runApp(
    DevicePreview(
      enabled: true, //!kReleaseMode,
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => di.sl<AuthBloc>()..add(CheckAuthEvent())),
          BlocProvider(create: (_) => di.sl<CartBloc>()),
          BlocProvider(create: (_) => di.sl<WishlistBloc>()),
          BlocProvider(create: (_) => di.sl<BrandBloc>()..add(GetAllBrandsEvent())),
          BlocProvider(create: (_) => di.sl<CategoryBloc>()..add(GetAllCategoriesEvent())),
          BlocProvider(create: (_) => di.sl<PetTypeBloc>()..add(GetAllPetTypesEvent())),
          BlocProvider(create: (_) => di.sl<ProductBloc>()..add(GetAllProductsEvent())),
          BlocProvider(create: (_) => di.sl<OrderBloc>()),
          BlocProvider(create: (_) => di.sl<ChatBloc>()),
          BlocProvider(create: (context) {
            final authState = context.read<AuthBloc>().state;
            final bloc = di.sl<NotificationBloc>();
            if (authState is Authenticated) {
              bloc.add(GetUnreadCountEvent(authState.user.userId));
            }
            return bloc;
          }),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isInitialAuthChecked = false;

  @override
  void initState() {
    super.initState();
    _setupSessionListener();
  }

  void _setupSessionListener() {
    di.sl<SessionManager>().sessionExpiredStream.listen((expired) {
      if (expired) {
        _handleSessionExpired();
      }
    });
  }

  void _handleSessionExpired() {
    debugPrint("MyApp: [SESSION EXPIRED] Handling event");
    
    // 1. Reset Auth state via Bloc
    di.sl<AuthBloc>().add(LogoutEvent());
    di.sl<CartBloc>().add(ResetCartEvent());

    // 2. Immediate Forceful Navigation
    // We do it here directly to ensure it happens regardless of Bloc state timing
    if (navigatorKey.currentState != null) {
      debugPrint("MyApp: [SESSION EXPIRED] Pushing LoginPage");
      navigatorKey.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const LoginPage()),
        (route) => false,
      );
    } else {
      debugPrint("MyApp: [SESSION EXPIRED] Navigator state is null!");
    }

    // 3. Show Feedback
    final context = navigatorKey.currentContext;
    if (context != null) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login expired. Please login again.'),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 4),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      locale: DevicePreview.locale(context),
      builder: (context, child) {
        child = DevicePreview.appBuilder(context, child);
        return BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            debugPrint("MyApp: Global Auth State Changed to: $state");
            if (state is Authenticated) {
              final user = state.user;
              OneSignalService.login(user.userId.toString());
              context.read<CartBloc>().add(GetCartEvent(user.userId));
              _isInitialAuthChecked = true;
            } else if (state is Unauthenticated) {
              OneSignalService.logout();
              context.read<CartBloc>().add(ResetCartEvent());
              
              // Only navigate if we've already done the initial check 
              // AND we're not currently handling a session expiry (which does its own navigation)
              if (_isInitialAuthChecked) {
                debugPrint("MyApp: Redirecting to LoginPage (Manual Logout)");
                navigatorKey.currentState?.pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                  (route) => false,
                );
              }
              _isInitialAuthChecked = true;
            }
          },
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: TextScaler.noScaling,
            ),
            child: child,
          ),
        );
      },
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashPage(),
    );
  }
}
