import 'package:equatable/equatable.dart';

class ProductTypeEntity extends Equatable {
  final int productTypeId;
  final String productTypeName;
  final String? description;
  final bool? isActive;

  const ProductTypeEntity({
    required this.productTypeId,
    required this.productTypeName,
    this.description,
    this.isActive,
  });

  @override
  List<Object?> get props => [productTypeId, productTypeName, description, isActive];
}
