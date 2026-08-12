import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  bool _darkMode = false;
  bool _locationEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Settings',
          style: AppTextStyles.h2.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w900,
            fontSize: 24,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              'Customize your app experience',
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
            AppSizes.gapH24,
            
            _buildSectionHeader('General'),
            _buildSettingTile(
              icon: Icons.notifications_none_rounded,
              title: 'Push Notifications',
              subtitle: 'Stay updated with orders and offers',
              trailing: Switch.adaptive(
                value: _notificationsEnabled,
                activeColor: AppColors.primary,
                onChanged: (val) => setState(() => _notificationsEnabled = val),
              ),
            ),
            _buildSettingTile(
              icon: Icons.dark_mode_outlined,
              title: 'Dark Mode',
              subtitle: 'Switch to a darker theme',
              trailing: Switch.adaptive(
                value: _darkMode,
                activeColor: AppColors.primary,
                onChanged: (val) => setState(() => _darkMode = val),
              ),
            ),
            _buildSettingTile(
              icon: Icons.location_on_outlined,
              title: 'Location Services',
              subtitle: 'Improve delivery accuracy',
              trailing: Switch.adaptive(
                value: _locationEnabled,
                activeColor: AppColors.primary,
                onChanged: (val) => setState(() => _locationEnabled = val),
              ),
            ),
            
            AppSizes.gapH24,
            _buildSectionHeader('Account & Security'),
            _buildActionTile(Icons.lock_outline_rounded, 'Change Password'),
            _buildActionTile(Icons.security_rounded, 'Two-Factor Authentication'),
            _buildActionTile(Icons.delete_outline_rounded, 'Delete Account', isDestructive: true),
            
            AppSizes.gapH24,
            _buildSectionHeader('About'),
            _buildActionTile(Icons.info_outline_rounded, 'App Version', trailingText: 'v1.0.0'),
            _buildActionTile(Icons.description_outlined, 'Privacy Policy'),
            _buildActionTile(Icons.gavel_rounded, 'Terms of Service'),
            
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Widget _buildSettingTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required Widget trailing,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: AppColors.primary, size: 22),
          ),
          AppSizes.gapW16,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 10)),
              ],
            ),
          ),
          trailing,
        ],
      ),
    );
  }

  Widget _buildActionTile(IconData icon, String title, {String? trailingText, bool isDestructive = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: ListTile(
        onTap: () {},
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isDestructive ? const Color(0xFFFFECEB) : const Color(0xFFF2EEFF),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: isDestructive ? Colors.red : AppColors.primary, size: 20),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600, 
            fontSize: 14,
            color: isDestructive ? Colors.red : Colors.black,
          ),
        ),
        trailing: trailingText != null 
          ? Text(trailingText, style: const TextStyle(color: Colors.grey, fontSize: 12))
          : const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
      ),
    );
  }
}
