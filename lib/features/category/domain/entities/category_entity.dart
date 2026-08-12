import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final int categoryId;
  final String categoryName;
  final String? description;
  final bool? isActive;

  const CategoryEntity({
    required this.categoryId,
    required this.categoryName,
    this.description,
    this.isActive,
  });

  @override
  List<Object?> get props => [categoryId, categoryName, description, isActive];
}
