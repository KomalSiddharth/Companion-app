import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'dart:math' as math;
import '../theme/app_theme.dart';
import 'chat_screen.dart';

class VibeMatchingScreen extends StatefulWidget {
  final String mode; // 'Date', 'Friend', 'Group', 'Business'

  const VibeMatchingScreen({super.key, required this.mode});

  @override
  State<VibeMatchingScreen> createState() => _VibeMatchingScreenState();
}

class _VibeMatchingScreenState extends State<VibeMatchingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Offset _dragOffset = Offset.zero;
  double _dragAngle = 0;
  int _currentIndex = 0;

  final List<MatchProfile> _profiles = [
    MatchProfile(
      name: 'Sarah',
      age: 28,
      bio: 'Looking for deep conversations and artistic connections',
      tags: ['Introvert', 'Artist', 'Night owl', 'Reader'],
      matchPercent: 94,
      distance: '2 km away',
      vibe: 'Calm & Creative',
      initial: 'S',
      color: Colors.blue,
    ),
    MatchProfile(
      name: 'Alex',
      age: 26,
      bio: 'Adventure seeker and coffee enthusiast',
      tags: ['Extravert', 'Traveler', 'Foodie', 'Hiker'],
      matchPercent: 88,
      distance: '5 km away',
      vibe: 'Energetic & Fun',
      initial: 'A',
      color: Colors.orange,
    ),
    MatchProfile(
      name: 'Elena',
      age: 24,
      bio: 'Tech minimalist and yoga practitioner',
      tags: ['Zen', 'Developer', 'Vegan', 'Yoga'],
      matchPercent: 91,
      distance: '3 km away',
      vibe: 'Mindful & Techy',
      initial: 'E',
      color: Colors.cyan,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _dragOffset += details.delta;
      _dragAngle = (_dragOffset.dx / 20) * (math.pi / 180);
    });
  }

  void _onPanEnd(DragEndDetails details) {
    if (_dragOffset.dx.abs() > 100) {
      _swipe(_dragOffset.dx > 0);
    } else {
      _resetPosition();
    }
  }

  void _swipe(bool isRight) {
    // Animate out
    _controller.forward(from: 0).then((_) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _profiles.length;
        _dragOffset = Offset.zero;
        _dragAngle = 0;
      });
    });
  }

  void _resetPosition() {
    setState(() {
      _dragOffset = Offset.zero;
      _dragAngle = 0;
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
              _buildHeader(),
              const SizedBox(height: 20),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      if (_currentIndex < _profiles.length)
                        _buildProfileCard(
                          _profiles[(_currentIndex + 1) % _profiles.length],
                          isBack: true,
                        ),
                      GestureDetector(
                        onPanUpdate: _onPanUpdate,
                        onPanEnd: _onPanEnd,
                        child: Transform.translate(
                          offset: _dragOffset,
                          child: Transform.rotate(
                            angle: _dragAngle,
                            child: _buildProfileCard(_profiles[_currentIndex]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _buildActionButtons(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: _buildIconButton(
              LucideIcons.arrowLeft,
              onTap: () => Navigator.pop(context),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFFF2D55), Color(0xFFF12711)],
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(LucideIcons.heart, color: Colors.white, size: 18),
                const SizedBox(width: 8),
                Text(
                  '${widget.mode} Mode',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard(MatchProfile profile, {bool isBack = false}) {
    return Container(
      width: double.infinity,
      height: 500,
      decoration: BoxDecoration(
        color: const Color(0xFF172A45),
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: Colors.white10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background Glow
          Center(
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: profile.color.withOpacity(0.1),
                    blurRadius: 100,
                    spreadRadius: 20,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF00D2FF), Color(0xFF007AFF)],
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        profile.vibe,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            LucideIcons.dot,
                            color: Color(0xFF00FF88),
                            size: 24,
                          ),
                          Text(
                            '${profile.matchPercent}%',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white12, width: 2),
                    color: profile.color.withOpacity(0.1),
                  ),
                  child: Center(
                    child: Icon(
                      LucideIcons.sparkles,
                      color: profile.color.withOpacity(0.7),
                      size: 60,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  '${profile.name}, ${profile.age}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  profile.bio,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white60, fontSize: 15),
                ),
                const SizedBox(height: 24),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  alignment: WrapAlignment.center,
                  children: profile.tags
                      .map((tag) => _buildInterestTag(tag))
                      .toList(),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      LucideIcons.star,
                      color: Colors.white38,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Low-key',
                      style: TextStyle(color: Colors.white38, fontSize: 14),
                    ),
                    const SizedBox(width: 16),
                    const Icon(
                      LucideIcons.mapPin,
                      color: Colors.white38,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      profile.distance,
                      style: const TextStyle(
                        color: Colors.white38,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Vibe Match',
                      style: TextStyle(color: Colors.white38, fontSize: 12),
                    ),
                    Text(
                      '${profile.matchPercent}%',
                      style: const TextStyle(
                        color: Colors.white38,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: 16,
            top: 60,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                '1/4',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInterestTag(String tag) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF2E4B75).withOpacity(0.4),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: Text(
        tag,
        style: const TextStyle(color: Colors.white70, fontSize: 12),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildCircularButton(
          LucideIcons.x,
          Colors.white12,
          Colors.white,
          onTap: () => _swipe(false),
        ),
        const SizedBox(width: 20),
        GestureDetector(
          onTap: () {
            final profile = _profiles[_currentIndex];
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatScreen(
                  userName: profile.name,
                  userInitial: profile.initial,
                  userColor: profile.color,
                  status: 'Online',
                ),
              ),
            );
          },
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFFB84DFF), Color(0xFFFF4081)],
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFF4081).withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: const Center(
              child: Icon(
                LucideIcons.messageCircle,
                color: Colors.white,
                size: 32,
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        _buildCircularButton(
          LucideIcons.heart,
          Colors.white12,
          const Color(0xFFFF2D55),
          onTap: () => _swipe(true),
        ),
      ],
    );
  }

  Widget _buildCircularButton(
    IconData icon,
    Color bg,
    Color iconColor, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: bg,
          border: Border.all(color: Colors.white10),
        ),
        child: Center(child: Icon(icon, color: iconColor, size: 24)),
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

class MatchProfile {
  final String name;
  final int age;
  final String bio;
  final List<String> tags;
  final int matchPercent;
  final String distance;
  final String vibe;
  final String initial;
  final Color color;

  MatchProfile({
    required this.name,
    required this.age,
    required this.bio,
    required this.tags,
    required this.matchPercent,
    required this.distance,
    required this.vibe,
    required this.initial,
    required this.color,
  });
}
