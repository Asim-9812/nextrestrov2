import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/product_type_repository.dart';
import 'product_type_event.dart';
import 'product_type_state.dart';

class ProductTypeBloc extends Bloc<ProductTypeEvent, ProductTypeState> {
  final ProductTypeRepository productTypeRepository;

  ProductTypeBloc({required this.productTypeRepository}) : super(ProductTypeInitial()) {
    on<GetAllProductTypesEvent>(_onGetAllProductTypes);
  }

  Future<void> _onGetAllProductTypes(GetAllProductTypesEvent event, Emitter<ProductTypeState> emit) async {
    emit(ProductTypeLoading());
    final result = await productTypeRepository.getAllProductTypes();
    result.fold(
      (failure) => emit(ProductTypeError(failure.message)),
      (productTypes) => emit(ProductTypeLoaded(productTypes)),
    );
  }
}
