import 'package:flutter/material.dart';

import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/feature/our_services/models/service_model.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({required this.service, super.key});

  final ServiceModel service;

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.only(bottom: 12.h),
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
    child: Padding(
      padding: EdgeInsets.all(16.w),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: context.colorScheme.primary.withValues(alpha: .1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              _getServiceIcon(service),
              color: context.colorScheme.primary,
              size: 24.r,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  service.name,
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  service.description,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  IconData _getServiceIcon(ServiceModel service) {
    switch (service.id) {
      case 1:
        return Icons.search;
      case 2:
        return Icons.assessment_outlined;
      case 3:
        return Icons.gavel;
      case 4:
        return Icons.business_center_outlined;
      case 5:
        return Icons.campaign_outlined;
      case 6:
        return Icons.monetization_on_outlined;
    }

    final name = service.name.toLowerCase();
    if (name.contains('بحث')) return Icons.search;
    if (name.contains('تقييم')) return Icons.assessment_outlined;
    if (name.contains('قانون') || name.contains('استشار')) return Icons.gavel;
    if (name.contains('إدارة') || name.contains('ممتلكات')) {
      return Icons.business_center_outlined;
    }
    if (name.contains('تسويق')) return Icons.campaign_outlined;
    if (name.contains('تمويل')) return Icons.monetization_on_outlined;
    if (name.contains('صيانة')) return Icons.construction_outlined;
    if (name.contains('تنظيف')) return Icons.cleaning_services_outlined;

    return Icons.miscellaneous_services_outlined;
  }
}
