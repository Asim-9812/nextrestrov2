import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/product_repository.dart';
import 'product_variant_state.dart';

class ProductVariantCubit extends Cubit<ProductVariantState> {
  final ProductRepository productRepository;

  ProductVariantCubit({required this.productRepository}) : super(ProductVariantInitial());

  Future<void> getProductVariants(int productId) async {
    emit(ProductVariantLoading());
    final result = await productRepository.getProductVariants(productId);
    result.fold(
      (failure) => emit(ProductVariantError(failure.message)),
      (variants) => emit(ProductVariantLoaded(variants)),
    );
  }
}
