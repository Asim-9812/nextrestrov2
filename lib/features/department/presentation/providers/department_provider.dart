import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:nextrestro/features/department/data/models/department_model.dart';
import 'package:nextrestro/features/department/data/repositories/department_repository_impl.dart';

part 'department_provider.g.dart';

@riverpod
Future<List<DepartmentModel>> departments(Ref ref) async {
  final repository = ref.watch(departmentRepositoryProvider);
  return repository.getDepartments();
}

@riverpod
class DepartmentSearchQuery extends _$DepartmentSearchQuery {
  @override
  String build() => '';

  void set(String query) => state = query;
}

@Riverpod(keepAlive: true)
class SelectedDepartmentForEdit extends _$SelectedDepartmentForEdit {
  @override
  DepartmentModel? build() => null;

  void select(DepartmentModel? department) => state = department;
}

@riverpod
class IsAddingDepartment extends _$IsAddingDepartment {
  @override
  bool build() => false;

  void set(bool value) => state = value;
}

@riverpod
class AddDepartmentState extends _$AddDepartmentState {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> createDepartment(DepartmentModel department) async {
    final link = ref.keepAlive();
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(departmentRepositoryProvider);
      await repository.createDepartment(department);
      ref.invalidate(departmentsProvider);
      state = const AsyncValue.data(null);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    } finally {
      link.close();
    }
  }
}

@riverpod
class UpdateDepartmentState extends _$UpdateDepartmentState {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> updateDepartment(DepartmentModel department) async {
    final link = ref.keepAlive();
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(departmentRepositoryProvider);
      await repository.updateDepartment(department);
      ref.invalidate(departmentsProvider);
      state = const AsyncValue.data(null);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    } finally {
      link.close();
    }
  }
}

@riverpod
class DeleteDepartmentState extends _$DeleteDepartmentState {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> deleteDepartment(int departmentId) async {
    final link = ref.keepAlive();
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(departmentRepositoryProvider);
      await repository.deleteDepartment(departmentId);
      ref.invalidate(departmentsProvider);
      state = const AsyncValue.data(null);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    } finally {
      link.close();
    }
  }
}

@riverpod
List<DepartmentModel> filteredDepartments(Ref ref) {
  final departmentsAsync = ref.watch(departmentsProvider);
  final search = ref.watch(departmentSearchQueryProvider).toLowerCase();

  return departmentsAsync.maybeWhen(
    data: (departments) {
      return departments.where((d) {
        return d.departmentName.toLowerCase().contains(search);
      }).toList();
    },
    orElse: () => [],
  );
}
