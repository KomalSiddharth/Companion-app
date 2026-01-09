import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../theme/app_theme.dart';
import 'settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                    children: [
                      _buildProfileCard(),
                      const SizedBox(height: 32),
                      _buildSectionHeader('Active Modes'),
                      const SizedBox(height: 16),
                      _buildActiveModesGrid(),
                      const SizedBox(height: 32),
                      _buildSectionHeader('Safety & Trust'),
                      const SizedBox(height: 16),
                      _buildSafetyCard(),
                      const SizedBox(height: 32),
                      _buildSectionHeader('Mood History', trailing: 'View all'),
                      const SizedBox(height: 16),
                      _buildMoodHistoryCard(),
                      const SizedBox(height: 32),
                      _buildSectionHeader('Personality', trailing: 'Edit'),
                      const SizedBox(height: 16),
                      _buildTagsSection([
                        'Introvert',
                        'Creative',
                        'Empathetic',
                        'Deep Thinker',
                        'Calm',
                        'Curious',
                      ]),
                      const SizedBox(height: 32),
                      _buildSectionHeader('Interests', trailing: 'Edit'),
                      const SizedBox(height: 16),
                      _buildTagsSection([
                        'Meditation',
                        'Reading',
                        'Art',
                        'Music',
                        'Hiking',
                        'Photography',
                        'Cooking',
                        'Yoga',
                        'Travel',
                        'Writing',
                        'Coffee',
                        'Nature',
                      ]),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildIconButton(
            LucideIcons.arrowLeft,
            onTap: () => Navigator.pop(context),
          ),
          const Text(
            'Profile',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          _buildIconButton(
            LucideIcons.settings,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
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

  Widget _buildProfileCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFFA259FF).withOpacity(0.2),
            const Color(0xFFFF2D55).withOpacity(0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        children: [
          _createAvatar(),
          const SizedBox(height: 24),
          const Text(
            'Your Profile',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Emotional Explorer',
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color(0xFF00FF88).withOpacity(0.3),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(
                  LucideIcons.checkCircle2,
                  color: Color(0xFF00FF88),
                  size: 16,
                ),
                SizedBox(width: 8),
                Text(
                  'Verified Member',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _createAvatar() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xFFA259FF).withOpacity(0.3),
              width: 2,
              style: BorderStyle.solid,
            ),
          ),
        ),
        Container(
          width: 90,
          height: 90,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Color(0xFF00D2FF), Color(0xFFA259FF), Color(0xFFFF2D55)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const Center(
            child: Text(
              'ME',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title, {String? trailing}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        if (trailing != null)
          Text(
            trailing,
            style: const TextStyle(color: AppTheme.accentCyan, fontSize: 14),
          ),
      ],
    );
  }

  Widget _buildActiveModesGrid() {
    final modes = [
      {
        'title': 'Dating',
        'icon': LucideIcons.heart,
        'color': const Color(0xFFFF2D55),
      },
      {
        'title': 'Friends',
        'icon': LucideIcons.userPlus,
        'color': const Color(0xFF00D2FF),
      },
      {
        'title': 'Groups',
        'icon': LucideIcons.users,
        'color': const Color(0xFFA259FF),
      },
      {
        'title': 'Business',
        'icon': LucideIcons.briefcase,
        'color': const Color(0xFF3478F6),
      },
    ];

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.5,
      children: modes
          .map(
            (m) => _buildModeCard(
              m['title'] as String,
              m['icon'] as IconData,
              m['color'] as Color,
            ),
          )
          .toList(),
    );
  }

  Widget _buildModeCard(String title, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSafetyCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF00FF88).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  LucideIcons.shield,
                  color: Color(0xFF00FF88),
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Excellent Standing',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '98% Safety Score',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
              const Spacer(),
              const Icon(LucideIcons.star, color: Colors.amber, size: 24),
            ],
          ),
          const SizedBox(height: 24),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: const LinearProgressIndicator(
              value: 0.98,
              backgroundColor: Colors.white12,
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF00FF88)),
              minHeight: 6,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStat(
                'Verified',
                LucideIcons.checkCircle2,
                const Color(0xFF00FF88),
              ),
              _buildStat('42', LucideIcons.heart, const Color(0xFFFF2D55)),
              _buildStat('12', LucideIcons.calendar, const Color(0xFF3478F6)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String value, IconData icon, Color color) {
    return Column(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildMoodHistoryCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildBar(0.6, 'Mon', const Color(0xFF00D2FF)),
              _buildBar(0.8, 'Tue', const Color(0xFFFFB800)),
              _buildBar(0.7, 'Wed', const Color(0xFFA259FF)),
              _buildBar(0.9, 'Thu', const Color(0xFFFF2D55)),
              _buildBar(0.65, 'Fri', const Color(0xFF00FF88)),
              _buildBar(0.85, 'Sat', const Color(0xFFFF2D55)),
              _buildBar(0.75, 'Sun', const Color(0xFF00D2FF)),
            ],
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: const [
                Icon(
                  LucideIcons.trendingUp,
                  color: Color(0xFFA259FF),
                  size: 20,
                ),
                SizedBox(width: 12),
                Text(
                  'Your mood has been improving this week!',
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBar(double height, String day, Color color) {
    return Column(
      children: [
        Container(
          width: 30,
          height: 120 * height,
          decoration: BoxDecoration(
            color: color.withOpacity(0.8),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(height: 12),
        Text(day, style: const TextStyle(color: Colors.white60, fontSize: 12)),
      ],
    );
  }

  Widget _buildTagsSection(List<String> tags) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: tags.map((t) => _buildTag(t)).toList(),
    );
  }

  Widget _buildTag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white70, fontSize: 14),
      ),
    );
  }
}
