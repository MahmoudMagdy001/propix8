import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/responsive_helper.dart';

class DeveloperUnitsContactButtons extends StatelessWidget {
  const DeveloperUnitsContactButtons({
    required this.phone,
    required this.email,
    super.key,
  });

  final String phone;
  final String email;

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (phone.isNotEmpty)
          Expanded(
            child: _ContactButton(
              icon: Icons.phone_outlined,
              label: phone,
              onTap: () async {
                final launchUri = Uri.parse('tel:$phone');
                if (await canLaunchUrl(launchUri)) {
                  await launchUrl(
                    launchUri,
                    mode: LaunchMode.externalApplication,
                  );
                }
              },
            ),
          ),
        if (phone.isNotEmpty && email.isNotEmpty) SizedBox(width: 12.w),
        if (email.isNotEmpty)
          Expanded(
            child: _ContactButton(
              icon: Icons.email_outlined,
              label: email,
              onTap: () async {
                final launchUri = Uri.parse('mailto:$email');
                if (await canLaunchUrl(launchUri)) {
                  await launchUrl(
                    launchUri,
                    mode: LaunchMode.externalApplication,
                  );
                }
              },
            ),
          ),
      ],
    ),
  );
}

class _ContactButton extends StatelessWidget {
  const _ContactButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(8.r),
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 16.sp, color: context.colorScheme.primary),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.labelSmall?.copyWith(
                color: context.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
