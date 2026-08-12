import 'package:equatable/equatable.dart';

abstract class PetTypeEvent extends Equatable {
  const PetTypeEvent();

  @override
  List<Object> get props => [];
}

class GetAllPetTypesEvent extends PetTypeEvent {}
