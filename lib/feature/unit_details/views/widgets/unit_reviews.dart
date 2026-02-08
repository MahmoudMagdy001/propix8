import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../core/widgets/app_modal_sheet.dart';
import '../../../auth/viewmodels/auth_cubit.dart';
import '../../../auth/viewmodels/auth_state.dart';
import '../../models/review_model.dart';
import '../../models/unit_details_model.dart';
import '../../viewmodels/unit_details_cubit.dart';
import '../../viewmodels/unit_details_state.dart';
import 'review_sheet.dart';

class UnitReviews extends StatelessWidget {
  const UnitReviews({super.key});

  @override
  Widget build(
    BuildContext context,
  ) => BlocListener<UnitDetailsCubit, UnitDetailsState>(
    listenWhen: (previous, current) =>
        previous.deleteReviewStatus != current.deleteReviewStatus,
    listener: (context, state) {
      if (state.deleteReviewStatus == RequestStatus.success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.l10n.reviewDeletedSuccess),
            backgroundColor: Colors.green,
          ),
        );
        context.read<UnitDetailsCubit>().resetDeleteReviewStatus();
      } else if (state.deleteReviewStatus == RequestStatus.failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.l10n.reviewSubmissionError),
            backgroundColor: Colors.red,
          ),
        );
        context.read<UnitDetailsCubit>().resetDeleteReviewStatus();
      }
    },
    child:
        BlocSelector<
          UnitDetailsCubit,
          UnitDetailsState,
          ({
            UnitDetailsModel? unit,
            List<ReviewModel> reviews,
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

            return SliverMainAxisGroup(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (unit.reviewsCount > 0)
                          Row(
                            children: [
                              const Icon(
                                Icons.star_rounded,
                                color: Colors.amber,
                                size: 20,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                unit.averageRating.toString(),
                                style: context.textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                '(${unit.reviewsCount} ${context.l10n.reviews})',
                                style: context.textTheme.bodySmall?.copyWith(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          )
                        else
                          Text(
                            '0 ${context.l10n.reviews}',
                            style: context.textTheme.bodySmall?.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                        BlocSelector<
                          UnitDetailsCubit,
                          UnitDetailsState,
                          List<ReviewModel>
                        >(
                          selector: (state) => state.reviews,
                          builder: (context, reviewsList) =>
                              BlocBuilder<AuthCubit, AuthState>(
                                builder: (context, authState) {
                                  final currentUserId = authState.user?.id;
                                  final userReview = currentUserId != null
                                      ? reviewsList
                                            .cast<ReviewModel?>()
                                            .firstWhere(
                                              (r) =>
                                                  r?.user.id == currentUserId,
                                              orElse: () => null,
                                            )
                                      : null;

                                  if (userReview != null) {
                                    return const SizedBox.shrink();
                                  }

                                  return InkWell(
                                    onTap: () {
                                      final cubit = context
                                          .read<UnitDetailsCubit>();
                                      showAppModalSheet(
                                        context: context,
                                        title: context.l10n.addReview,
                                        child: BlocProvider.value(
                                          value: cubit,
                                          child: const ReviewSheet(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      context.l10n.addReview,
                                      style: context.textTheme.bodyMedium
                                          ?.copyWith(
                                            color: context.colorScheme.primary,
                                            fontWeight: FontWeight.bold,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                    ),
                                  );
                                },
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 6.h)),
                if (result.reviews.isNotEmpty)
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, authState) {
                      final currentUserId = authState.user?.id;
                      return SliverPadding(
                        padding: EdgeInsets.symmetric(horizontal: 6.0.w),
                        sliver: SliverList.separated(
                          itemCount: result.reviews.length,
                          separatorBuilder: (_, _) => SizedBox(height: 4.h),
                          itemBuilder: (context, index) {
                            final review = result.reviews[index];
                            return _ReviewItem(
                              review: review,
                              isOwner: review.user.id == currentUserId,
                              onEdit: () {
                                final cubit = context.read<UnitDetailsCubit>();
                                showAppModalSheet(
                                  context: context,
                                  title: context.l10n.editReview,
                                  child: BlocProvider.value(
                                    value: cubit,
                                    child: ReviewSheet(review: review),
                                  ),
                                );
                              },
                              onDelete: () => _showDeleteConfirmationDialog(
                                context,
                                () => context
                                    .read<UnitDetailsCubit>()
                                    .deleteReview(review.id),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                if (result.hasMore)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(top: 16.h),
                      child: Center(
                        child: result.isLoadingMore
                            ? const CircularProgressIndicator()
                            : TextButton(
                                onPressed: () => context
                                    .read<UnitDetailsCubit>()
                                    .loadMoreReviews(),
                                child: Text(
                                  context.l10n.viewAllReviews,
                                  style: TextStyle(
                                    color: context.colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
  );

  Future<void> _showDeleteConfirmationDialog(
    BuildContext context,
    VoidCallback onConfirm,
  ) async => showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(context.l10n.deleteReviewConfirmationTitle),
      content: Text(context.l10n.deleteReviewConfirmationContent),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            context.l10n.cancel,
            style: const TextStyle(color: Colors.grey),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onConfirm();
          },
          child: Text(
            context.l10n.confirm,
            style: const TextStyle(color: Colors.red),
          ),
        ),
      ],
    ),
  );
}

class _ReviewItem extends StatelessWidget {
  const _ReviewItem({
    required this.review,
    this.isOwner = false,
    this.onEdit,
    this.onDelete,
  });

  final ReviewModel review;
  final bool isOwner;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.all(12.w),
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
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundColor: context.colorScheme.primary.withValues(
                alpha: .1,
              ),
              backgroundImage: review.user.avatar != null
                  ? CachedNetworkImageProvider(review.user.avatar!)
                  : null,
              child: review.user.avatar == null
                  ? Text(
                      review.user.name.isNotEmpty
                          ? review.user.name[0].toUpperCase()
                          : '?',
                      style: TextStyle(
                        color: context.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : null,
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review.user.name,
                    style: context.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    DateFormat.yMMMd().format(review.createdAt),
                    style: context.textTheme.bodySmall?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: List.generate(
                5,
                (index) => Icon(
                  index < review.rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 16.sp,
                ),
              ),
            ),
            if (isOwner) ...[
              SizedBox(width: 8.w),
              PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'edit') {
                    onEdit?.call();
                  } else if (value == 'delete') {
                    onDelete?.call();
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'edit',
                    child: Row(
                      children: [
                        Icon(
                          Icons.edit,
                          color: context.colorScheme.primary,
                          size: 20.sp,
                        ),
                        SizedBox(width: 8.w),
                        Text(context.l10n.editReview),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'delete',
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                          size: 20.sp,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          context.l10n.deleteReviewConfirmationTitle,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ],
                child: Icon(Icons.more_vert, color: Colors.grey, size: 20.sp),
              ),
            ],
          ],
        ),
        if (review.comment != null && review.comment!.isNotEmpty) ...[
          SizedBox(height: 12.h),
          Text(review.comment!, style: context.textTheme.bodyMedium),
        ],
      ],
    ),
  );
}
