import 'package:equatable/equatable.dart';

class PetTypeEntity extends Equatable {
  final int id;
  final String petTypeName;
  final String? description;
  final bool? isActive;

  const PetTypeEntity({
    required this.id,
    required this.petTypeName,
    this.description,
    this.isActive,
  });

  @override
  List<Object?> get props => [id, petTypeName, description, isActive];
}
