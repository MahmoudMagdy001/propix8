import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/utils/snackbar_utils.dart';
import 'package:propix8/core/widgets/app_confirmation_dialog.dart';
import 'package:propix8/core/widgets/app_modal_sheet.dart';
import 'package:propix8/feature/auth/viewmodels/auth_cubit.dart';
import 'package:propix8/feature/home/presentation/bloc/home_state.dart';
import 'package:propix8/feature/unit_details/domain/entities/review_entity.dart';
import 'package:propix8/feature/unit_details/domain/entities/unit_details_entity.dart';
import 'package:propix8/feature/unit_details/presentation/bloc/unit_details_bloc.dart';
import 'package:propix8/feature/unit_details/presentation/bloc/unit_details_event.dart';
import 'package:propix8/feature/unit_details/presentation/bloc/unit_details_state.dart';
import 'package:propix8/feature/unit_details/presentation/widgets/review_sheet.dart';

class UnitReviews extends StatelessWidget {
  const UnitReviews({super.key});

  @override
  Widget build(
    BuildContext context,
  ) =>
      BlocListener<UnitDetailsBloc, UnitDetailsState>(
        listenWhen: (previous, current) =>
            previous.deleteReviewStatus != current.deleteReviewStatus ||
            previous.reviewStatus != current.reviewStatus,
        listener: (context, state) {
          if (state.deleteReviewStatus == HomeRequestStatus.success) {
            context.showSuccessSnackbar(context.l10n.reviewDeletedSuccess);
            context
                .read<UnitDetailsBloc>()
                .add(const UnitDetailsEvent.deleteReviewStatusReset());
          } else if (state.deleteReviewStatus == HomeRequestStatus.failure) {
            context.showErrorSnackbar(context.l10n.reviewSubmissionError);
            context
                .read<UnitDetailsBloc>()
                .add(const UnitDetailsEvent.deleteReviewStatusReset());
          }

          if (state.reviewStatus == HomeRequestStatus.success) {
            context.showSuccessSnackbar(context.l10n.reviewSubmittedSuccess);
            context
                .read<UnitDetailsBloc>()
                .add(const UnitDetailsEvent.reviewStatusReset());
          } else if (state.reviewStatus == HomeRequestStatus.failure) {
            context.showErrorSnackbar(
              state.reviewErrorMessage ?? context.l10n.reviewSubmissionError,
            );
            context
                .read<UnitDetailsBloc>()
                .add(const UnitDetailsEvent.reviewStatusReset());
          }
        },
        child: BlocSelector<
          UnitDetailsBloc,
          UnitDetailsState,
          ({
            UnitDetailsEntity? unit,
            List<ReviewEntity> reviews,
            bool hasMore,
            bool isLoadingMore,
          })
        >(
          selector: (state) => (
            unit: state.unit,
            reviews: state.reviews,
            hasMore: state.reviewsPagination.hasMorePages,
            isLoadingMore: state.isReviewsLoadingMore,
          ),
          builder: (context, result) {
            final unit = result.unit;
            if (unit == null) {
              return const SliverToBoxAdapter(child: SizedBox());
            }

            final currentUserId = context.read<AuthCubit>().state.user?.id;

            return SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${context.l10n.reviews} (${unit.reviewsCount})',
                          style: context.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: context.colorScheme.primary,
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            unawaited(
                              showAppModalSheet<void>(
                                context: context,
                                title: context.l10n.addReview,
                                child: ReviewSheet(
                                  onSubmit: (rating, comment) {
                                    context.read<UnitDetailsBloc>().add(
                                          UnitDetailsEvent.reviewSubmitted(
                                            rating: rating,
                                            comment: comment,
                                          ),
                                        );
                                  },
                                ),
                              ),
                            );
                          },
                          icon: Icon(Icons.rate_review_outlined, size: 18.sp),
                          label: Text(context.l10n.addReview),
                        ),
                      ],
                    ),
                    if (result.reviews.isEmpty)
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 24.h),
                        child: Center(
                          child: Text(
                            context.l10n.noData,
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ),
                      )
                    else ...[
                      SizedBox(height: 12.h),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: result.reviews.length,
                        separatorBuilder: (context, index) =>
                            Divider(height: 24.h, color: Colors.grey.shade200),
                        itemBuilder: (context, index) {
                          final review = result.reviews[index];
                          final isMyReview = currentUserId != null &&
                              currentUserId == review.user.id;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 18.r,
                                    backgroundImage:
                                        review.user.avatar != null &&
                                                review.user.avatar!.isNotEmpty
                                            ? CachedNetworkImageProvider(
                                                review.user.avatar!,
                                              )
                                            : null,
                                    child: review.user.avatar == null ||
                                            review.user.avatar!.isEmpty
                                        ? Text(
                                            review.user.name.isNotEmpty
                                                ? review.user.name[0]
                                                    .toUpperCase()
                                                : 'U',
                                          )
                                        : null,
                                  ),
                                  SizedBox(width: 12.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          review.user.name,
                                          style: context.textTheme.bodyMedium
                                              ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          DateFormat.yMMMd().format(
                                            review.createdAt,
                                          ),
                                          style: context.textTheme.labelSmall
                                              ?.copyWith(
                                            color: Colors.grey.shade500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: List.generate(
                                      5,
                                      (starIdx) => Icon(
                                        starIdx < review.rating
                                            ? Icons.star
                                            : Icons.star_border,
                                        size: 16.sp,
                                        color: Colors.amber,
                                      ),
                                    ),
                                  ),
                                  if (isMyReview)
                                    PopupMenuButton<String>(
                                      icon: Icon(
                                        Icons.more_vert,
                                        size: 18.sp,
                                        color: Colors.grey.shade600,
                                      ),
                                      onSelected: (action) {
                                        if (action == 'edit') {
                                          unawaited(
                                            showAppModalSheet<void>(
                                              context: context,
                                              title: context.l10n.editReview,
                                              child: ReviewSheet(
                                                review: review,
                                                onSubmit: (rating, comment) {
                                                  context
                                                      .read<UnitDetailsBloc>()
                                                      .add(
                                                        UnitDetailsEvent
                                                            .reviewUpdated(
                                                          reviewId: review.id,
                                                          rating: rating,
                                                          comment: comment,
                                                        ),
                                                      );
                                                },
                                              ),
                                            ),
                                          );
                                        } else if (action == 'delete') {
                                          unawaited(
                                            showAppConfirmationDialog(
                                              context,
                                              title: context.l10n
                                                  .deleteReviewConfirmationTitle,
                                              message: context.l10n
                                                  .deleteReviewConfirmationContent,
                                              confirmText:
                                                  context.l10n.delete,
                                              actionType:
                                                  DialogActionType.destructive,
                                              onConfirm: () {
                                                context
                                                    .read<UnitDetailsBloc>()
                                                    .add(
                                                      UnitDetailsEvent
                                                          .reviewDeleted(
                                                        review.id,
                                                      ),
                                                    );
                                              },
                                            ),
                                          );
                                        }
                                      },
                                      itemBuilder: (context) => [
                                        PopupMenuItem(
                                          value: 'edit',
                                          child: Text(context.l10n.edit),
                                        ),
                                        PopupMenuItem(
                                          value: 'delete',
                                          child: Text(context.l10n.delete),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                              if (review.comment != null &&
                                  review.comment!.isNotEmpty) ...[
                                SizedBox(height: 8.h),
                                Text(
                                  review.comment!,
                                  style:
                                      context.textTheme.bodyMedium?.copyWith(
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ],
                            ],
                          );
                        },
                      ),
                      if (result.hasMore)
                        Padding(
                          padding: EdgeInsets.only(top: 12.h),
                          child: Center(
                            child: result.isLoadingMore
                                ? const CircularProgressIndicator()
                                : TextButton(
                                    onPressed: () {
                                      context.read<UnitDetailsBloc>().add(
                                            const UnitDetailsEvent
                                                .reviewsMoreRequested(),
                                          );
                                    },
                                    child: Text(context.l10n.showMore),
                                  ),
                          ),
                        ),
                    ],
                  ],
                ),
              ),
            );
          },
        ),
      );
}
