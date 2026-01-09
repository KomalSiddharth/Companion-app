import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryDeepBlue = Color(0xFF0F172A);
  static const Color secondaryBlue = Color(0xFF1E293B);
  static const Color accentCyan = Color(0xFF22D3EE);
  static const Color accentBlue = Color(0xFF3B82F6);
  static const Color accentIndigo = Color(0xFF6366F1);
  static const Color accentPurple = Color(0xFFA855F7);
  static const Color accentPink = Color(0xFFEC4899);

  static LinearGradient backgroundGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF0F172A), Color(0xFF1E1B4B), Color(0xFF1E293B)],
  );

  static LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Colors.white.withOpacity(0.12), Colors.white.withOpacity(0.04)],
  );

  static LinearGradient buttonGradient = const LinearGradient(
    colors: [Color(0xFF3B82F6), Color(0xFF22D3EE)],
  );

  static BoxDecoration glassDecoration = BoxDecoration(
    color: Colors.white.withOpacity(0.05),
    borderRadius: BorderRadius.circular(24),
    border: Border.all(color: Colors.white.withOpacity(0.1)),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: primaryDeepBlue,
    primaryColor: accentBlue,
    textTheme: GoogleFonts.outfitTextTheme(ThemeData.dark().textTheme),
  );
}
