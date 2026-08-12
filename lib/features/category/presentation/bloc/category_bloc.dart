import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/category_repository.dart';
import 'category_event.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryBloc({required this.categoryRepository}) : super(CategoryInitial()) {
    on<GetAllCategoriesEvent>(_onGetAllCategories);
  }

  Future<void> _onGetAllCategories(GetAllCategoriesEvent event, Emitter<CategoryState> emit) async {
    emit(CategoryLoading());
    final result = await categoryRepository.getAllCategories();
    result.fold(
      (failure) => emit(CategoryError(failure.message)),
      (categories) => emit(CategoryLoaded(categories)),
    );
  }
}
