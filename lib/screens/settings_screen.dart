import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../theme/app_theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppTheme.backgroundGradient),
        child: SafeArea(
          child: Column(
            children: [
              _buildAppBar(context),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 32),
                      _buildSectionHeader(
                        LucideIcons.shield,
                        'Privacy & Safety',
                      ),
                      const SizedBox(height: 16),
                      _buildSettingItem(
                        icon: LucideIcons.eye,
                        title: 'Anonymous Explorer Mode',
                        subtitle: 'Hide your identity while browsing',
                        trailing: Switch(
                          value: true,
                          onChanged: (v) {},
                          activeColor: const Color(0xFFA259FF),
                        ),
                        iconColor: const Color(0xFFA259FF),
                      ),
                      _buildSettingItem(
                        icon: LucideIcons.lock,
                        title: 'Privacy Settings',
                        subtitle: 'Control what others see',
                        iconColor: const Color(0xFFFF2D55),
                      ),
                      _buildSettingItem(
                        icon: LucideIcons.database,
                        title: 'Data Privacy Center',
                        subtitle: 'Manage your data',
                        iconColor: const Color(0xFF00D2FF),
                      ),
                      _buildSettingItem(
                        icon: LucideIcons.shieldAlert,
                        title: 'Safety Center',
                        subtitle: 'Report & block settings',
                        iconColor: const Color(0xFF3478F6),
                      ),
                      const SizedBox(height: 32),
                      _buildSectionHeader(LucideIcons.sparkles, 'Preferences'),
                      const SizedBox(height: 16),
                      _buildSettingItem(
                        icon: LucideIcons.bell,
                        title: 'Notifications',
                        subtitle: 'Push notifications & alerts',
                        trailing: Switch(
                          value: true,
                          onChanged: (v) {},
                          activeColor: const Color(0xFFA259FF),
                        ),
                        iconColor: const Color(0xFFA259FF),
                      ),
                      _buildSettingItem(
                        icon: LucideIcons.moon,
                        title: 'Dark Mode',
                        subtitle: 'Always enabled for comfort',
                        trailing: Switch(
                          value: true,
                          onChanged: (v) {},
                          activeColor: const Color(0xFFA259FF),
                        ),
                        iconColor: const Color(0xFF3478F6),
                      ),
                      _buildSettingItem(
                        icon: LucideIcons.sparkles,
                        title: 'Emotional AI Assistant',
                        subtitle: 'Get AI-powered suggestions',
                        trailing: Switch(
                          value: true,
                          onChanged: (v) {},
                          activeColor: const Color(0xFFA259FF),
                        ),
                        iconColor: const Color(0xFF00D2FF),
                      ),
                      _buildSettingItem(
                        icon: LucideIcons.languages,
                        title: 'Language',
                        subtitle: 'English',
                        iconColor: const Color(0xFFA259FF),
                      ),
                      const SizedBox(height: 32),
                      _buildSectionHeader(LucideIcons.heart, 'Account'),
                      const SizedBox(height: 16),
                      _buildSettingItem(
                        icon: LucideIcons.heart,
                        title: 'Subscription',
                        subtitle: 'Manage your plan',
                        iconColor: const Color(0xFFFF2D55),
                      ),
                      _buildSettingItem(
                        icon: LucideIcons.helpCircle,
                        title: 'Help & Support',
                        subtitle: 'Get help when you need it',
                        iconColor: const Color(0xFFA259FF),
                      ),
                      _buildSettingItem(
                        icon: LucideIcons.logOut,
                        title: 'Log Out',
                        subtitle: 'Sign out of your account',
                        iconColor: const Color(0xFFFF3B30),
                      ),
                      const SizedBox(height: 32),
                      _buildPrivacyMattersCard(),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          _buildIconButton(
            LucideIcons.arrowLeft,
            onTap: () => Navigator.pop(context),
          ),
          const Expanded(
            child: Text(
              'Settings & Privacy',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 48), // Placeholder to center title
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white10),
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }

  Widget _buildSectionHeader(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.white.withOpacity(0.4)),
        const SizedBox(width: 12),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white.withOpacity(0.4),
            letterSpacing: 1.1,
          ),
        ),
      ],
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required String subtitle,
    Widget? trailing,
    required Color iconColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.4),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          trailing ??
              Icon(
                LucideIcons.chevronRight,
                color: Colors.white.withOpacity(0.2),
              ),
        ],
      ),
    );
  }

  Widget _buildPrivacyMattersCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF172A45),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppTheme.accentCyan.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  LucideIcons.lock,
                  color: AppTheme.accentCyan,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              const Text(
                'Your Privacy Matters',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Companion is designed with your emotional safety and privacy as our top priority. Your data is encrypted, never sold, and you have full control over what you share.',
            style: TextStyle(color: Colors.white.withOpacity(0.6), height: 1.5),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Text(
                'Learn more about our privacy practices',
                style: TextStyle(
                  color: AppTheme.accentCyan.withOpacity(0.8),
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                LucideIcons.chevronRight,
                size: 16,
                color: AppTheme.accentCyan.withOpacity(0.8),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
