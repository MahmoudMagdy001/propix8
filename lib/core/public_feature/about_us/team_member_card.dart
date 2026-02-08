import 'package:flutter/material.dart';

import '../../models/page_model.dart';
import '../../utils/context_extensions.dart';
import '../../utils/responsive_helper.dart';

class TeamMemberCard extends StatelessWidget {
  const TeamMemberCard({required this.member, super.key});

  final TeamMember? member;

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: context.theme.cardTheme.color,
      borderRadius: BorderRadius.circular(20.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: .04),
          blurRadius: 15,
          offset: const Offset(0, 8),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(3.r),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: context.colorScheme.primary.withValues(alpha: 0.1),
              width: 2,
            ),
          ),
          child: CircleAvatar(
            radius: 40.r,
            backgroundColor: context.colorScheme.surfaceContainerHighest,
            backgroundImage: member?.photo.isNotEmpty == true
                ? NetworkImage(member!.photo)
                : null,
            child: member?.photo.isEmpty == true
                ? Icon(
                    Icons.person,
                    size: 40.r,
                    color: context.colorScheme.primary.withValues(alpha: 0.5),
                  )
                : null,
          ),
        ),
        SizedBox(height: 12.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text(
            member?.name ?? context.l10n.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
        ),
        SizedBox(height: 4.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text(
            member?.position ?? context.l10n.position,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
  );
}
