// ignore_for_file: avoid_classes_with_only_static_members
import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primaryLight = Color(0xFF3E5879);
  static const Color onPrimaryLight = Color(0xFFFFFFFF);
  static const Color primaryContainerLight = Color(0xFFD6E2F0);
  static const Color onPrimaryContainerLight = Color(0xFF001B3D);

  static const Color secondaryLight = Color(0xFF565F71);
  static const Color onSecondaryLight = Color(0xFFFFFFFF);
  static const Color secondaryContainerLight = Color(0xFFDAE2F9);
  static const Color onSecondaryContainerLight = Color(0xFF131C2B);

  static const Color backgroundLight = Color(0xFFECEFF3);
  static const Color onBackgroundLight = Color(0xFF191C20);
  static const Color surfaceLight = Color(0xFFF8F9FF);
  static const Color onSurfaceLight = Color(0xFF191C20);
  static const Color surfaceVariantLight = Color(0xFFE0E2EC);
  static const Color onSurfaceVariantLight = Color(0xFF44474E);

  static const Color primaryDark = Color(0xFF47648A);
  static const Color onPrimaryDark = Color(0xFFFFFFFF);
  static const Color primaryContainerDark = Color(0xFF26415F);
  static const Color onPrimaryContainerDark = Color(0xFFD6E2FF);

  static const Color secondaryDark = Color(0xFFBEC6DC);
  static const Color onSecondaryDark = Color(0xFF283141);
  static const Color secondaryContainerDark = Color(0xFF3E4759);
  static const Color onSecondaryContainerDark = Color(0xFFDAE2F9);

  static const Color backgroundDark = Color(0xFF1A1C1E);
  static const Color onBackgroundDark = Color(0xFFE2E2E6);
  static const Color surfaceDark = Color(0xFF1A1C1E);
  static const Color onSurfaceDark = Color(0xFFE2E2E6);
  static const Color surfaceVariantDark = Color(0xFF44474E);
  static const Color onSurfaceVariantDark = Color(0xFFC4C6D0);

  static const Color errorLight = Color(0xFFBA1A1A);
  static const Color onErrorLight = Color(0xFFFFFFFF);
  static const Color errorDark = Color(0xFFFF6F61);
  static const Color onErrorDark = Color(0xFF690005);

  static const Color successLight = Color(0xFF4CAF50);
  static const Color successDark = Color(0xFF2E7D32);

  static const Color warningLight = Color(0xFFFFC107);
  static const Color warningDark = Color(0xFFFFA000);

  static const Color infoLight = Color(0xFF2196F3);
  static const Color infoDark = Color(0xFF1565C0);

  static const Color outline = Color(0xFF8E9199);
  static const Color shadow = Color(0xFF000000);
  static const Color divider = Color(0xFF44474E);

  static Color primaryText({required bool isDark}) =>
      isDark ? onBackgroundDark : onBackgroundLight;
  static Color secondaryText({required bool isDark}) =>
      isDark ? onSurfaceVariantDark : onSurfaceVariantLight;
  static Color disabledText({required bool isDark}) =>
      isDark ? onSurfaceDark.withAlpha(97) : onSurfaceLight.withAlpha(97);
}
