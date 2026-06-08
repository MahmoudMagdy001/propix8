import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:propix8/l10n/app_localizations.dart';

extension ContextExtensions on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
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
