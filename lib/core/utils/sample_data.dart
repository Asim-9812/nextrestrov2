import '../../features/brand/domain/entities/brand_entity.dart';
import '../../features/pet_type/domain/entities/pet_type_entity.dart';

final List<PetTypeEntity> samplePetTypes = [
  const PetTypeEntity(id: 1, petTypeName: 'Dog'),
  const PetTypeEntity(id: 2, petTypeName: 'Cat'),
  const PetTypeEntity(id: 3, petTypeName: 'Bird'),
  const PetTypeEntity(id: 4, petTypeName: 'Fish'),
  const PetTypeEntity(id: 5, petTypeName: 'Rabbit'),
  const PetTypeEntity(id: 6, petTypeName: 'Hamster'),
];

final List<BrandEntity> sampleBrands = [
  const BrandEntity(brandId: 1, brandName: 'Pedigree'),
  const BrandEntity(brandId: 2, brandName: 'Royal Canin'),
  const BrandEntity(brandId: 3, brandName: 'Whiskas'),
  const BrandEntity(brandId: 4, brandName: 'Drools'),
  const BrandEntity(brandId: 5, brandName: 'Purina'),
  const BrandEntity(brandId: 6, brandName: 'Meow Mix'),
];
