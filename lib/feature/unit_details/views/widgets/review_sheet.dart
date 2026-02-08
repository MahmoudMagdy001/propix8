import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<UnitDetailsCubit, UnitDetailsState>(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    5,
                    (index) => IconButton(
                      onPressed: isLoading
                          ? null
                          : () {
                              setState(() {
                                _rating = index + 1;
                              });
                            },
                      icon: Icon(
                        index < _rating ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 40.sp,
                      ),
                      padding: EdgeInsets.zero,
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
                      borderSide: BorderSide(
                        color: context.colorScheme.primary,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                AppElevatedButton(
                  onPressed: () {
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
                  textStyle: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  height: 50.h,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                ),
              ],
            ),
          );
        },
      );
}
