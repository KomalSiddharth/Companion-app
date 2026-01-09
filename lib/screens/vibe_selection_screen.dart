import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/app_theme.dart';
import 'mood_checkin_screen.dart';
import 'vibe_matching_screen.dart';
import 'events_discover_screen.dart';
import 'live_pulse_screen.dart';
import 'chat_screen.dart';

class VibeSelectionScreen extends StatefulWidget {
  const VibeSelectionScreen({super.key});

  @override
  State<VibeSelectionScreen> createState() => _VibeSelectionScreenState();
}

class _VibeSelectionScreenState extends State<VibeSelectionScreen> {
  String _selectedVibe = 'Friend';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppTheme.backgroundGradient),
        child: SafeArea(
          child: Column(
            children: [
              _buildAppBar(context).animate().fadeIn().slideY(begin: -0.2),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                            'Welcome back',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              letterSpacing: -1,
                            ),
                          )
                          .animate()
                          .fadeIn(delay: const Duration(milliseconds: 200))
                          .slideX(begin: -0.1),
                      const SizedBox(height: 4),
                      Text(
                        'How are you feeling today?',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppTheme.accentCyan,
                          fontWeight: FontWeight.w500,
                        ),
                      ).animate().fadeIn(
                        delay: const Duration(milliseconds: 300),
                      ),
                      const SizedBox(height: 32),
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.85,
                        children: [
                          _buildVibeCard(
                                context,
                                'Date',
                                'Romantic connections',
                                LucideIcons.heart,
                                const Color(0xFFFF2D55),
                                isSelected: _selectedVibe == 'Date',
                              )
                              .animate()
                              .fadeIn(delay: const Duration(milliseconds: 400))
                              .scale(),
                          _buildVibeCard(
                                context,
                                'Friend',
                                'New friendships',
                                LucideIcons.users,
                                const Color(0xFF00FF88),
                                isSelected: _selectedVibe == 'Friend',
                              )
                              .animate()
                              .fadeIn(delay: const Duration(milliseconds: 500))
                              .scale(),
                          _buildVibeCard(
                                context,
                                'Group',
                                'Social circles',
                                LucideIcons.userPlus,
                                const Color(0xFF00D2FF),
                                isSelected: _selectedVibe == 'Group',
                              )
                              .animate()
                              .fadeIn(delay: const Duration(milliseconds: 600))
                              .scale(),
                          _buildVibeCard(
                                context,
                                'Business',
                                'Networking',
                                LucideIcons.briefcase,
                                const Color(0xFFB84DFF),
                                isSelected: _selectedVibe == 'Business',
                              )
                              .animate()
                              .fadeIn(delay: const Duration(milliseconds: 700))
                              .scale(),
                        ],
                      ),
                      const SizedBox(height: 48),
                      const Text(
                        'Quick Actions',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ).animate().fadeIn(
                        delay: const Duration(milliseconds: 800),
                      ),
                      const SizedBox(height: 16),
                      GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 1.8,
                            children: [
                              _buildActionCard(
                                'Mood Check',
                                LucideIcons.smile,
                                const Color(0xFF00D2FF),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const MoodCheckInScreen(),
                                    ),
                                  );
                                },
                              ),
                              _buildActionCard(
                                'Discover',
                                LucideIcons.heart,
                                const Color(0xFFFF2D55),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => VibeMatchingScreen(
                                        mode: _selectedVibe,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              _buildActionCard(
                                'The Pulse',
                                LucideIcons.map,
                                const Color(0xFF00FF88),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const LivePulseScreen(),
                                    ),
                                  );
                                },
                              ),
                              _buildActionCard(
                                'Events',
                                LucideIcons.calendar,
                                const Color(0xFF6366F1),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const EventsDiscoverScreen(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          )
                          .animate()
                          .fadeIn(delay: const Duration(milliseconds: 900))
                          .slideY(begin: 0.1),
                      const SizedBox(height: 32),
                      _buildEnergySection(),
                      const SizedBox(height: 32),
                      _buildRecentVibes(),
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
          Row(
            children: [
              _buildIconButton(LucideIcons.search),
              const SizedBox(width: 12),
              _buildIconButton(LucideIcons.bell),
            ],
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
          border: Border.all(color: Colors.white.withOpacity(0.1)),
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }

  Widget _buildVibeCard(
    BuildContext context,
    String title,
    String desc,
    IconData icon,
    Color color, {
    bool isSelected = false,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedVibe = title;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(
                  colors: [color.withOpacity(0.2), color.withOpacity(0.05)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: isSelected ? null : Colors.white.withOpacity(0.04),
          borderRadius: BorderRadius.circular(32),
          border: Border.all(
            color: isSelected ? color : Colors.white.withOpacity(0.08),
            width: 2,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: color.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(isSelected ? 0.3 : 0.15),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                icon,
                color: isSelected ? Colors.white : color,
                size: 28,
              ),
            ),
            const Spacer(),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.white,
                fontSize: 20,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              desc,
              style: TextStyle(
                color: Colors.white.withOpacity(isSelected ? 0.8 : 0.6),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionCard(
    String title,
    IconData icon,
    Color color, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.05),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: color.withOpacity(0.1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEnergySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Your Energy Today',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.04),
            borderRadius: BorderRadius.circular(32),
            border: Border.all(color: Colors.white.withOpacity(0.08)),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppTheme.accentCyan.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      LucideIcons.sparkles,
                      color: AppTheme.accentCyan,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Feeling Good',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Your aura is glowing bright today',
                        style: TextStyle(color: Colors.white60, fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  const Text(
                    'Energy Level',
                    style: TextStyle(color: Colors.white60, fontSize: 13),
                  ),
                  const Spacer(),
                  Text(
                    '87%',
                    style: TextStyle(
                      color: AppTheme.accentCyan,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: LinearProgressIndicator(
                  value: 0.87,
                  backgroundColor: Colors.white.withOpacity(0.05),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppTheme.accentCyan,
                  ),
                  minHeight: 8,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRecentVibes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recent Vibes',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'View all',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildVibeItem('Sarah', 'Calm • 2m ago', 'S', Colors.blue),
        const SizedBox(height: 12),
        _buildVibeItem('Alex', 'Energetic • 5m ago', 'A', Colors.orange),
      ],
    );
  }

  Widget _buildVibeItem(String name, String time, String initial, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: Text(
                initial,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                time,
                style: const TextStyle(color: Colors.white60, fontSize: 13),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(
                    userName: name,
                    userInitial: initial,
                    userColor: color,
                    status: 'Active',
                  ),
                ),
              );
            },
            child: Icon(
              LucideIcons.messageCircle,
              color: Colors.white.withOpacity(0.4),
            ),
          ),
        ],
      ),
    );
  }
}
