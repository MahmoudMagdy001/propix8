import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../settings/models/site_settings_model.dart';

class ContactUsSection extends StatelessWidget {
  const ContactUsSection({required this.settings, super.key});

  final SiteSettingsModel settings;

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.symmetric(horizontal: 10.w).copyWith(bottom: 24.h),
    padding: EdgeInsets.all(16.w),
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
    child: Column(
      children: [
        if (settings.sitePhone.isNotEmpty)
          _buildContactItem(
            context,
            icon: Icons.phone_outlined,
            title: settings.sitePhone,
            onTap: () => launchUrlString('tel:${settings.sitePhone}'),
          ),
        if (settings.siteEmail.isNotEmpty)
          _buildContactItem(
            context,
            icon: Icons.email_outlined,
            title: settings.siteEmail,
            onTap: () => launchUrlString('mailto:${settings.siteEmail}'),
          ),
        if (settings.siteAddress.isNotEmpty)
          _buildContactItem(
            context,
            icon: Icons.location_on_outlined,
            title: settings.siteAddress,
            onTap: () {},
          ),
        if (settings.socialFacebook.isNotEmpty ||
            settings.socialInstagram.isNotEmpty ||
            settings.socialTwitter.isNotEmpty) ...[
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (settings.socialFacebook.isNotEmpty)
                _buildSocialIcon(
                  context,
                  Icons.facebook,
                  () => launchUrlString(settings.socialFacebook),
                ),
              if (settings.socialInstagram.isNotEmpty)
                _buildSocialIcon(
                  context,
                  Icons.camera_alt_outlined,
                  () => launchUrlString(settings.socialInstagram),
                ),
              if (settings.socialTwitter.isNotEmpty)
                _buildSocialIcon(
                  context,
                  Icons.alternate_email,
                  () => launchUrlString(settings.socialTwitter),
                ),
            ],
          ),
        ],
      ],
    ),
  );

  Widget _buildContactItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) => ListTile(
    leading: Icon(icon, color: context.colorScheme.primary),
    title: Text(title, style: context.textTheme.bodyLarge),
    onTap: onTap,
    contentPadding: EdgeInsets.zero,
    visualDensity: VisualDensity.compact,
  );

  Widget _buildSocialIcon(
    BuildContext context,
    IconData icon,
    VoidCallback onTap,
  ) => IconButton(
    icon: Icon(icon, color: context.colorScheme.primary),
    onPressed: onTap,
  );
}
