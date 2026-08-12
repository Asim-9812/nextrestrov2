import 'package:equatable/equatable.dart';
import '../../domain/entities/pet_type_entity.dart';

abstract class PetTypeState extends Equatable {
  const PetTypeState();

  @override
  List<Object?> get props => [];
}

class PetTypeInitial extends PetTypeState {}

class PetTypeLoading extends PetTypeState {}

class PetTypeLoaded extends PetTypeState {
  final List<PetTypeEntity> petTypes;
  const PetTypeLoaded(this.petTypes);

  @override
  List<Object?> get props => [petTypes];
}

class PetTypeError extends PetTypeState {
  final String message;
  const PetTypeError(this.message);

  @override
  List<Object?> get props => [message];
}
