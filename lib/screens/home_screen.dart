import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/app_theme.dart';
import 'vibe_selection_screen.dart';
import 'settings_screen.dart';
import 'verification_promo_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> _profiles = [
    {
      'name': 'Calm Soul',
      'mood': 'Relaxed',
      'match': '94%',
      'color': const Color(0xFF6366F1),
      'tags': ['Introvert', 'Nature', 'Coffee'],
      'desc': 'Looking for peaceful morning chats and meditation buddies.',
    },
    {
      'name': 'Night Owl',
      'mood': 'Creative',
      'match': '88%',
      'color': const Color(0xFFA855F7),
      'tags': ['Art', 'Late Night', 'Music'],
      'desc': 'Let\'s talk about philosophy and late-night creativity.',
    },
    {
      'name': 'Zen Wanderer',
      'mood': 'Peaceful',
      'match': '91%',
      'color': const Color(0xFF22D3EE),
      'tags': ['Yoga', 'Books', 'Quiet'],
      'desc': 'Sharing silence and deep thoughts.',
    },
  ];

  int _currentIndex = 0;
  Offset _dragOffset = Offset.zero;

  void _onSwipe(bool isRight) {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _profiles.length;
      _dragOffset = Offset.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppTheme.backgroundGradient),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(context)
                  .animate()
                  .fadeIn(duration: const Duration(milliseconds: 600))
                  .slideY(begin: -0.2),
              _buildMoodFilters()
                  .animate()
                  .fadeIn(delay: const Duration(milliseconds: 200))
                  .slideX(begin: 0.2),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Back card
                      if (_currentIndex < _profiles.length - 1 || true)
                        _buildSwipeCard(
                          _profiles[(_currentIndex + 1) % _profiles.length],
                          isBackCard: true,
                        ).animate().scale(begin: const Offset(0.85, 0.85)),

                      // Front card
                      GestureDetector(
                        onPanUpdate: (details) {
                          setState(() {
                            _dragOffset += details.delta;
                          });
                        },
                        onPanEnd: (details) {
                          if (_dragOffset.dx > 100) {
                            _onSwipe(true);
                          } else if (_dragOffset.dx < -100) {
                            _onSwipe(false);
                          } else {
                            setState(() {
                              _dragOffset = Offset.zero;
                            });
                          }
                        },
                        child: Transform.translate(
                          offset: _dragOffset,
                          child: Transform.rotate(
                            angle: _dragOffset.dx / 1000,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: _buildSwipeCard(_profiles[_currentIndex]),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _buildBottomAction()
                  .animate()
                  .fadeIn(delay: const Duration(milliseconds: 400))
                  .slideY(begin: 0.2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppTheme.accentBlue, AppTheme.accentCyan],
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.accentBlue.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(
              LucideIcons.shield,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Anonymous',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Explorer Mode',
                style: TextStyle(
                  fontSize: 14,
                  color: AppTheme.accentCyan.withOpacity(0.8),
                ),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const VerificationPromoScreen(),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.08),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withOpacity(0.12)),
              ),
              child: Row(
                children: [
                  const Icon(LucideIcons.eye, size: 16, color: Colors.white70),
                  const SizedBox(width: 8),
                  const Text('Verify', style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
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
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }

  Widget _buildMoodFilters() {
    final filters = [
      {'label': 'Calm', 'icon': LucideIcons.coffee, 'color': Colors.blue},
      {'label': 'Zen', 'icon': LucideIcons.sparkles, 'color': Colors.cyan},
      {'label': 'Deep', 'icon': LucideIcons.heart, 'color': Colors.indigo},
      {'label': 'Flow', 'icon': LucideIcons.zap, 'color': Colors.amber},
    ];

    return SizedBox(
      height: 48,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        itemBuilder: (context, index) {
          final f = filters[index];
          return Container(
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: (f['color'] as Color).withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: (f['color'] as Color).withOpacity(0.2)),
            ),
            child: Row(
              children: [
                Icon(
                  f['icon'] as IconData,
                  size: 16,
                  color: (f['color'] as Color),
                ),
                const SizedBox(width: 8),
                Text(
                  f['label'] as String,
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSwipeCard(
    Map<String, dynamic> profile, {
    bool isBackCard = false,
  }) {
    final color = profile['color'] as Color;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(0.15), Colors.black.withOpacity(0.4)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: color.withOpacity(0.2), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Stack(
          children: [
            // Glass effect
            Container(
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.02)),
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildMatchBadge(profile['match'] as String, color),
                      const Icon(
                        LucideIcons.moreHorizontal,
                        color: Colors.white38,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          color.withOpacity(0.3),
                          color.withOpacity(0.1),
                        ],
                      ),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: color.withOpacity(0.2),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Icon(LucideIcons.user, size: 48, color: color),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    profile['name'] as String,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      profile['mood'] as String,
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    profile['desc'] as String,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    alignment: WrapAlignment.center,
                    children: (profile['tags'] as List)
                        .take(3)
                        .map((t) => _buildTag(t as String))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMatchBadge(String match, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(radius: 4, backgroundColor: color),
          const SizedBox(width: 8),
          Text(
            '$match Match',
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white60, fontSize: 13),
      ),
    );
  }

  Widget _buildBottomAction() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 40),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const VibeSelectionScreen(),
            ),
          );
        },
        child: Container(
          width: double.infinity,
          height: 64,
          decoration: BoxDecoration(
            gradient: AppTheme.buttonGradient,
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                color: AppTheme.accentCyan.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(LucideIcons.sparkles, color: Colors.white, size: 20),
                SizedBox(width: 12),
                Text(
                  'Explore More Modes',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
