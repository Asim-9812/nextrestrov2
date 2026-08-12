import '../../domain/entities/pet_type_entity.dart';

class PetTypeModel extends PetTypeEntity {
  const PetTypeModel({
    required super.id,
    required super.petTypeName,
    super.description,
    super.isActive,
  });

  factory PetTypeModel.fromJson(Map<String, dynamic> json) {
    return PetTypeModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      petTypeName: json['petTypeName'] ?? '',
      description: json['description'],
      isActive: json['isActive'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'petTypeName': petTypeName,
      'description': description,
      'isActive': isActive,
    };
  }
}
