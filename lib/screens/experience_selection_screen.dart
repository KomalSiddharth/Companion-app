import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/app_theme.dart';
import '../widgets/gradient_button.dart';
import 'home_screen.dart';
import 'verification_promo_screen.dart';

class ExperienceSelectionScreen extends StatefulWidget {
  const ExperienceSelectionScreen({super.key});

  @override
  State<ExperienceSelectionScreen> createState() =>
      _ExperienceSelectionScreenState();
}

class _ExperienceSelectionScreenState extends State<ExperienceSelectionScreen> {
  int? _selectedIndex;

  final List<Map<String, dynamic>> _options = [
    {
      'title': 'Anonymous Explorer',
      'description': 'Browse and connect without revealing your identity',
      'icon': LucideIcons.shield,
      'color': const Color(0xFF22D3EE),
    },
    {
      'title': 'Verified Member',
      'description': 'Full access with verified profile and safety features',
      'icon': LucideIcons.checkCircle,
      'color': const Color(0xFF00FF88),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppTheme.backgroundGradient),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      const SizedBox(height: 48),
                      const Text(
                        'Choose Your Experience',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          letterSpacing: -1,
                        ),
                      ).animate().fadeIn().slideY(begin: -0.2),
                      const SizedBox(height: 12),
                      const Text(
                        'Tailor your journey to your comfort level',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.white60),
                      ).animate().fadeIn(
                        delay: const Duration(milliseconds: 200),
                      ),
                      const SizedBox(height: 60),
                      ...List.generate(_options.length, (index) {
                        final option = _options[index];
                        final isSelected = _selectedIndex == index;

                        return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = index;
                                });
                              },
                              child:
                                  Container(
                                        margin: const EdgeInsets.only(
                                          bottom: 24,
                                        ),
                                        padding: const EdgeInsets.all(24),
                                        decoration: BoxDecoration(
                                          gradient: isSelected
                                              ? LinearGradient(
                                                  colors: [
                                                    (option['color'] as Color)
                                                        .withOpacity(0.15),
                                                    Colors.white.withOpacity(
                                                      0.05,
                                                    ),
                                                  ],
                                                )
                                              : null,
                                          color: isSelected
                                              ? null
                                              : Colors.white.withOpacity(0.05),
                                          borderRadius: BorderRadius.circular(
                                            32,
                                          ),
                                          border: Border.all(
                                            color: isSelected
                                                ? option['color'] as Color
                                                : Colors.white.withOpacity(0.1),
                                            width: 2,
                                          ),
                                          boxShadow: isSelected
                                              ? [
                                                  BoxShadow(
                                                    color:
                                                        (option['color']
                                                                as Color)
                                                            .withOpacity(0.1),
                                                    blurRadius: 20,
                                                    offset: const Offset(0, 10),
                                                  ),
                                                ]
                                              : [],
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(16),
                                              decoration: BoxDecoration(
                                                color:
                                                    (option['color'] as Color)
                                                        .withOpacity(0.15),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Icon(
                                                option['icon'] as IconData,
                                                color: option['color'] as Color,
                                                size: 32,
                                              ),
                                            ),
                                            const SizedBox(width: 20),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    option['title'] as String,
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 6),
                                                  Text(
                                                    option['description']
                                                        as String,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.white
                                                          .withOpacity(0.6),
                                                      height: 1.4,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            if (isSelected)
                                              Icon(
                                                LucideIcons.checkCircle2,
                                                color: option['color'] as Color,
                                              ).animate().scale(),
                                          ],
                                        ),
                                      )
                                      .animate(target: isSelected ? 1 : 0)
                                      .scale(
                                        end: const Offset(1.02, 1.02),
                                        duration: const Duration(
                                          milliseconds: 200,
                                        ),
                                      ),
                            )
                            .animate()
                            .fadeIn(
                              delay: Duration(
                                milliseconds: 400 + (index * 100),
                              ),
                            )
                            .slideX(begin: 0.1);
                      }),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 20, 24, 40),
                child:
                    GradientButton(
                          text: 'Continue',
                          icon: LucideIcons.chevronRight,
                          onPressed: _selectedIndex == null
                              ? null
                              : () {
                                  if (_selectedIndex == 1) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const VerificationPromoScreen(),
                                      ),
                                    );
                                  } else {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen(),
                                      ),
                                      (route) => false,
                                    );
                                  }
                                },
                        )
                        .animate()
                        .fadeIn(delay: const Duration(milliseconds: 800))
                        .slideY(begin: 0.2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
