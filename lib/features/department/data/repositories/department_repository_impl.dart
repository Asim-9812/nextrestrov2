import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:nextrestro/core/network/api_client.dart';
import 'package:nextrestro/core/network/api_constants.dart';
import 'package:nextrestro/features/department/data/models/department_model.dart';
import 'package:nextrestro/features/department/domain/repositories/department_repository.dart';

final departmentRepositoryProvider = Provider<DepartmentRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return DepartmentRepositoryImpl(apiClient);
});

class DepartmentRepositoryImpl implements DepartmentRepository {
  final ApiClient _apiClient;
  final Logger _logger = Logger();

  DepartmentRepositoryImpl(this._apiClient);

  @override
  Future<List<DepartmentModel>> getDepartments() async {
    try {
      _logger.i('Fetching departments list');
      final response = await _apiClient.get(ApiConstants.getDepartmentsEndpoint);
      if (response.data is List) {
        final departments = (response.data as List)
            .map((e) => DepartmentModel.fromJson(e as Map<String, dynamic>))
            .toList();
        _logger.i('Fetched ${departments.length} departments');
        return departments;
      }
      return [];
    } catch (e) {
      _logger.e('Failed to fetch departments', error: e);
      rethrow;
    }
  }

  @override
  Future<DepartmentModel> getDepartmentById(int id) async {
    try {
      _logger.i('Fetching department details for ID: $id');
      final endpoint = ApiConstants.getDepartmentByIdEndpoint
          .replaceFirst(':id', id.toString());
      final response = await _apiClient.get(endpoint);
      
      final department = DepartmentModel.fromJson(response.data as Map<String, dynamic>);
      _logger.i('Fetched details for department: ${department.departmentName}');
      return department;
    } catch (e) {
      _logger.e('Failed to fetch department details for ID: $id', error: e);
      rethrow;
    }
  }

  @override
  Future<void> createDepartment(DepartmentModel department) async {
    try {
      _logger.i('Creating new department: ${department.departmentName}');
      await _apiClient.post(
        ApiConstants.createDepartmentEndpoint,
        data: department.toJson(),
      );
      _logger.i('Department created successfully');
    } catch (e) {
      _logger.e('Failed to create department', error: e);
      rethrow;
    }
  }

  @override
  Future<void> updateDepartment(DepartmentModel department) async {
    try {
      _logger.i('Updating department: ${department.departmentName}');
      await _apiClient.put(
        ApiConstants.updateDepartmentEndpoint,
        data: department.toJson(),
      );
      _logger.i('Department updated successfully');
    } catch (e) {
      _logger.e('Failed to update department', error: e);
      rethrow;
    }
  }

  @override
  Future<void> deleteDepartment(int id) async {
    try {
      _logger.i('Deleting department with ID: $id');
      final endpoint = ApiConstants.deleteDepartmentEndpoint
          .replaceFirst(':id', id.toString());
      await _apiClient.delete(endpoint);
      _logger.i('Department deleted successfully');
    } catch (e) {
      _logger.e('Failed to delete department', error: e);
      rethrow;
    }
  }
}
