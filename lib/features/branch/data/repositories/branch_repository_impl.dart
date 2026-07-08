import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:nextrestro/core/network/api_client.dart';
import 'package:nextrestro/core/network/api_constants.dart';
import 'package:nextrestro/features/branch/data/models/branch_model.dart';
import 'package:nextrestro/features/branch/domain/repositories/branch_repository.dart';

final branchRepositoryProvider = Provider<BranchRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return BranchRepositoryImpl(apiClient);
});

class BranchRepositoryImpl implements BranchRepository {
  final ApiClient _apiClient;
  final Logger _logger = Logger();

  BranchRepositoryImpl(this._apiClient);

  @override
  Future<List<BranchModel>> getBranchesByCompany(int companyId) async {
    try {
      _logger.i('Fetching branches for company ID: $companyId');
      final endpoint = ApiConstants.getBranchByCompanyEndpoint
          .replaceFirst(':companyId', companyId.toString());
      final response = await _apiClient.get(endpoint);
      if (response.data is List) {
        final branches = (response.data as List)
            .map((e) => BranchModel.fromJson(e as Map<String, dynamic>))
            .toList();
        _logger.i('Fetched ${branches.length} branches');
        return branches;
      }
      return [];
    } catch (e) {
      _logger.e('Failed to fetch branches', error: e);
      rethrow;
    }
  }

  @override
  Future<BranchModel> getBranchDetail(int id) async {
    try {
      _logger.i('Fetching branch details for ID: $id');
      final endpoint = ApiConstants.getBranchDetailEndpoint
          .replaceFirst(':id', id.toString());
      final response = await _apiClient.get(endpoint);
      
      final branch = BranchModel.fromJson(response.data as Map<String, dynamic>);
      _logger.i('Fetched details for branch: ${branch.branchName}');
      return branch;
    } catch (e) {
      _logger.e('Failed to fetch branch details for ID: $id', error: e);
      rethrow;
    }
  }

  @override
  Future<void> createBranch(BranchModel branch) async {
    try {
      _logger.i('Creating new branch: ${branch.branchName}');
      await _apiClient.post(
        ApiConstants.createBranchEndpoint,
        data: branch.toJson(),
      );
      _logger.i('Branch created successfully');
    } catch (e) {
      _logger.e('Failed to create branch', error: e);
      rethrow;
    }
  }

  @override
  Future<void> updateBranch(BranchModel branch) async {
    try {
      _logger.i('Updating branch with ID: ${branch.branchID}');
      final endpoint = ApiConstants.updateBranchEndpoint
          .replaceFirst(':id', branch.branchID.toString());
      await _apiClient.put(
        endpoint,
        data: branch.toJson(),
      );
      _logger.i('Branch updated successfully');
    } catch (e) {
      _logger.e('Failed to update branch', error: e);
      rethrow;
    }
  }

  @override
  Future<void> deleteBranch(int id) async {
    try {
      _logger.i('Deleting branch with ID: $id');
      final endpoint = ApiConstants.deleteBranchEndpoint
          .replaceFirst(':id', id.toString());
      await _apiClient.delete(endpoint);
      _logger.i('Branch deleted successfully');
    } catch (e) {
      _logger.e('Failed to delete branch', error: e);
      rethrow;
    }
  }
}
