import 'package:nextrestro/core/network/session_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:nextrestro/features/branch/data/models/branch_model.dart';
import 'package:nextrestro/features/branch/data/repositories/branch_repository_impl.dart';

part 'branch_provider.g.dart';

@riverpod
Future<List<BranchModel>> branches(Ref ref) async {
  final repository = ref.watch(branchRepositoryProvider);
  final sessionService = ref.read(sessionServiceProvider);
  final user = sessionService.getUser();
  // Assume companyID 1 if not found for now, or fetch from user session
  final companyId = user?['companyId'] ?? 1;
  return repository.getBranchesByCompany(companyId);
}

@riverpod
class BranchSearchQuery extends _$BranchSearchQuery {
  @override
  String build() => '';

  void set(String query) => state = query;
}

@Riverpod(keepAlive: true)
class SelectedBranchForEdit extends _$SelectedBranchForEdit {
  @override
  BranchModel? build() => null;

  void select(BranchModel? branch) => state = branch;
}

@riverpod
class IsAddingBranch extends _$IsAddingBranch {
  @override
  bool build() => false;

  void set(bool value) => state = value;
}

@riverpod
class AddBranchState extends _$AddBranchState {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> createBranch(BranchModel branch) async {
    final link = ref.keepAlive();
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(branchRepositoryProvider);
      await repository.createBranch(branch);
      ref.invalidate(branchesProvider);
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
class UpdateBranchState extends _$UpdateBranchState {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> updateBranch(BranchModel branch) async {
    final link = ref.keepAlive();
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(branchRepositoryProvider);
      await repository.updateBranch(branch);
      ref.invalidate(branchesProvider);
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
class DeleteBranchState extends _$DeleteBranchState {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> deleteBranch(int branchId) async {
    final link = ref.keepAlive();
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(branchRepositoryProvider);
      await repository.deleteBranch(branchId);
      ref.invalidate(branchesProvider);
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
List<BranchModel> filteredBranches(Ref ref) {
  final branchesAsync = ref.watch(branchesProvider);
  final search = ref.watch(branchSearchQueryProvider).toLowerCase();

  return branchesAsync.maybeWhen(
    data: (branches) {
      return branches.where((b) {
        return b.branchName.toLowerCase().contains(search) || 
               b.address.toLowerCase().contains(search);
      }).toList();
    },
    orElse: () => [],
  );
}
