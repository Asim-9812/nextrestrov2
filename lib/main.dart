import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constants/constants.dart';
import 'core/theme/app_theme.dart';
import 'features/splash/presentation/pages/splash_page.dart';
import 'features/cart/presentation/bloc/cart_bloc.dart';
import 'features/wishlist/presentation/bloc/wishlist_bloc.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/bloc/auth_event.dart';
import 'features/brand/presentation/bloc/brand_bloc.dart';
import 'features/brand/presentation/bloc/brand_event.dart';
import 'features/category/presentation/bloc/category_bloc.dart';
import 'features/category/presentation/bloc/category_event.dart';
import 'features/product_type/presentation/bloc/product_type_bloc.dart';
import 'features/product_type/presentation/bloc/product_type_event.dart';
import 'features/pet_type/presentation/bloc/pet_type_bloc.dart';
import 'features/pet_type/presentation/bloc/pet_type_event.dart';
import 'features/product/presentation/bloc/product_bloc.dart';
import 'features/product/presentation/bloc/product_event.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await di.init();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => di.sl<AuthBloc>()..add(CheckAuthEvent())),
          BlocProvider(create: (_) => di.sl<CartBloc>()),
          BlocProvider(create: (_) => di.sl<WishlistBloc>()),
          BlocProvider(create: (_) => di.sl<BrandBloc>()..add(GetAllBrandsEvent())),
          BlocProvider(create: (_) => di.sl<CategoryBloc>()..add(GetAllCategoriesEvent())),
          BlocProvider(create: (_) => di.sl<ProductTypeBloc>()..add(GetAllProductTypesEvent())),
          BlocProvider(create: (_) => di.sl<PetTypeBloc>()..add(GetAllPetTypesEvent())),
          BlocProvider(create: (_) => di.sl<ProductBloc>()..add(GetAllProductsEvent())),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: (context, child) {
        child = DevicePreview.appBuilder(context, child);
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.noScaling,
          ),
          child: child,
        );
      },
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashPage(),
    );
  }
}
