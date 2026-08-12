import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/pet_type_repository.dart';
import 'pet_type_event.dart';
import 'pet_type_state.dart';

class PetTypeBloc extends Bloc<PetTypeEvent, PetTypeState> {
  final PetTypeRepository petTypeRepository;

  PetTypeBloc({required this.petTypeRepository}) : super(PetTypeInitial()) {
    on<GetAllPetTypesEvent>(_onGetAllPetTypes);
  }

  Future<void> _onGetAllPetTypes(GetAllPetTypesEvent event, Emitter<PetTypeState> emit) async {
    emit(PetTypeLoading());
    final result = await petTypeRepository.getAllPetTypes();
    result.fold(
      (failure) => emit(PetTypeError(failure.message)),
      (petTypes) => emit(PetTypeLoaded(petTypes)),
    );
  }
}
