import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/widgets/app_elevated_button.dart';
import 'package:propix8/feature/unit_details/domain/entities/review_entity.dart';

class ReviewSheet extends StatefulWidget {
  const ReviewSheet({
    this.review,
    this.onSubmit,
    super.key,
  });

  final ReviewEntity? review;
  final void Function(int rating, String? comment)? onSubmit;

  @override
  State<ReviewSheet> createState() => _ReviewSheetState();
}

class _ReviewSheetState extends State<ReviewSheet> {
  int _rating = 0;
  final TextEditingController _commentController = TextEditingController();
  final GlobalKey _starsRowKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    if (widget.review != null) {
      _rating = widget.review!.rating;
      _commentController.text = widget.review!.comment ?? '';
    }
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _updateRatingFromPosition(double globalDx) {
    final renderBox =
        _starsRowKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final localPosition = renderBox.globalToLocal(Offset(globalDx, 0));
    final totalWidth = renderBox.size.width;
    final starWidth = totalWidth / 5;

    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final dx = isRtl ? totalWidth - localPosition.dx : localPosition.dx;

    var newRating = (dx / starWidth).ceil();
    newRating = newRating.clamp(1, 5);

    if (newRating != _rating) {
      setState(() {
        _rating = newRating;
      });
      unawaited(HapticFeedback.selectionClick());
    }
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16.w,
          right: 16.w,
          top: 16.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: GestureDetector(
                onHorizontalDragUpdate: (details) =>
                    _updateRatingFromPosition(details.globalPosition.dx),
                onTapDown: (details) =>
                    _updateRatingFromPosition(details.globalPosition.dx),
                child: Row(
                  key: _starsRowKey,
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(5, (index) {
                    final starIndex = index + 1;
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Icon(
                        starIndex <= _rating ? Icons.star : Icons.star_border,
                        size: 36.sp,
                        color: Colors.amber,
                      ),
                    );
                  }),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            TextField(
              controller: _commentController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: context.l10n.review,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            AppElevatedButton(
              text: context.l10n.submitReview,
              onPressed: _rating > 0
                  ? () {
                      final comment = _commentController.text.trim();
                      widget.onSubmit?.call(
                        _rating,
                        comment.isEmpty ? null : comment,
                      );
                      Navigator.pop(context);
                    }
                  : null,
            ),
            SizedBox(height: 16.h),
          ],
        ),
      );
}
