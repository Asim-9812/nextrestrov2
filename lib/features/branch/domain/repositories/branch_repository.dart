import 'package:nextrestro/features/branch/data/models/branch_model.dart';

abstract class BranchRepository {
  Future<List<BranchModel>> getBranchesByCompany(int companyId);
  Future<BranchModel> getBranchDetail(int id);
  Future<void> createBranch(BranchModel branch);
  Future<void> updateBranch(BranchModel branch);
  Future<void> deleteBranch(int id);
}
