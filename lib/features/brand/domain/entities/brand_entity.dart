import 'package:equatable/equatable.dart';

class BrandEntity extends Equatable {
  final int brandId;
  final String brandName;
  final String? description;
  final bool? isActive;

  const BrandEntity({
    required this.brandId,
    required this.brandName,
    this.description,
    this.isActive,
  });

  @override
  List<Object?> get props => [brandId, brandName, description, isActive];
}
