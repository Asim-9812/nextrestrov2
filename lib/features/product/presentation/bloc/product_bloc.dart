import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/product_repository.dart';
import 'product_event.dart';
import 'product_state.dart';
import '../../domain/entities/product.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  List<Product> _allProducts = [];

  ProductBloc({required this.productRepository}) : super(ProductInitial()) {
    on<GetAllProductsEvent>(_onGetAllProducts);
    on<SearchProductsEvent>(_onSearchProducts);
    on<FilterProductsByPetTypeEvent>(_onFilterByPetType);
    on<FilterProductsByCategoryEvent>(_onFilterByCategory);
    on<FilterProductsByProductTypeEvent>(_onFilterByProductType);
  }

  Future<void> _onGetAllProducts(GetAllProductsEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    final result = await productRepository.getAllProducts();
    result.fold(
      (failure) => emit(ProductError(failure.message)),
      (products) {
        _allProducts = products;
        emit(ProductLoaded(products: products, filteredProducts: products));
      },
    );
  }

  void _onSearchProducts(SearchProductsEvent event, Emitter<ProductState> emit) {
    if (state is ProductLoaded) {
      final query = event.query.toLowerCase();
      final filtered = _allProducts.where((p) {
        return p.name.toLowerCase().contains(query) ||
               p.category.toLowerCase().contains(query) ||
               (p.productTypeName?.toLowerCase().contains(query) ?? false);
      }).toList();
      emit(ProductLoaded(products: _allProducts, filteredProducts: filtered, searchQuery: event.query));
    }
  }

  void _onFilterByPetType(FilterProductsByPetTypeEvent event, Emitter<ProductState> emit) {
    if (state is ProductLoaded) {
      final filtered = _allProducts.where((p) => p.petTypeId == event.petTypeId).toList();
      emit(ProductLoaded(products: _allProducts, filteredProducts: filtered));
    }
  }

  void _onFilterByCategory(FilterProductsByCategoryEvent event, Emitter<ProductState> emit) {
    if (state is ProductLoaded) {
      final filtered = _allProducts.where((p) => p.categoryId == event.categoryId).toList();
      emit(ProductLoaded(products: _allProducts, filteredProducts: filtered));
    }
  }

  void _onFilterByProductType(FilterProductsByProductTypeEvent event, Emitter<ProductState> emit) {
    if (state is ProductLoaded) {
      final filtered = _allProducts.where((p) => p.productTypeId == event.productTypeId).toList();
      emit(ProductLoaded(products: _allProducts, filteredProducts: filtered));
    }
  }
}
