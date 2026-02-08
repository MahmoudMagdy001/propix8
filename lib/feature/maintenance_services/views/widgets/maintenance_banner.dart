import 'package:flutter/material.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/responsive_helper.dart';

class MaintenanceBanner extends StatelessWidget {
  const MaintenanceBanner({super.key});

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    height: 140.h,
    margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16.r),
      image: DecorationImage(
        image: const ResizeImage(
          AssetImage('assets/images/service_image_back.png'),
          width: 400,
        ),
        fit: BoxFit.fill,
        colorFilter: ColorFilter.mode(
          context.colorScheme.primaryContainer,
          BlendMode.luminosity,
        ),
      ),
    ),
    child: Stack(
      children: [
        PositionedDirectional(
          end: 0,
          bottom: 0,
          child: Image(
            image: const ResizeImage(
              AssetImage('assets/images/service_image.png'),
              width: 100,
            ),
            height: 80.h,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(
            start: 20.w,
            top: 0.h,
            bottom: 20.h,
            end: 110.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                context.l10n.maintenance_banner_title,
                style: context.textTheme.titleMedium?.copyWith(
                  color: context.colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                context.l10n.maintenance_banner_subtitle,
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onPrimaryContainer,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
