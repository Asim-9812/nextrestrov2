import 'package:equatable/equatable.dart';
import '../../domain/entities/product.dart';

abstract class ProductVariantState extends Equatable {
  const ProductVariantState();

  @override
  List<Object?> get props => [];
}

class ProductVariantInitial extends ProductVariantState {}

class ProductVariantLoading extends ProductVariantState {}

class ProductVariantLoaded extends ProductVariantState {
  final List<ProductVariant> variants;

  const ProductVariantLoaded(this.variants);

  @override
  List<Object?> get props => [variants];
}

class ProductVariantError extends ProductVariantState {
  final String message;

  const ProductVariantError(this.message);

  @override
  List<Object?> get props => [message];
}
