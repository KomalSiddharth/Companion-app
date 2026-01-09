import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../theme/app_theme.dart';
import 'event_detail_screen.dart';
import 'host_dashboard_screen.dart';

class EventsDiscoverScreen extends StatefulWidget {
  const EventsDiscoverScreen({super.key});

  @override
  State<EventsDiscoverScreen> createState() => _EventsDiscoverScreenState();
}

class _EventsDiscoverScreenState extends State<EventsDiscoverScreen> {
  String _selectedFilter = 'All';
  final List<String> _filters = ['All', 'Today', 'This Week', 'Near Me'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppTheme.backgroundGradient),
        child: SafeArea(
          child: Column(
            children: [
              _buildAppBar(context),
              _buildFilters(),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(24),
                  children: [
                    _buildEventCard(
                      context,
                      title: 'Mindful Morning Meditation',
                      host: 'Sarah Chen',
                      time: 'Tomorrow, 8:00 AM',
                      location: 'Calm Corner Cafe',
                      joined: '12/15',
                      vibe: 'Low-key',
                      tags: ['Wellness', 'Meditation', 'Community'],
                      vibeScore: 95,
                      safeScore: 98,
                      tier: 'GOLD',
                      tierColor: const Color(0xFFFFD700),
                      cardColor: const Color(0xFF172A45),
                      icon: LucideIcons.coffee,
                    ),
                    const SizedBox(height: 20),
                    _buildEventCard(
                      context,
                      title: 'High Energy Dance Party',
                      host: 'Alex Rivera',
                      time: 'Friday, 9:00 PM',
                      location: 'Energy Zone Club',
                      joined: '45/50',
                      vibe: 'High-energy',
                      tags: ['Music', 'Dancing', 'Social'],
                      vibeScore: 92,
                      safeScore: 95,
                      tier: 'SILVER',
                      tierColor: const Color(0xFFC0C0C0),
                      cardColor: const Color(0xFF2D1B36),
                      icon: LucideIcons.zap,
                    ),
                    const SizedBox(height: 20),
                    _buildEventCard(
                      context,
                      title: 'Creative Writing Workshop',
                      host: 'Jamie Parker',
                      time: 'Saturday, 2:00 PM',
                      location: 'Creative Hub',
                      joined: '8/12',
                      vibe: 'Focused',
                      tags: ['Writing', 'Creative', 'Learning'],
                      vibeScore: 89,
                      safeScore: 97,
                      tier: 'GOLD',
                      tierColor: const Color(0xFFFFD700),
                      cardColor: const Color(0xFF231B45),
                      icon: LucideIcons.sparkles,
                    ),
                    const SizedBox(height: 40),
                  ],
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
            'Discover Events',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HostDashboardScreen(),
                ),
              );
            },
            child: const Text(
              'Host',
              style: TextStyle(
                color: AppTheme.accentCyan,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: _filters.map((filter) {
          final isSelected = _selectedFilter == filter;
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () => setState(() => _selectedFilter = filter),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Colors.white.withOpacity(0.15)
                      : Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected ? Colors.white24 : Colors.white10,
                  ),
                ),
                child: Text(
                  filter,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.white70,
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildEventCard(
    BuildContext context, {
    required String title,
    required String host,
    required String time,
    required String location,
    required String joined,
    required String vibe,
    required List<String> tags,
    required int vibeScore,
    required int safeScore,
    required String tier,
    required Color tierColor,
    required Color cardColor,
    required IconData icon,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventDetailScreen(
              title: title,
              host: host,
              time: time,
              location: location,
              joined: joined,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: Colors.white10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(50),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: Colors.orangeAccent, size: 24),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: tierColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    tier,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Hosted by $host',
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                _buildInfoIcon(LucideIcons.calendar, time),
                const SizedBox(width: 20),
                _buildInfoIcon(LucideIcons.mapPin, location),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildInfoIcon(LucideIcons.users, '$joined joined'),
                const SizedBox(width: 20),
                _buildInfoIcon(LucideIcons.sparkles, vibe),
              ],
            ),
            const SizedBox(height: 20),
            Wrap(spacing: 8, children: tags.map((t) => _buildTag(t)).toList()),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: _buildScoreBar('Vibe', vibeScore, AppTheme.accentCyan),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildScoreBar(
                    'Safe',
                    safeScore,
                    const Color(0xFF00FF88),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text(
                  'Expected mood:',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
                const SizedBox(width: 8),
                ...List.generate(5, (index) => _buildMoodBar(index < 4)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoIcon(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, color: Colors.white38, size: 16),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 13),
        ),
      ],
    );
  }

  Widget _buildTag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white70, fontSize: 11),
      ),
    );
  }

  Widget _buildScoreBar(String label, int score, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    label == 'Vibe' ? LucideIcons.sparkles : LucideIcons.shield,
                    color: color,
                    size: 14,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    label,
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
              Text(
                '$score%',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: LinearProgressIndicator(
              value: score / 100,
              backgroundColor: Colors.white12,
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMoodBar(bool filled) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Container(
        width: 6,
        height: 16,
        decoration: BoxDecoration(
          color: filled ? AppTheme.accentCyan : Colors.white12,
          borderRadius: BorderRadius.circular(2),
        ),
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
}
