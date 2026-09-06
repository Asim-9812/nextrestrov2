import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];
}

class GetAllProductsEvent extends ProductEvent {}

class SearchProductsEvent extends ProductEvent {
  final String query;
  const SearchProductsEvent(this.query);

  @override
  List<Object?> get props => [query];
}

class FilterProductsByPetTypeEvent extends ProductEvent {
  final int petTypeId;
  const FilterProductsByPetTypeEvent(this.petTypeId);

  @override
  List<Object?> get props => [petTypeId];
}

class FilterProductsByCategoryEvent extends ProductEvent {
  final int categoryId;
  const FilterProductsByCategoryEvent(this.categoryId);

  @override
  List<Object?> get props => [categoryId];
}

class FilterProductsByProductTypeEvent extends ProductEvent {
  final int productTypeId;
  const FilterProductsByProductTypeEvent(this.productTypeId);

  @override
  List<Object?> get props => [productTypeId];
}

class FilterProductsByBrandEvent extends ProductEvent {
  final int brandId;
  const FilterProductsByBrandEvent(this.brandId);

  @override
  List<Object?> get props => [brandId];
}

class FilterProductsByMultipleCriteriaEvent extends ProductEvent {
  final List<int> categoryIds;
  final List<int> petTypeIds;

  const FilterProductsByMultipleCriteriaEvent({
    required this.categoryIds,
    required this.petTypeIds,
  });

  @override
  List<Object?> get props => [categoryIds, petTypeIds];
}
