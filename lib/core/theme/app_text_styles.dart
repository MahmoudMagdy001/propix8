// ignore_for_file: avoid_classes_with_only_static_members
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:propix8/core/utils/responsive_helper.dart';

abstract class AppTextStyles {
  static TextTheme getTextTheme({required bool isDark}) {
    final color = isDark ? Colors.white : Colors.black87;

    // ponytail: use GoogleFonts.cairo directly on TextTheme variants to avoid material_ui TextTheme type conflict
    return TextTheme(
      // Headlines
      displayLarge: GoogleFonts.cairo(
        fontSize: 57.sp,
        fontWeight: FontWeight.bold,
        color: color,
        letterSpacing: -0.25,
      ),
      displayMedium: GoogleFonts.cairo(
        fontSize: 45.sp,
        fontWeight: FontWeight.normal,
        color: color,
      ),
      displaySmall: GoogleFonts.cairo(
        fontSize: 36.sp,
        fontWeight: FontWeight.normal,
        color: color,
      ),

      // Titles
      titleLarge: GoogleFonts.cairo(
        fontSize: 22.sp,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      titleMedium: GoogleFonts.cairo(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: color,
        letterSpacing: 0.15,
      ),
      titleSmall: GoogleFonts.cairo(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: color,
        letterSpacing: 0.1,
      ),

      // Body
      bodyLarge: GoogleFonts.cairo(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        color: color,
        letterSpacing: 0.5,
      ),
      bodyMedium: GoogleFonts.cairo(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        color: color,
        letterSpacing: 0.25,
      ),
      bodySmall: GoogleFonts.cairo(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        color: color,
        letterSpacing: 0.4,
      ),

      // Label (Captions / Buttons)
      labelLarge: GoogleFonts.cairo(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: color,
        letterSpacing: 0.1,
      ),
      labelMedium: GoogleFonts.cairo(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: color,
        letterSpacing: 0.5,
      ),
      labelSmall: GoogleFonts.cairo(
        fontSize: 11.sp,
        fontWeight: FontWeight.w500,
        color: color,
        letterSpacing: 0.5,
      ),
    );
  }
}
