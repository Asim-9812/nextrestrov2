import 'package:nextrestro/features/department/data/models/department_model.dart';

abstract class DepartmentRepository {
  Future<List<DepartmentModel>> getDepartments();
  Future<DepartmentModel> getDepartmentById(int id);
  Future<void> createDepartment(DepartmentModel department);
  Future<void> updateDepartment(DepartmentModel department);
  Future<void> deleteDepartment(int id);
}
