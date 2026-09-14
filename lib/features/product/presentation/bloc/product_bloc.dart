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
    on<FilterProductsByBrandEvent>(_onFilterByBrand);
    on<FilterProductsByMultipleCriteriaEvent>(_onFilterByMultipleCriteria);
    on<ApplyComplexFiltersEvent>(_onApplyComplexFilters);
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
      final currentState = state as ProductLoaded;
      final query = event.query.toLowerCase();
      
      List<Product> filtered = _allProducts.where((p) {
        return p.name.toLowerCase().contains(query) ||
               p.category.toLowerCase().contains(query) ||
               (p.productTypeName?.toLowerCase().contains(query) ?? false);
      }).toList();

      // Apply existing filters to search results
      filtered = _applyExistingFilters(filtered, currentState);

      emit(ProductLoaded(
        products: _allProducts,
        filteredProducts: filtered,
        searchQuery: event.query,
        selectedSort: currentState.selectedSort,
        selectedPriceRange: currentState.selectedPriceRange,
        selectedPetTypes: currentState.selectedPetTypes,
        selectedBrands: currentState.selectedBrands,
        selectedRating: currentState.selectedRating,
        availability: currentState.availability,
      ));
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

  void _onFilterByBrand(FilterProductsByBrandEvent event, Emitter<ProductState> emit) {
    if (state is ProductLoaded) {
      final filtered = _allProducts.where((p) => p.brandId == event.brandId).toList();
      emit(ProductLoaded(products: _allProducts, filteredProducts: filtered));
    }
  }

  void _onFilterByMultipleCriteria(FilterProductsByMultipleCriteriaEvent event, Emitter<ProductState> emit) {
    if (state is ProductLoaded) {
      final filtered = _allProducts.where((p) {
        final matchesCategory = event.categoryIds.isEmpty || (p.categoryId != null && event.categoryIds.contains(p.categoryId));
        final matchesPetType = event.petTypeIds.isEmpty || (p.petTypeId != null && event.petTypeIds.contains(p.petTypeId));
        return matchesCategory && matchesPetType;
      }).toList();
      emit(ProductLoaded(products: _allProducts, filteredProducts: filtered));
    }
  }

  List<Product> _applyExistingFilters(List<Product> products, ProductLoaded state) {
    List<Product> filtered = List.from(products);

    if (state.selectedPetTypes != null && state.selectedPetTypes!.isNotEmpty && !state.selectedPetTypes!.contains('All')) {
      filtered = filtered.where((p) {
        if (p.petTypeName == null) return false;
        return state.selectedPetTypes!.any((type) => 
          p.petTypeName!.toLowerCase().contains(type.toLowerCase()) || 
          type.toLowerCase().contains(p.petTypeName!.toLowerCase()));
      }).toList();
    }

    if (state.selectedBrands != null && state.selectedBrands!.isNotEmpty) {
      filtered = filtered.where((p) {
        if (p.brandName == null) return false;
        return state.selectedBrands!.any((brand) => 
          p.brandName!.toLowerCase().contains(brand.toLowerCase()));
      }).toList();
    }

    if (state.selectedPriceRange != null) {
      filtered = filtered.where((p) => p.price >= state.selectedPriceRange!.start && p.price <= state.selectedPriceRange!.end).toList();
    }

    if (state.selectedRating != null && state.selectedRating != 'All') {
      final minRating = double.tryParse(state.selectedRating!) ?? 0.0;
      filtered = filtered.where((p) => p.rating >= minRating).toList();
    }

    if (state.availability == true) {
      filtered = filtered.where((p) => p.availableQty == null || p.availableQty! > 0).toList();
    }

    // Sort
    if (state.selectedSort != null) {
      switch (state.selectedSort) {
        case 'Price: Low to High':
          filtered.sort((a, b) => a.price.compareTo(b.price));
          break;
        case 'Price: High to Low':
          filtered.sort((a, b) => b.price.compareTo(a.price));
          break;
        case 'Rating':
          filtered.sort((a, b) => b.rating.compareTo(a.rating));
          break;
        case 'Newest Arrivals':
          filtered.sort((a, b) {
            final aId = int.tryParse(a.id) ?? 0;
            final bId = int.tryParse(b.id) ?? 0;
            return bId.compareTo(aId);
          });
          break;
      }
    }
    return filtered;
  }

  void _onApplyComplexFilters(ApplyComplexFiltersEvent event, Emitter<ProductState> emit) {
    if (state is ProductLoaded) {
      final currentState = state as ProductLoaded;
      
      // Start with either all products or search-filtered products
      List<Product> baseProducts = List.from(_allProducts);
      if (currentState.searchQuery != null && currentState.searchQuery!.isNotEmpty) {
        final query = currentState.searchQuery!.toLowerCase();
        baseProducts = baseProducts.where((p) {
          return p.name.toLowerCase().contains(query) ||
                 p.category.toLowerCase().contains(query) ||
                 (p.productTypeName?.toLowerCase().contains(query) ?? false);
        }).toList();
      }

      // Apply new filters
      List<Product> filtered = _applyFiltersWithCriteria(baseProducts, event);

      emit(ProductLoaded(
        products: _allProducts,
        filteredProducts: filtered,
        searchQuery: currentState.searchQuery,
        selectedSort: event.sort,
        selectedPriceRange: event.priceRange,
        selectedPetTypes: event.petTypes,
        selectedBrands: event.brands,
        selectedRating: event.rating,
        availability: event.availability,
      ));
    }
  }

  List<Product> _applyFiltersWithCriteria(List<Product> products, ApplyComplexFiltersEvent event) {
    List<Product> filtered = List.from(products);

    if (event.petTypes != null && event.petTypes!.isNotEmpty && !event.petTypes!.contains('All')) {
      filtered = filtered.where((p) {
        if (p.petTypeName == null) return false;
        return event.petTypes!.any((type) => 
          p.petTypeName!.toLowerCase().contains(type.toLowerCase()) || 
          type.toLowerCase().contains(p.petTypeName!.toLowerCase()));
      }).toList();
    }

    if (event.brands != null && event.brands!.isNotEmpty) {
      filtered = filtered.where((p) {
        if (p.brandName == null) return false;
        return event.brands!.any((brand) => 
          p.brandName!.toLowerCase().contains(brand.toLowerCase()));
      }).toList();
    }

    if (event.priceRange != null) {
      filtered = filtered.where((p) => p.price >= event.priceRange!.start && p.price <= event.priceRange!.end).toList();
    }

    if (event.rating != null && event.rating != 'All') {
      final minRating = double.tryParse(event.rating!) ?? 0.0;
      filtered = filtered.where((p) => p.rating >= minRating).toList();
    }

    if (event.availability == true) {
      filtered = filtered.where((p) => p.availableQty == null || p.availableQty! > 0).toList();
    }

    if (event.sort != null) {
      switch (event.sort) {
        case 'Price: Low to High':
          filtered.sort((a, b) => a.price.compareTo(b.price));
          break;
        case 'Price: High to Low':
          filtered.sort((a, b) => b.price.compareTo(a.price));
          break;
        case 'Rating':
          filtered.sort((a, b) => b.rating.compareTo(a.rating));
          break;
        case 'Newest Arrivals':
          filtered.sort((a, b) {
            final aId = int.tryParse(a.id) ?? 0;
            final bId = int.tryParse(b.id) ?? 0;
            return bId.compareTo(aId);
          });
          break;
      }
    }
    return filtered;
  }
}
