import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/product.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> products;
  final List<Product> filteredProducts;
  final String? searchQuery;
  
  // Filter Criteria
  final String? selectedSort;
  final RangeValues? selectedPriceRange;
  final List<String>? selectedPetTypes;
  final List<String>? selectedBrands;
  final String? selectedRating;
  final bool? availability;

  const ProductLoaded({
    required this.products,
    required this.filteredProducts,
    this.searchQuery,
    this.selectedSort,
    this.selectedPriceRange,
    this.selectedPetTypes,
    this.selectedBrands,
    this.selectedRating,
    this.availability,
  });

  @override
  List<Object?> get props => [
        products,
        filteredProducts,
        searchQuery,
        selectedSort,
        selectedPriceRange,
        selectedPetTypes,
        selectedBrands,
        selectedRating,
        availability,
      ];
}

class ProductError extends ProductState {
  final String message;
  const ProductError(this.message);

  @override
  List<Object?> get props => [message];
}
