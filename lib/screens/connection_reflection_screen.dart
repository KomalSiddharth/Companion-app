import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../theme/app_theme.dart';
import '../widgets/gradient_button.dart';
import 'vibe_selection_screen.dart';

class ConnectionReflectionScreen extends StatelessWidget {
  final String userName;
  final String userInitial;
  final Color userColor;

  const ConnectionReflectionScreen({
    super.key,
    required this.userName,
    required this.userInitial,
    required this.userColor,
  });

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
                      _buildConnectionCard(),
                      const SizedBox(height: 32),
                      _buildSectionLabel('Emotional Shift'),
                      const SizedBox(height: 16),
                      _buildEmotionalShiftGrid(),
                      const SizedBox(height: 24),
                      _buildUpliftBanner(),
                      const SizedBox(height: 32),
                      _buildSectionLabel('Aura Sync'),
                      const SizedBox(height: 16),
                      _buildAuraSyncCard(),
                      const SizedBox(height: 32),
                      _buildSectionLabel('Energy Shift'),
                      const SizedBox(height: 16),
                      _buildEnergyShiftCard(),
                      const SizedBox(height: 32),
                      _buildSectionLabel(
                        'Reflect on this moment',
                        icon: LucideIcons.bookOpen,
                      ),
                      const SizedBox(height: 16),
                      _buildReflectionArea(),
                      const SizedBox(height: 32),
                      _buildAchievementCard(),
                      const SizedBox(height: 32),
                      GradientButton(
                        text: 'Continue Exploring',
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const VibeSelectionScreen(),
                            ),
                            (route) => false,
                          );
                        },
                      ),
                      const SizedBox(height: 12),
                      _buildSecondaryButton(
                        'Message $userName Again',
                        onTap: () => Navigator.pop(context),
                      ),
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
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: _buildIconButton(
              LucideIcons.arrowLeft,
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VibeSelectionScreen(),
                  ),
                  (route) => false,
                );
              },
            ),
          ),
          const Text(
            'Connection Reflection',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
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

  Widget _buildSectionLabel(String label, {IconData? icon}) {
    return Row(
      children: [
        if (icon != null) ...[
          Icon(icon, color: Colors.white, size: 20),
          const SizedBox(width: 8),
        ],
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildConnectionCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF172A45),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF00D2FF), Color(0xFF007AFF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                userInitial,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Chat with $userName',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Conversation lasted 15 minutes',
                  style: TextStyle(color: Colors.white60, fontSize: 14),
                ),
              ],
            ),
          ),
          Column(
            children: const [
              Text('🥳', style: TextStyle(fontSize: 24)),
              SizedBox(height: 4),
              Text(
                'Great vibe!',
                style: TextStyle(color: Colors.white70, fontSize: 10),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmotionalShiftGrid() {
    return Row(
      children: [
        Expanded(
          child: _buildShiftCard('😌', 'Before', 'Calm', '65%', Colors.blue),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildShiftCard('😊', 'After', 'Happy', '92%', Colors.orange),
        ),
      ],
    );
  }

  Widget _buildShiftCard(
    String emoji,
    String time,
    String mood,
    String percent,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 40)),
          const SizedBox(height: 12),
          Text(
            time,
            style: const TextStyle(color: Colors.white60, fontSize: 14),
          ),
          const SizedBox(height: 4),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                mood,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
              Text(
                percent,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: double.parse(percent.replaceAll('%', '')) / 100,
              backgroundColor: Colors.white12,
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpliftBanner() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1B2A),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF00FF88).withOpacity(0.2)),
      ),
      child: Row(
        children: [
          const Icon(
            LucideIcons.trendingUp,
            color: Color(0xFF00FF88),
            size: 28,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '+27% Emotional Uplift',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'This connection boosted your mood!',
                  style: TextStyle(color: Colors.white60, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAuraSyncCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFFA259FF).withOpacity(0.2),
            const Color(0xFFFF2D55).withOpacity(0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        children: [
          _buildSyncedCircle(),
          const SizedBox(height: 32),
          _buildSyncMetric(
            LucideIcons.sparkles,
            'Communication',
            '96%',
            const Color(0xFFA259FF),
          ),
          const SizedBox(height: 16),
          _buildSyncMetric(
            LucideIcons.zap,
            'Energy Match',
            '91%',
            const Color(0xFFFF2D55),
          ),
          const SizedBox(height: 16),
          _buildSyncMetric(
            LucideIcons.heart,
            'Emotional Connection',
            '95%',
            const Color(0xFFFF2D55),
          ),
        ],
      ),
    );
  }

  Widget _buildSyncedCircle() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 140,
          height: 140,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xFFA259FF).withOpacity(0.3),
              width: 15,
            ),
          ),
        ),
        Column(
          children: const [
            Text(
              'Synced',
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
            Text(
              '94%',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSyncMetric(
    IconData icon,
    String label,
    String percent,
    Color color,
  ) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, color: color, size: 18),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
            const Spacer(),
            Text(
              percent,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: double.parse(percent.replaceAll('%', '')) / 100,
            backgroundColor: Colors.white12,
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 6,
          ),
        ),
      ],
    );
  }

  Widget _buildEnergyShiftCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Calm',
                style: TextStyle(color: Colors.white60, fontSize: 12),
              ),
              Text(
                'Peace',
                style: TextStyle(color: Colors.white60, fontSize: 12),
              ),
              Text(
                'Joy',
                style: TextStyle(color: Colors.white60, fontSize: 12),
              ),
              Text(
                'Excited',
                style: TextStyle(color: Colors.white60, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            height: 12,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.cyan,
                  Colors.yellow,
                  Colors.orange,
                ],
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 50,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    width: 12,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'You shifted from calm to joyful during this connection',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildReflectionArea() {
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
          const Text(
            'How did this conversation make you feel? What did you learn about yourself?',
            style: TextStyle(color: Colors.white60, fontSize: 15),
          ),
          const SizedBox(height: 60),
          const Divider(color: Colors.white24),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildReflectIcon('🌟'),
              const SizedBox(width: 8),
              _buildReflectIcon('💭'),
              const SizedBox(width: 8),
              _buildReflectIcon('💡'),
              const SizedBox(width: 8),
              _buildReflectIcon('❤️'),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFB84DFF), Color(0xFFFF4081)],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Save Reflection',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildReflectIcon(String emoji) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(emoji, style: const TextStyle(fontSize: 18)),
    );
  }

  Widget _buildAchievementCard() {
    return Container(
      padding: const EdgeInsets.all(32),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF23143B),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: const Color(0xFFFFD700).withOpacity(0.1)),
      ),
      child: Column(
        children: [
          const Text('🏆', style: TextStyle(fontSize: 48)),
          const SizedBox(height: 16),
          const Text(
            'Achievement Unlocked!',
            style: TextStyle(color: Colors.white60, fontSize: 14),
          ),
          const SizedBox(height: 8),
          const Text(
            'Meaningful Connection Master',
            style: TextStyle(
              color: Color(0xFFFFD700),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                LucideIcons.checkCircle2,
                color: Color(0xFF00FF88),
                size: 16,
              ),
              SizedBox(width: 8),
              Text(
                'Your 5th positive connection this week',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSecondaryButton(String text, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: Colors.white24),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
