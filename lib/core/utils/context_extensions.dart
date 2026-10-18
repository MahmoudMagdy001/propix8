import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:propix8/core/theme/app_colors.dart';
import 'package:propix8/l10n/app_localizations.dart';

class AppRadius {
  const AppRadius();
  double get xs => 2.r;
  double get sm => 4.r;
  double get md => 8.r;
  double get lg => 16.r;
  double get xl => 24.r;
  double get full => 999.r;

  BorderRadius get xsBorder => BorderRadius.circular(xs);
  BorderRadius get smBorder => BorderRadius.circular(sm);
  BorderRadius get mdBorder => BorderRadius.circular(md);
  BorderRadius get lgBorder => BorderRadius.circular(lg);
  BorderRadius get xlBorder => BorderRadius.circular(xl);
  BorderRadius get fullBorder => BorderRadius.circular(full);
}

class AppDurations {
  const AppDurations();
  Duration get fast => const Duration(milliseconds: 150);
  Duration get normal => const Duration(milliseconds: 300);
  Duration get slow => const Duration(milliseconds: 500);
}

class AppSpacing {
  const AppSpacing();
  double get xs => 4.r;
  double get sm => 8.r;
  double get md => 16.r;
  double get lg => 24.r;
  double get xl => 32.r;
  double get xxl => 48.r;
  double get screenPadding => 16.r;
  double get cardGap => 12.r;
}

class AppSizes {
  const AppSizes();
  double get buttonHeight => 48.h;
  double get inputHeight => 52.h;
  double get minTouchTarget => 48.r;
}

extension AppColorSchemeExtensions on ColorScheme {
  Color get card => surface;
  Color get textPrimary => brightness == Brightness.dark
      ? AppColors.onBackgroundDark
      : AppColors.onBackgroundLight;
  Color get textSecondary => brightness == Brightness.dark
      ? AppColors.onSurfaceVariantDark
      : AppColors.onSurfaceVariantLight;
  Color get border => outline;
  Color get divider => outlineVariant;
  Color get success =>
      brightness == Brightness.dark ? AppColors.successDark : AppColors.successLight;
  Color get warning =>
      brightness == Brightness.dark ? AppColors.warningDark : AppColors.warningLight;
  Color get info =>
      brightness == Brightness.dark ? AppColors.infoDark : AppColors.infoLight;
}

extension AppTextThemeExtensions on TextTheme {
  TextStyle get h1 => headlineLarge ?? const TextStyle();
  TextStyle get h2 => headlineMedium ?? const TextStyle();
  TextStyle get h3 => headlineSmall ?? const TextStyle();
  TextStyle get body => bodyMedium ?? const TextStyle();
  TextStyle get caption => labelSmall ?? const TextStyle();
}

extension ContextExtensions on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  ColorScheme get colors => Theme.of(this).colorScheme;
  TextTheme get typography => Theme.of(this).textTheme;
  AppRadius get radius => const AppRadius();
  AppDurations get durations => const AppDurations();
  AppSpacing get spacing => const AppSpacing();
  AppSizes get sizes => const AppSizes();
}

extension CurrencyFormatter on num {
  String formatCurrency({required bool isArabic, int decimalDigits = 0}) {
    final formatter = NumberFormat.currency(
      locale: 'en_US',
      symbol: isArabic ? 'ج.م ' : 'EGP ',
      decimalDigits: decimalDigits,
    );

    return formatter.format(this);
  }
}
