import 'package:flutter/material.dart';

import '../../../../core/utils/responsive_helper.dart';
import '../utils/context_extensions.dart';
import '../widgets/custom_back_button.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: const CustomBackButton(),
            floating: true,
            snap: true,
            centerTitle: true,
            title: Text(l10n.privacyPolicy),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 16.h),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildIntroSection(context, l10n.privacyPolicyIntro),
                SizedBox(height: 24.h),
                _buildSection(
                  context,
                  title: l10n.dataCollection,
                  content: l10n.dataCollectionContent,
                  icon: Icons.manage_search_outlined,
                ),
                SizedBox(height: 16.h),
                _buildSection(
                  context,
                  title: l10n.useOfData,
                  content: l10n.useOfDataContent,
                  icon: Icons.data_usage_outlined,
                ),
                SizedBox(height: 16.h),
                _buildSection(
                  context,
                  title: l10n.dataRetention,
                  content: l10n.dataRetentionContent,
                  icon: Icons.storage_outlined,
                ),
                SizedBox(height: 16.h),
                _buildSection(
                  context,
                  title: l10n.dataDeletion,
                  content: l10n.dataDeletionContent,
                  icon: Icons.delete_forever_outlined,
                ),
                SizedBox(height: 16.h),
                _buildSection(
                  context,
                  title: l10n.locationInformation,
                  content: l10n.locationInformationContent,
                  icon: Icons.location_on_outlined,
                ),
                SizedBox(height: 16.h),
                _buildSection(
                  context,
                  title: l10n.security,
                  content: l10n.securityContent,
                  icon: Icons.security_outlined,
                ),
                SizedBox(height: 16.h),
                _buildSection(
                  context,
                  title: l10n.changesToPolicy,
                  content: l10n.changesToPolicyContent,
                  icon: Icons.update_outlined,
                ),
                SizedBox(height: 32.h),

                _buildDateSection(context),
                SizedBox(height: 10.h),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIntroSection(BuildContext context, String content) => Container(
    padding: EdgeInsets.all(20.w),
    decoration: BoxDecoration(
      color: context.colorScheme.primary.withValues(alpha: .05),
      borderRadius: BorderRadius.circular(16.r),
      border: Border.all(
        color: context.colorScheme.primary.withValues(alpha: .1),
      ),
    ),
    child: Text(
      content,
      textAlign: TextAlign.center,
      style: context.textTheme.bodyLarge?.copyWith(
        color: context.colorScheme.primary,
        fontWeight: FontWeight.w600,
        height: 1.5,
      ),
    ),
  );

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required String content,
    required IconData icon,
  }) => Container(
    padding: EdgeInsets.all(20.w),
    decoration: BoxDecoration(
      color: context.theme.cardTheme.color,

      borderRadius: BorderRadius.circular(16.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: .03),
          blurRadius: 15,
          offset: const Offset(0, 5),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: context.colorScheme.primary.withValues(alpha: .1),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(icon, color: context.colorScheme.primary, size: 20.r),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                title,
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colorScheme.onSurface,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Text(
          content,
          style: context.textTheme.bodyMedium?.copyWith(
            height: 1.6,
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    ),
  );

  Widget _buildDateSection(BuildContext context) {
    // Using a fixed date or DateTime.now() as requested ("today's date")
    // Assuming the user implies the current effective date which is today.
    final now = DateTime.now();
    final formattedDate =
        '${now.day}/${now.month}/${now.year}'; // Simple format or use intl if preferred

    return Center(
      child: Text(
        formattedDate,
        style: context.textTheme.labelMedium?.copyWith(
          color: context.colorScheme.onSurfaceVariant.withValues(alpha: .6),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
