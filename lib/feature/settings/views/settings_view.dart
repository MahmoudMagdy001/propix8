import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:propix8/core/router/app_routes.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/widgets/app_confirmation_dialog.dart';
import 'package:propix8/core/widgets/app_modal_sheet.dart';
import 'package:propix8/core/widgets/custom_back_button.dart';
import 'package:propix8/feature/settings/viewmodels/settings_cubit.dart';
import 'package:propix8/feature/settings/viewmodels/settings_state.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: const CustomBackButton(),
      title: Text(context.l10n.settings),
    ),
    body: ListView(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 20.h),
      children: [
        BlocSelector<SettingsCubit, SettingsState, ThemeMode>(
          selector: (state) => state.themeMode,
          builder: (context, themeMode) => _buildSettingItem(
            context,
            title: context.l10n.appearance,
            value: _getThemeName(context, themeMode),
            icon: Icons.brightness_6_outlined,
            onTap: () => _showThemeModal(context, themeMode),
          ),
        ),
        SizedBox(height: 12.h),
        BlocSelector<SettingsCubit, SettingsState, Locale>(
          selector: (state) => state.locale,
          builder: (context, locale) => _buildSettingItem(
            context,
            title: context.l10n.language,
            value: _getLanguageName(context, locale),
            icon: Icons.language_outlined,
            onTap: () => _showLanguageModal(context, locale),
          ),
        ),
      ],
    ),
  );

  Widget _buildSettingItem(
    BuildContext context, {
    required String title,
    required String value,
    required IconData icon,
    required VoidCallback onTap,
  }) => DecoratedBox(
    decoration: BoxDecoration(
      color: context.theme.cardTheme.color,
      borderRadius: BorderRadius.circular(12.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: .05),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Row(
            children: [
              Icon(icon),
              SizedBox(width: 16.w),
              Expanded(
                child: Text(title, style: context.textTheme.titleMedium),
              ),
              Text(
                value,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                ),
              ),
              SizedBox(width: 8.w),
              Icon(Icons.arrow_forward_ios, size: 16.r, color: Colors.grey),
            ],
          ),
        ),
      ),
    ),
  );

  Future<void> _showThemeModal(BuildContext context, ThemeMode currentMode) =>
      showAppModalSheet(
        context: context,
        title: context.l10n.chooseTheme,
        child: RadioGroup<ThemeMode>(
          groupValue: currentMode,
          onChanged: (val) {
            context.read<SettingsCubit>().updateTheme(val!);
            context.pop();
          },
          child: Column(
            children: [
              _buildRadioItem(
                context: context,
                title: context.l10n.system,
                icon: Icons.settings_suggest_outlined,
                value: ThemeMode.system,
                checked: currentMode == ThemeMode.system,
              ),
              _buildRadioItem(
                context: context,
                title: context.l10n.light,
                icon: Icons.light_mode_outlined,
                value: ThemeMode.light,
                checked: currentMode == ThemeMode.light,
              ),
              _buildRadioItem(
                context: context,
                title: context.l10n.dark,
                icon: Icons.dark_mode_outlined,
                value: ThemeMode.dark,
                checked: currentMode == ThemeMode.dark,
              ),
            ],
          ),
        ),
      );

  Future<void> _showLanguageModal(BuildContext context, Locale currentLocale) =>
      showAppModalSheet(
        context: context,
        title: context.l10n.chooseLanguage,
        child: RadioGroup<Locale>(
          groupValue: currentLocale,
          onChanged: (val) async {
            if (val!.languageCode != currentLocale.languageCode) {
              final confirmed = await _confirmLanguageChange(context);
              if ((confirmed ?? false) && context.mounted) {
                context.pop(); // Close modal
                await context.read<SettingsCubit>().updateLocale(val);
                // Navigate to home to refresh all data
                if (context.mounted) {
                  context.goNamed(AppRoutes.layout);
                }
              }
            } else {
              context.pop();
            }
          },
          child: Column(
            children: [
              _buildRadioItem(
                context: context,
                title: context.l10n.english,
                icon: Icons.language_outlined,
                value: const Locale('en'),
                checked: currentLocale.languageCode == 'en',
              ),
              _buildRadioItem(
                context: context,
                title: context.l10n.arabic,
                icon: Icons.translate_outlined,
                value: const Locale('ar'),
                checked: currentLocale.languageCode == 'ar',
              ),
            ],
          ),
        ),
      );

  Future<bool?> _confirmLanguageChange(BuildContext context) =>
      showAppConfirmationDialog(
        context,
        title: context.l10n.restartRequired,
        message: context.l10n.restartRequiredMessage,
        confirmText: context.l10n.restart,
      );

  Widget _buildRadioItem<T>({
    required BuildContext context,
    required String title,
    required IconData icon,
    required T value,
    required bool checked,
  }) => RadioListTile<T>(
    title: Row(
      children: [
        Icon(
          icon,
          size: 22.r,
          color: checked ? context.colorScheme.primary : null,
        ),
        SizedBox(width: 12.w),
        Text(title, style: context.textTheme.bodyLarge),
      ],
    ),
    value: value,
    controlAffinity: ListTileControlAffinity.trailing,
    selected: checked,
  );

  String _getThemeName(BuildContext context, ThemeMode mode) {
    switch (mode) {
      case ThemeMode.system:
        return context.l10n.system;
      case ThemeMode.light:
        return context.l10n.light;
      case ThemeMode.dark:
        return context.l10n.dark;
    }
  }

  String _getLanguageName(BuildContext context, Locale locale) {
    if (locale.languageCode == 'ar') {
      return context.l10n.arabic;
    }
    return context.l10n.english;
  }
}
