import 'package:equatable/equatable.dart';
import '../../domain/entities/product_type_entity.dart';

abstract class ProductTypeState extends Equatable {
  const ProductTypeState();

  @override
  List<Object?> get props => [];
}

class ProductTypeInitial extends ProductTypeState {}

class ProductTypeLoading extends ProductTypeState {}

class ProductTypeLoaded extends ProductTypeState {
  final List<ProductTypeEntity> productTypes;
  const ProductTypeLoaded(this.productTypes);

  @override
  List<Object?> get props => [productTypes];
}

class ProductTypeError extends ProductTypeState {
  final String message;
  const ProductTypeError(this.message);

  @override
  List<Object?> get props => [message];
}
