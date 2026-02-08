import 'package:flutter/material.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../models/faq_model.dart';

class FaqItem extends StatelessWidget {
  const FaqItem({required this.faq, super.key});

  final FaqModel faq;

  @override
  Widget build(BuildContext context) => Theme(
    data: context.theme.copyWith(
      dividerColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
    ),
    child: Container(
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
      child: ExpansionTile(
        title: Text(
          faq.question,
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        childrenPadding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
        expandedAlignment: Alignment.centerLeft,
        children: [
          Text(
            faq.answer,
            style: context.textTheme.bodyMedium?.copyWith(height: 1.5),
          ),
        ],
      ),
    ),
  );
}
