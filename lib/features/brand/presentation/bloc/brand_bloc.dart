import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/brand_repository.dart';
import 'brand_event.dart';
import 'brand_state.dart';

class BrandBloc extends Bloc<BrandEvent, BrandState> {
  final BrandRepository brandRepository;

  BrandBloc({required this.brandRepository}) : super(BrandInitial()) {
    on<GetAllBrandsEvent>(_onGetAllBrands);
  }

  Future<void> _onGetAllBrands(GetAllBrandsEvent event, Emitter<BrandState> emit) async {
    emit(BrandLoading());
    final result = await brandRepository.getAllBrands();
    result.fold(
      (failure) => emit(BrandError(failure.message)),
      (brands) => emit(BrandLoaded(brands)),
    );
  }
}
