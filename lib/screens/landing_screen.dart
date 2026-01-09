import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/app_theme.dart';
import '../widgets/gradient_button.dart';
import 'mood_selection_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppTheme.backgroundGradient),
        child: Stack(
          children: [
            // Background glow effects
            Positioned(
              top: -100,
              right: -50,
              child: _buildGlowCircle(AppTheme.accentCyan.withOpacity(0.1), 300)
                  .animate(
                    onPlay: (controller) => controller.repeat(reverse: true),
                  )
                  .scale(
                    begin: const Offset(1, 1),
                    end: const Offset(1.2, 1.2),
                    duration: const Duration(seconds: 4),
                  ),
            ),
            Positioned(
              bottom: -50,
              left: -50,
              child:
                  _buildGlowCircle(AppTheme.accentIndigo.withOpacity(0.1), 250)
                      .animate(
                        onPlay: (controller) =>
                            controller.repeat(reverse: true),
                      )
                      .scale(
                        begin: const Offset(1, 1),
                        end: const Offset(1.3, 1.3),
                        duration: const Duration(seconds: 5),
                      ),
            ),

            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    // Logo Container with glassmorphic polish
                    Container(
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppTheme.accentBlue,
                                AppTheme.accentCyan,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(45),
                            boxShadow: [
                              BoxShadow(
                                color: AppTheme.accentCyan.withOpacity(0.4),
                                blurRadius: 40,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(43),
                            ),
                            child: const Center(
                              child: Icon(
                                LucideIcons.sparkles,
                                size: 70,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                        .animate()
                        .scale(
                          duration: const Duration(milliseconds: 800),
                          curve: Curves.easeOutBack,
                        )
                        .shimmer(
                          delay: const Duration(seconds: 1),
                          duration: const Duration(seconds: 2),
                        ),

                    const SizedBox(height: 48),

                    const Text(
                          'Companion',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            letterSpacing: -1,
                          ),
                        )
                        .animate()
                        .fadeIn(delay: const Duration(milliseconds: 400))
                        .slideY(begin: 0.3),

                    const SizedBox(height: 16),

                    const Text(
                          'Your emotional hub for\nmeaningful connections',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white70,
                            height: 1.4,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                        .animate()
                        .fadeIn(delay: const Duration(milliseconds: 600))
                        .slideY(begin: 0.3),

                    const Spacer(),

                    GradientButton(
                          text: 'Begin Your Journey',
                          icon: LucideIcons.chevronRight,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const MoodSelectionScreen(),
                              ),
                            );
                          },
                        )
                        .animate()
                        .fadeIn(delay: const Duration(milliseconds: 800))
                        .slideY(begin: 0.5),

                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGlowCircle(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: color, blurRadius: size / 2, spreadRadius: size / 4),
        ],
      ),
    );
  }
}
