// ignore_for_file: avoid_classes_with_only_static_members
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/responsive_helper.dart';

abstract class AppTextStyles {
  static TextTheme getTextTheme(bool isDark) {
    final color = isDark ? Colors.white : Colors.black87;

    return GoogleFonts.cairoTextTheme(
      TextTheme(
        // Headlines
        displayLarge: TextStyle(
          fontSize: 57.sp,
          fontWeight: FontWeight.bold,
          color: color,
          letterSpacing: -0.25,
        ),
        displayMedium: TextStyle(
          fontSize: 45.sp,
          fontWeight: FontWeight.normal,
          color: color,
        ),
        displaySmall: TextStyle(
          fontSize: 36.sp,
          fontWeight: FontWeight.normal,
          color: color,
        ),

        // Titles
        titleLarge: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.w600,
          color: color,
        ),
        titleMedium: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: color,
          letterSpacing: 0.15,
        ),
        titleSmall: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: color,
          letterSpacing: 0.1,
        ),

        // Body
        bodyLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
          color: color,
          letterSpacing: 0.5,
        ),
        bodyMedium: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          color: color,
          letterSpacing: 0.25,
        ),
        bodySmall: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.normal,
          color: color,
          letterSpacing: 0.4,
        ),

        // Label (Captions / Buttons)
        labelLarge: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: color,
          letterSpacing: 0.1,
        ),
        labelMedium: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: color,
          letterSpacing: 0.5,
        ),
        labelSmall: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
          color: color,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
