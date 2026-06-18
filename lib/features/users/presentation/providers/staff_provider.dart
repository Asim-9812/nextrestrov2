import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:nextrestro/features/users/data/models/user_model.dart';
import 'package:nextrestro/features/users/data/repositories/user_repository_impl.dart';

part 'staff_provider.g.dart';

@riverpod
Future<List<UserModel>> allStaff(Ref ref) async {
  final repository = ref.watch(userRepositoryProvider);
  final result = await repository.getAllUsers();
  return result.fold(
    (l) => throw Exception(l.message),
    (r) => r,
  );
}

@riverpod
class StaffSearchQuery extends _$StaffSearchQuery {
  @override
  String build() => '';

  void set(String query) => state = query;
}

@riverpod
class StaffRoleFilter extends _$StaffRoleFilter {
  @override
  String build() => 'All';

  void set(String role) => state = role;
}

@riverpod
List<UserModel> filteredStaff(Ref ref) {
  final staffAsync = ref.watch(allStaffProvider);
  final search = ref.watch(staffSearchQueryProvider).toLowerCase();
  final roleFilter = ref.watch(staffRoleFilterProvider);

  return staffAsync.maybeWhen(
    data: (staff) {
      return staff.where((s) {
        final fullName = s.fullName?.toLowerCase() ?? '';
        final username = s.username?.toLowerCase() ?? '';
        final phone = s.phone ?? '';
        final role = s.role ?? '';

        final matchesSearch = fullName.contains(search) || 
                            username.contains(search) || 
                            phone.contains(search);
        
        final matchesRole = roleFilter == 'All' || role.toLowerCase() == roleFilter.toLowerCase();

        return matchesSearch && matchesRole;
      }).toList();
    },
    orElse: () => [],
  );
}

@riverpod
List<String> staffRoles(Ref ref) {
  final staffAsync = ref.watch(allStaffProvider);
  return staffAsync.maybeWhen(
    data: (staff) {
      final roles = staff.map((s) {
        final r = s.role ?? 'Unknown';
        if (r.isEmpty) return 'Unknown';
        // Normalize to Title Case (Admin, Waiter, etc.)
        return r[0].toUpperCase() + r.substring(1).toLowerCase();
      }).toSet().toList();

      roles.sort();
      return ['All', ...roles];
    },
    orElse: () => ['All'],
  );
}

@Riverpod(keepAlive: true)
class SelectedStaffForView extends _$SelectedStaffForView {
  @override
  UserModel? build() => null;

  void select(UserModel? user) => state = user;
}

@riverpod
class IsAddingStaff extends _$IsAddingStaff {
  @override
  bool build() => false;

  void set(bool value) => state = value;
}

@riverpod
Future<UserModel> staffDetails(Ref ref, int userId) async {
  final repository = ref.watch(userRepositoryProvider);
  final result = await repository.getUserById(userId);
  return result.fold(
    (l) => throw Exception(l.message),
    (r) => r,
  );
}

@riverpod
class RegisterStaffState extends _$RegisterStaffState {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> register(Map<String, dynamic> data) async {
    state = const AsyncValue.loading();
    final repository = ref.read(userRepositoryProvider);
    final result = await repository.register(data);
    
    result.fold(
      (l) => state = AsyncValue.error(l.message, StackTrace.current),
      (r) {
        state = const AsyncValue.data(null);
        ref.invalidate(allStaffProvider);
      },
    );
  }
}
