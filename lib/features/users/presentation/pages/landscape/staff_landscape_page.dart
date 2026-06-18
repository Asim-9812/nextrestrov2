import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/utils/toaster.dart';
import 'package:nextrestro/features/users/data/models/user_model.dart';
import 'package:nextrestro/features/users/presentation/providers/staff_provider.dart';
import 'package:intl/intl.dart';

class StaffLandscapePage extends ConsumerWidget {
  const StaffLandscapePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final staffAsync = ref.watch(allStaffProvider);
    final filteredStaff = ref.watch(filteredStaffProvider);

    return Column(
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Staff Management',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Manrope',
                      ),
                    ),
                    Text(
                      'Manage your restaurant employees and roles',
                      style: TextStyle(color: AppColors.grey, fontSize: 13),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: TextField(
                  onChanged: (val) => ref.read(staffSearchQueryProvider.notifier).set(val),
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    hintText: 'Search by name, username...',
                    prefixIcon: const Icon(Icons.search, color: AppColors.primary),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 1, color: AppColors.ashGrey),
        
        Expanded(
          child: Row(
            children: [
              // Left Section - Staff List
              Expanded(
                flex: 1,
                child: Container(
                  color: AppColors.bg,
                  child: staffAsync.when(
                    data: (_) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                ref.read(isAddingStaffProvider.notifier).set(true);
                                ref.read(selectedStaffForViewProvider.notifier).select(null);
                              },
                              icon: const Icon(Icons.person_add_alt_1, size: 18),
                              label: const Text('Add New Staff'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                foregroundColor: Colors.white,
                                minimumSize: const Size(double.infinity, 48),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                elevation: 0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: _RoleFilterDropdown(),
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                            child: filteredStaff.isEmpty 
                              ? const Center(child: Text('No staff members found', style: TextStyle(color: AppColors.grey)))
                              : RefreshIndicator(
                                  onRefresh: () => ref.refresh(allStaffProvider.future),
                                  child: ListView.builder(
                                    padding: const EdgeInsets.all(16),
                                    itemCount: filteredStaff.length,
                                    itemBuilder: (context, index) {
                                      return StaffListCard(user: filteredStaff[index]);
                                    },
                                  ),
                                ),
                          ),
                        ],
                      );
                    },
                    loading: () => const Center(child: CircularProgressIndicator()),
                    error: (err, _) => Center(child: Text('Error: $err')),
                  ),
                ),
              ),
              const VerticalDivider(width: 1, color: AppColors.ashGrey),
              // Right Section - Details / Add Form
              const Expanded(
                flex: 2,
                child: StaffContentSection(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _RoleFilterDropdown extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roles = ref.watch(staffRolesProvider);
    final selectedRole = ref.watch(staffRoleFilterProvider);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.ashGrey),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: roles.contains(selectedRole) ? selectedRole : 'All',
          isExpanded: true,
          style: const TextStyle(fontSize: 12, color: Colors.black),
          items: roles.map((role) {
            return DropdownMenuItem(value: role, child: Text(role));
          }).toList(),
          onChanged: (val) {
            if (val != null) ref.read(staffRoleFilterProvider.notifier).set(val);
          },
        ),
      ),
    );
  }
}

class StaffListCard extends ConsumerWidget {
  final UserModel user;
  const StaffListCard({super.key, required this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedStaffForViewProvider);
    final isAdding = ref.watch(isAddingStaffProvider);
    final isSelected = selected?.userID == user.userID;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          ref.read(selectedStaffForViewProvider.notifier).select(user);
          ref.read(isAddingStaffProvider.notifier).set(false);
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: (isSelected && !isAdding) ? AppColors.primary : Colors.transparent,
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              _StaffAvatar(role: user.role ?? '', name: user.fullName ?? ''),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.fullName ?? 'No Name',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                    Text(
                      user.role ?? 'No Role',
                      style: TextStyle(color: _getRoleColor(user.role ?? ''), fontSize: 11, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              if (user.isActive == false)
                const Icon(Icons.block, color: AppColors.error, size: 16),
              const Icon(Icons.chevron_right, color: AppColors.ashGrey),
            ],
          ),
        ),
      ),
    );
  }
}

class _StaffAvatar extends StatelessWidget {
  final String role;
  final String name;
  const _StaffAvatar({required this.role, required this.name});

