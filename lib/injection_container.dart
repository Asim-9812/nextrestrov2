import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/network/dio_client.dart';
import 'core/network/session_manager.dart';
import 'features/auth/data/datasources/auth_local_data_source.dart';
import 'features/auth/data/datasources/auth_remote_data_source.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/brand/data/datasources/brand_remote_data_source.dart';
import 'features/brand/data/repositories/brand_repository_impl.dart';
import 'features/brand/domain/repositories/brand_repository.dart';
import 'features/brand/presentation/bloc/brand_bloc.dart';
import 'features/category/data/datasources/category_remote_data_source.dart';
import 'features/category/data/repositories/category_repository_impl.dart';
import 'features/category/domain/repositories/category_repository.dart';
import 'features/category/presentation/bloc/category_bloc.dart';
import 'features/product_type/data/datasources/product_type_remote_data_source.dart';
import 'features/product_type/data/repositories/product_type_repository_impl.dart';
import 'features/product_type/domain/repositories/product_type_repository.dart';
import 'features/product_type/presentation/bloc/product_type_bloc.dart';
import 'features/order/data/datasources/order_remote_data_source.dart';
import 'features/order/data/repositories/order_repository_impl.dart';
import 'features/order/domain/repositories/order_repository.dart';
import 'features/order/presentation/bloc/order_bloc.dart';
import 'features/pet_type/data/datasources/pet_type_remote_data_source.dart';
import 'features/pet_type/data/repositories/pet_type_repository_impl.dart';
import 'features/pet_type/domain/repositories/pet_type_repository.dart';
import 'features/pet_type/presentation/bloc/pet_type_bloc.dart';
import 'features/product/data/datasources/product_remote_data_source.dart';
import 'features/product/data/repositories/product_repository_impl.dart';
import 'features/product/domain/repositories/product_repository.dart';
import 'features/product/presentation/bloc/product_bloc.dart';
import 'features/product/presentation/bloc/review_cubit.dart';
import 'features/cart/data/datasources/cart_remote_data_source.dart';
import 'features/cart/data/repositories/cart_repository_impl.dart';
import 'features/cart/domain/repositories/cart_repository.dart';
import 'features/cart/presentation/bloc/cart_bloc.dart';
import 'features/wishlist/presentation/bloc/wishlist_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  await Hive.initFlutter();
  sl.registerLazySingleton(() => SessionManager());
  await sl<SessionManager>().initialize();
  
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => DioClient(sl(), sl()));

  // Features - Auth
  sl.registerFactory(() => AuthBloc(authRepository: sl()));
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      sessionManager: sl(),
    ),
  );
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(),
  );

  // Features - Brand
  sl.registerFactory(() => BrandBloc(brandRepository: sl()));
  sl.registerLazySingleton<BrandRepository>(
    () => BrandRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<BrandRemoteDataSource>(
    () => BrandRemoteDataSourceImpl(sl()),
  );

  // Features - Category
  sl.registerFactory(() => CategoryBloc(categoryRepository: sl()));
  sl.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<CategoryRemoteDataSource>(
    () => CategoryRemoteDataSourceImpl(sl()),
  );

  // Features - ProductType
  sl.registerFactory(() => ProductTypeBloc(productTypeRepository: sl()));
  sl.registerLazySingleton<ProductTypeRepository>(
    () => ProductTypeRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<ProductTypeRemoteDataSource>(
    () => ProductTypeRemoteDataSourceImpl(sl()),
  );

  // Features - PetType
  sl.registerFactory(() => PetTypeBloc(petTypeRepository: sl()));
  sl.registerLazySingleton<PetTypeRepository>(
    () => PetTypeRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<PetTypeRemoteDataSource>(
    () => PetTypeRemoteDataSourceImpl(sl()),
  );

  // Features - Order
  sl.registerFactory(() => OrderBloc(orderRepository: sl()));
  sl.registerLazySingleton<OrderRepository>(
    () => OrderRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<OrderRemoteDataSource>(
    () => OrderRemoteDataSourceImpl(sl()),
  );

  // Features - Product
  sl.registerFactory(() => ProductBloc(productRepository: sl()));
  sl.registerFactory(() => ReviewCubit(productRepository: sl()));
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(sl()),
  );

  // Features - Cart
  sl.registerFactory(() => CartBloc(cartRepository: sl()));
  sl.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<CartRemoteDataSource>(
    () => CartRemoteDataSourceImpl(sl()),
  );

  // Features - Wishlist
  sl.registerFactory(() => WishlistBloc());

}
