import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Add this import
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../core/utils/snackbar_utils.dart';
import '../../../../core/widgets/app_elevated_button.dart';
import '../../models/review_model.dart';
import '../../viewmodels/unit_details_cubit.dart';
import '../../viewmodels/unit_details_state.dart';

class ReviewSheet extends StatefulWidget {
  const ReviewSheet({this.review, super.key});
  final ReviewModel? review;

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
    final RenderBox? renderBox =
        _starsRowKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final localPosition = renderBox.globalToLocal(Offset(globalDx, 0));
    final totalWidth = renderBox.size.width;
    final starWidth = totalWidth / 5;

    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final dx = isRtl ? totalWidth - localPosition.dx : localPosition.dx;

    int newRating = (dx / starWidth).ceil();
    newRating = newRating.clamp(1, 5);

    if (newRating != _rating) {
      setState(() {
        _rating = newRating;
      });
      // Haptic feedback when rating changes
      HapticFeedback.lightImpact();
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) => BlocConsumer<UnitDetailsCubit, UnitDetailsState>(
    listenWhen: (previous, current) =>
        previous.reviewStatus != current.reviewStatus,
    listener: (context, state) {
      if (state.reviewStatus == RequestStatus.success) {
        Navigator.pop(context);
        context.showSuccessSnackbar(
          widget.review != null
              ? context.l10n.reviewUpdatedSuccess
              : context.l10n.reviewSubmittedSuccess,
        );
        context.read<UnitDetailsCubit>().resetReviewStatus();
      } else if (state.reviewStatus == RequestStatus.failure) {
        context.showErrorSnackbar(
          state.reviewErrorMessage ?? context.l10n.reviewSubmissionError,
        );
        context.read<UnitDetailsCubit>().resetReviewStatus();
      }
    },
    builder: (context, state) {
      final isLoading = state.reviewStatus == RequestStatus.loading;

      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ⭐ Interactive Star Rating with Slide Gesture
            GestureDetector(
              behavior:
                  HitTestBehavior.opaque, // مهم عشان يمسك اللمس في كل المنطقة
              onPanUpdate: isLoading
                  ? null
                  : (details) {
                      _updateRatingFromPosition(details.globalPosition.dx);
                    },
              onTapDown: isLoading
                  ? null
                  : (details) {
                      _updateRatingFromPosition(details.globalPosition.dx);
                    },
              child: Container(
                key: _starsRowKey,
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    5,
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Icon(
                        index < _rating ? Icons.star : Icons.star_border,
                        color: index < _rating
                            ? Colors.amber
                            : Colors.grey.shade400,
                        size: 40.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.h),
            TextField(
              controller: _commentController,
              maxLines: 4,
              enabled: !isLoading,
              decoration: InputDecoration(
                hintText: context.l10n.writeComment,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: context.colorScheme.primary),
                ),
              ),
            ),
            SizedBox(height: 24.h),
            AppElevatedButton(
              onPressed: isLoading || _rating == 0
                  ? null
                  : () {
                      // Haptic feedback on submit
                      HapticFeedback.mediumImpact();
                      if (widget.review != null) {
                        context.read<UnitDetailsCubit>().updateReview(
                          widget.review!.id,
                          _rating,
                          _commentController.text,
                        );
                      } else {
                        context.read<UnitDetailsCubit>().submitReview(
                          _rating,
                          _commentController.text,
                        );
                      }
                    },
              isLoading: isLoading,
              enabled: _rating != 0,
              text: widget.review != null
                  ? context.l10n.updateReview
                  : context.l10n.submitReview,
              width: double.infinity,
            ),
          ],
        ),
      );
    },
  );
}