  @override
  Widget build(BuildContext context) {
    final color = _getRoleColor(role);
    return CircleAvatar(
      radius: 20,
      backgroundColor: color.withOpacity(0.1),
      child: Text(
        name.isNotEmpty ? name[0].toUpperCase() : 'S',
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
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

class StaffContentSection extends ConsumerWidget {
  const StaffContentSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAdding = ref.watch(isAddingStaffProvider);
    if (isAdding) return const AddStaffSection();
    return const StaffDetailsSection();
  }
}

class StaffDetailsSection extends ConsumerWidget {
  const StaffDetailsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedStaffForViewProvider);
    if (selected == null) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.badge_outlined, size: 64, color: AppColors.ashGrey),
            SizedBox(height: 16),
            Text('Select a staff member to view details', style: TextStyle(color: AppColors.grey)),
          ],
        ),
      );
    }

    final detailsAsync = ref.watch(staffDetailsProvider(selected.userID!));

    return detailsAsync.when(
      data: (user) => SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _StaffAvatar(role: user.role ?? '', name: user.fullName ?? '',),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user.fullName ?? '', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('@${user.username}', style: const TextStyle(color: AppColors.grey)),
                  ],
                ),
                const Spacer(),
                _StatusChip(isActive: user.isActive ?? true),
              ],
            ),
            const SizedBox(height: 32),
            const Text('Information', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _InfoRow(label: 'Role', value: user.role ?? 'N/A', icon: Icons.work_outline, color: _getRoleColor(user.role ?? '')),
            _InfoRow(label: 'Email', value: user.email ?? 'N/A', icon: Icons.email_outlined),
            _InfoRow(label: 'Phone', value: user.phone ?? 'N/A', icon: Icons.phone_outlined),
            _InfoRow(label: 'Hire Date', value: user.hireDate != null ? DateFormat('yyyy-MM-dd').format(DateTime.parse(user.hireDate!)) : 'N/A', icon: Icons.calendar_today_outlined),
            _InfoRow(label: 'Created At', value: user.createdAt != null ? DateFormat('yyyy-MM-dd HH:mm').format(DateTime.parse(user.createdAt!)) : 'N/A', icon: Icons.history),
          ],
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error loading details: $e')),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final bool isActive;
  const _StatusChip({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: (isActive ? Colors.green : Colors.red).withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        isActive ? 'ACTIVE' : 'INACTIVE',
        style: TextStyle(color: isActive ? Colors.green : Colors.red, fontWeight: FontWeight.bold, fontSize: 10),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color? color;
  const _InfoRow({required this.label, required this.value, required this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColors.grey),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(fontSize: 11, color: AppColors.grey)),
              Text(value, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: color)),
            ],
          ),
        ],
      ),
    );
  }
}

class AddStaffSection extends ConsumerStatefulWidget {
  const AddStaffSection({super.key});

  @override
  ConsumerState<AddStaffSection> createState() => _AddStaffSectionState();
}

class _AddStaffSectionState extends ConsumerState<AddStaffSection> {
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
    final roles = ref.watch(staffRolesProvider).where((r) => r != 'All').toList();
    final registerState = ref.watch(registerStaffStateProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => ref.read(isAddingStaffProvider.notifier).set(false),
                  icon: const Icon(Icons.arrow_back),
                ),
                const SizedBox(width: 8),
                const Text('Add New Staff', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(child: _buildTextField('Full Name', _fullNameController, icon: Icons.person_outline)),
                const SizedBox(width: 16),
                Expanded(child: _buildTextField('Username', _usernameController, icon: Icons.alternate_email)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: _buildTextField('Email', _emailController, icon: Icons.email_outlined, keyboardType: TextInputType.emailAddress)),
                const SizedBox(width: 16),
                Expanded(child: _buildTextField('Phone', _phoneController, icon: Icons.phone_outlined, keyboardType: TextInputType.phone)),
              ],
            ),
            const SizedBox(height: 16),
            _buildTextField('Password', _passwordController, icon: Icons.lock_outline, isPassword: true),
            const SizedBox(height: 16),
            
            // Role Section
            const Text('Role', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _isCustomRole 
                    ? TextFormField(
                        controller: _roleCustomController,
                        decoration: _inputDecoration(hint: 'Enter custom role', icon: Icons.badge_outlined),
                        validator: (v) => v!.isEmpty ? 'Required' : null,
                      )
                    : DropdownButtonFormField<String>(
                        value: _selectedRole,
                        decoration: _inputDecoration(icon: Icons.work_outline),
                        items: roles.map((r) => DropdownMenuItem(value: r, child: Text(r))).toList(),
                        onChanged: (val) => setState(() => _selectedRole = val),
                        validator: (v) => v == null ? 'Required' : null,
                      ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () => setState(() => _isCustomRole = !_isCustomRole),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isCustomRole ? AppColors.ashGrey : AppColors.primary.withOpacity(0.1),
                    foregroundColor: _isCustomRole ? Colors.white : AppColors.primary,
                    elevation: 0,
                    minimumSize: const Size(48, 52),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Icon(_isCustomRole ? Icons.list : Icons.add),
                ),
              ],
            ),

            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: registerState.isLoading ? null : _handleRegister,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
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

  Widget _buildTextField(String label, TextEditingController controller, {IconData? icon, bool isPassword = false, TextInputType? keyboardType}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: isPassword,
          keyboardType: keyboardType,
          style: const TextStyle(fontSize: 14),
          decoration: _inputDecoration(icon: icon),
          validator: (val) => val == null || val.isEmpty ? 'Required' : null,
        ),
      ],
    );
  }

  InputDecoration _inputDecoration({String? hint, IconData? icon}) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: icon != null ? Icon(icon, color: AppColors.grey, size: 20) : null,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.ashGrey)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.ashGrey)),
      contentPadding: const EdgeInsets.all(16),
    );
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
      if (mounted) Toaster.error(context: context, message: state.error.toString(), isLandscape: true);
    } else {
      if (mounted) {
        Toaster.success(context: context, message: 'Staff registered successfully', isLandscape: true);
        setState(() {
          _isCustomRole = false;
          _selectedRole = null;
          _usernameController.clear();
          _passwordController.clear();
          _emailController.clear();
          _fullNameController.clear();
          _phoneController.clear();
          _roleCustomController.clear();
        });
        ref.read(isAddingStaffProvider.notifier).set(false);
      }
    }
  }
}
