import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/utils/toaster.dart';
import 'package:nextrestro/features/users/data/models/user_model.dart';
import 'package:nextrestro/features/users/presentation/providers/staff_provider.dart';
import '../landscape/staff_landscape_page.dart';
import 'package:intl/intl.dart';

class StaffPortraitPage extends ConsumerStatefulWidget {
  const StaffPortraitPage({super.key});

  @override
  ConsumerState<StaffPortraitPage> createState() => _StaffPortraitPageState();
}

class _StaffPortraitPageState extends ConsumerState<StaffPortraitPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _roleCustomController = TextEditingController();
  
  String? _selectedRole;
  bool _isCustomRole = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _fullNameController.dispose();
    _phoneController.dispose();
    _roleCustomController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredStaff = ref.watch(filteredStaffProvider);
    final selectedStaff = ref.watch(selectedStaffForViewProvider);
    final isAdding = ref.watch(isAddingStaffProvider);

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Column(
        children: [
          // Tab Bar
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.ashGrey.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  _buildTabItem(0, 'Staff List', Icons.people_outline, !isAdding),
                  _buildTabItem(1, 'Add New', Icons.person_add_alt_1, isAdding),
                ],
              ),
            ),
          ),

          // Search & Filter (Only in list mode)
          if (!isAdding && selectedStaff == null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Column(
                children: [
                  TextField(
                    onChanged: (val) => ref.read(staffSearchQueryProvider.notifier).set(val),
                    decoration: InputDecoration(
                      hintText: 'Search staff...',
                      prefixIcon: const Icon(Icons.search, size: 20),
                      filled: true,
                      fillColor: Colors.white,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 36,
                    child: _RoleFilterChips(),
                  ),
                ],
              ),
            ),

          Expanded(
            child: isAdding 
              ? _buildAddForm() 
              : (selectedStaff != null ? _buildDetailsView(selectedStaff) : _buildList(filteredStaff)),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(int index, String label, IconData icon, bool isSelected) {
    return Expanded(
      child: InkWell(
        onTap: () {
          if (index == 0) {
            ref.read(isAddingStaffProvider.notifier).set(false);
            ref.read(selectedStaffForViewProvider.notifier).select(null);
          } else {
            ref.read(isAddingStaffProvider.notifier).set(true);
            ref.read(selectedStaffForViewProvider.notifier).select(null);
          }
        },
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 16, color: isSelected ? AppColors.primary : AppColors.grey),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? AppColors.primary : AppColors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildList(List<UserModel> list) {
    if (list.isEmpty) return const Center(child: Text('No staff found', style: TextStyle(color: AppColors.grey)));
    return RefreshIndicator(
      onRefresh: () => ref.refresh(allStaffProvider.future),
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: list.length,
        itemBuilder: (context, index) {
          final user = list[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: const BorderSide(color: AppColors.ashGrey, width: 0.5),
            ),
            child: ListTile(
              onTap: () => ref.read(selectedStaffForViewProvider.notifier).select(user),
              leading: CircleAvatar(
                backgroundColor: _getRoleColor(user.role ?? '').withOpacity(0.1),
                child: Text(
                  user.fullName?.isNotEmpty == true ? user.fullName![0].toUpperCase() : 'S',
                  style: TextStyle(color: _getRoleColor(user.role ?? ''), fontWeight: FontWeight.bold),
                ),
              ),
              title: Text(user.fullName ?? 'No Name', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              subtitle: Text(user.role ?? 'No Role', style: const TextStyle(fontSize: 12)),
              trailing: const Icon(Icons.chevron_right, size: 20, color: AppColors.ashGrey),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDetailsView(UserModel selected) {
    final detailsAsync = ref.watch(staffDetailsProvider(selected.userID!));

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            onTap: () => ref.read(selectedStaffForViewProvider.notifier).select(null),
            child: const Row(
              children: [
                Icon(Icons.arrow_back_ios, size: 14, color: AppColors.primary),
                Text('Back to list', style: TextStyle(fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        Expanded(
          child: detailsAsync.when(
            data: (user) => SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: _getRoleColor(user.role ?? '').withOpacity(0.1),
                          child: Text(
                            user.fullName?.isNotEmpty == true ? user.fullName![0].toUpperCase() : 'S',
                            style: TextStyle(color: _getRoleColor(user.role ?? ''), fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(user.fullName ?? '', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        Text('@${user.username}', style: const TextStyle(color: AppColors.grey)),
                        const SizedBox(height: 8),
                        _StatusChip(isActive: user.isActive ?? true),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  _DetailItem(label: 'Role', value: user.role ?? 'N/A', icon: Icons.work_outline),
                  _DetailItem(label: 'Email', value: user.email ?? 'N/A', icon: Icons.email_outlined),
                  _DetailItem(label: 'Phone', value: user.phone ?? 'N/A', icon: Icons.phone_outlined),
                  _DetailItem(label: 'Hire Date', value: user.hireDate != null ? DateFormat('yyyy-MM-dd').format(DateTime.parse(user.hireDate!)) : 'N/A', icon: Icons.calendar_today_outlined),
                ],
              ),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Error: $e')),
          ),
        ),
      ],
    );
  }

  Widget _buildAddForm() {
    final roles = ref.watch(staffRolesProvider).where((r) => r != 'All').toList();
    final registerState = ref.watch(registerStaffStateProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildField('Full Name', _fullNameController, icon: Icons.person_outline),
            const SizedBox(height: 12),
            _buildField('Username', _usernameController, icon: Icons.alternate_email),
            const SizedBox(height: 12),
            _buildField('Email', _emailController, icon: Icons.email_outlined, keyboardType: TextInputType.emailAddress),
            const SizedBox(height: 12),
            _buildField('Phone', _phoneController, icon: Icons.phone_outlined, keyboardType: TextInputType.phone),
            const SizedBox(height: 12),
            _buildField('Password', _passwordController, icon: Icons.lock_outline, isPassword: true),
            const SizedBox(height: 12),
            
            const Text('Role', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Row(
              children: [
                Expanded(
                  child: _isCustomRole 
                    ? TextFormField(
                        controller: _roleCustomController,
                        decoration: _inputDecoration(hint: 'Custom role'),
                        validator: (v) => v!.isEmpty ? 'Required' : null,
                      )
                    : DropdownButtonFormField<String>(
                        value: _selectedRole,
                        decoration: _inputDecoration(),
                        items: roles.map((r) => DropdownMenuItem(value: r, child: Text(r, style: const TextStyle(fontSize: 13)))).toList(),
                        onChanged: (val) => setState(() => _selectedRole = val),
                        validator: (v) => v == null ? 'Required' : null,
                      ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () => setState(() => _isCustomRole = !_isCustomRole),
                  icon: Icon(_isCustomRole ? Icons.list : Icons.add),
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.primary.withOpacity(0.1),
                    foregroundColor: AppColors.primary,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: registerState.isLoading ? null : _handleRegister,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: registerState.isLoading 
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text('REGISTER STAFF', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildField(String label, TextEditingController controller, {IconData? icon, bool isPassword = false, TextInputType? keyboardType}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          obscureText: isPassword,
          keyboardType: keyboardType,
          style: const TextStyle(fontSize: 13),
          decoration: _inputDecoration(icon: icon),
          validator: (val) => val == null || val.isEmpty ? 'Required' : null,
        ),
      ],
    );
  }

  InputDecoration _inputDecoration({String? hint, IconData? icon}) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: icon != null ? Icon(icon, size: 18, color: AppColors.grey) : null,
      filled: true,
      fillColor: Colors.white,
      isDense: true,
      contentPadding: const EdgeInsets.all(12),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: AppColors.ashGrey)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: AppColors.ashGrey)),
    );
  }

  void _resetForm() {
    _usernameController.clear();
    _passwordController.clear();
    _emailController.clear();
    _fullNameController.clear();
    _phoneController.clear();
    _roleCustomController.clear();
    setState(() {
      _selectedRole = null;
      _isCustomRole = false;
    });
  }

  Future<void> _handleRegister() async {
    if (!_formKey.currentState!.validate()) return;
    final role = _isCustomRole ? _roleCustomController.text : _selectedRole;
    final data = {
      "username": _usernameController.text,
      "password": _passwordController.text,
      "email": _emailController.text,
      "fullName": _fullNameController.text,
      "phone": _phoneController.text,
      "role": role,
    };
    await ref.read(registerStaffStateProvider.notifier).register(data);
    final state = ref.read(registerStaffStateProvider);
    if (state.hasError) {
      if (mounted) Toaster.error(context: context, message: state.error.toString());
    } else {
      if (mounted) {
        Toaster.success(context: context, message: 'Success');
        _resetForm();
        ref.read(isAddingStaffProvider.notifier).set(false);
      }
    }
  }
}

class _RoleFilterChips extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roles = ref.watch(staffRolesProvider);
    final active = ref.watch(staffRoleFilterProvider);

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: roles.length,
      itemBuilder: (context, index) {
        final role = roles[index];
        final isSelected = active == role;
        return Padding(
          padding: const EdgeInsets.only(right: 8),
          child: FilterChip(
            label: Text(role, style: TextStyle(fontSize: 11, color: isSelected ? Colors.white : AppColors.grey)),
            selected: isSelected,
            onSelected: (v) => ref.read(staffRoleFilterProvider.notifier).set(role),
            selectedColor: AppColors.primary,
            backgroundColor: Colors.white,
            checkmarkColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), 
              side: BorderSide(color: isSelected ? AppColors.primary : AppColors.ashGrey)
            ),
          ),
        );
      },
    );
  }
}

class _DetailItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  const _DetailItem({required this.label, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColors.grey),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(fontSize: 11, color: AppColors.grey)),
              Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final bool isActive;
  const _StatusChip({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: (isActive ? Colors.green : Colors.red).withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        isActive ? 'ACTIVE' : 'INACTIVE',
        style: TextStyle(color: isActive ? Colors.green : Colors.red, fontWeight: FontWeight.bold, fontSize: 10),
      ),
    );
  }
}

Color _getRoleColor(String role) {
  switch (role.toLowerCase()) {
    case 'admin': return Colors.deepPurple;
    case 'manager': return Colors.blue;
    case 'waiter': return Colors.orange;
    case 'cashier': return Colors.green;
    case 'kitchen': return Colors.red;
    default: return AppColors.primary;
  }
}
