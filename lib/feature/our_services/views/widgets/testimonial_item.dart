import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../core/widgets/app_confirmation_dialog.dart';
import '../../../auth/viewmodels/auth_cubit.dart';
import '../../../auth/viewmodels/auth_state.dart';
import '../../models/testimonial_model.dart';
import '../../viewmodels/our_services_cubit.dart';
import 'add_testimonial_sheet.dart';

class TestimonialItem extends StatelessWidget {
  const TestimonialItem({required this.testimonial, super.key});

  final TestimonialModel testimonial;

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: EdgeInsets.all(20.r),
    decoration: BoxDecoration(
      color: context.theme.cardTheme.color,
      borderRadius: BorderRadius.circular(20.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.06),
          blurRadius: 15,
          offset: const Offset(0, 8),
        ),
      ],
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 22.r,
              backgroundColor: context.colorScheme.primary.withValues(
                alpha: 0.1,
              ),
              backgroundImage: testimonial.image.isNotEmpty
                  ? CachedNetworkImageProvider(
                      testimonial.image,
                      maxHeight:
                          (44.r * MediaQuery.of(context).devicePixelRatio)
                              .round(),
                      maxWidth: (44.r * MediaQuery.of(context).devicePixelRatio)
                          .round(),
                    )
                  : null,
              child: testimonial.image.isEmpty
                  ? Icon(
                      Icons.person,
                      size: 24.r,
                      color: context.colorScheme.primary,
                    )
                  : null,
            ),

            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    testimonial.name,
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    children: [
                      if (testimonial.position.isNotEmpty) ...[
                        Flexible(
                          child: Text(
                            testimonial.position,
                            style: context.textTheme.bodySmall?.copyWith(
                              color: Colors.grey,
                              fontSize: 10.sp,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 8.w),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            BlocSelector<AuthCubit, AuthState, int?>(
              selector: (state) => state.user?.id,
              builder: (context, userId) {
                if (userId != null && userId == testimonial.userId) {
                  return PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'edit') {
                        AddTestimonialSheet.show(
                          context,
                          testimonial: testimonial,
                        );
                      } else if (value == 'delete') {
                        final cubit = context.read<OurServicesCubit>();
                        showAppConfirmationDialog(
                          context,
                          title: context.l10n.deleteTestimonial,
                          message: context.l10n.deleteConfirmation,
                          confirmText: context.l10n.delete,
                          actionType: DialogActionType.destructive,
                          onConfirm: () =>
                              cubit.deleteTestimonial(testimonial.id),
                        );
                      }
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'edit',
                        child: Text('Edit'),
                      ), // Wait, I should localize this too
                      PopupMenuItem(
                        value: 'edit',
                        child: Text(context.l10n.edit),
                      ),
                      PopupMenuItem(
                        value: 'delete',
                        child: Text(
                          context.l10n.delete,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Divider(
            height: 1,
            color: context.colorScheme.outlineVariant.withValues(alpha: 0.3),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.format_quote_rounded,
              color: context.colorScheme.primary.withValues(alpha: 0.4),
              size: 24.r,
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                testimonial.content.isNotEmpty
                    ? testimonial.content
                    : context.l10n.fallbackTestimonial,
                style: context.textTheme.bodyMedium?.copyWith(
                  height: 1.5,
                  color: context.textTheme.bodyLarge?.color?.withValues(
                    alpha: 0.8,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
