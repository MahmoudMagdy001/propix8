import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Add this import
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/utils/snackbar_utils.dart';
import 'package:propix8/feature/favorites/viewmodels/favorite_cubit.dart';
import 'package:propix8/feature/favorites/viewmodels/favorite_state.dart';
import 'package:propix8/feature/home/models/unit_model.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({
    required this.unit,
    required this.isFavorite,
    this.size,
    this.padding,
    this.color,
    this.enableHapticFeedback = true, // Optional: allow disabling
    super.key,
  });

  final UnitModel unit;
  final bool isFavorite;
  final double? size;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final bool enableHapticFeedback; // New parameter

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  void initState() {
    super.initState();
    // Initialize favorite status if not already in state
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final cubit = context.read<FavoriteCubit>();
        // Only update if this unit isn't already tracked
        if (!cubit.state.favorites.containsKey(widget.unit.id)) {
          cubit.updateFavoriteStatus(widget.unit.id, widget.isFavorite);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<FavoriteCubit, FavoriteState>(
        // Rebuild whenever favorites map changes
        buildWhen: (previous, current) =>
            previous.favorites != current.favorites,
        builder: (context, state) {
          // Use favorites map as source of truth, fallback to widget.isFavorite
          final bool currentFavorite;
          if (state.favorites.containsKey(widget.unit.id)) {
            currentFavorite = state.favorites[widget.unit.id]!;
          } else {
            currentFavorite = widget.isFavorite;
          }
          return IconButton(
            onPressed: () async {
              // Trigger haptic feedback
              if (widget.enableHapticFeedback) {
                HapticFeedback.lightImpact();
              }

              final cubit = context.read<FavoriteCubit>();
              final isCurrentlyFavorite =
                  cubit.state.favorites[widget.unit.id] ?? widget.isFavorite;

              // Show snackbar immediately (optimistic)
              if (context.mounted) {
                context.showSuccessSnackbar(
                  !isCurrentlyFavorite
                      ? context.l10n.addedToFavorites
                      : context.l10n.removedFromFavorites,
                );
              }

              await cubit.toggleFavorite(widget.unit);

              // If the operation fails, show an error snackbar
              if (context.mounted &&
                  cubit.state.status == FavoriteStatus.failure) {
                context.showErrorSnackbar(context.l10n.failedToUpdateFavorite);
              }
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) =>
                  ScaleTransition(scale: animation, child: child),
              child: Icon(
                currentFavorite ? Icons.favorite : Icons.favorite_outline,
                key: ValueKey<bool>(currentFavorite),
                color: currentFavorite
                    ? context.colorScheme.primary
                    : (widget.color ?? Colors.white),
                size: widget.size ?? 24.sp,
              ),
            ),
            padding: widget.padding ?? EdgeInsets.all(8.w),
            constraints: const BoxConstraints(),
            splashRadius: (widget.size ?? 24.sp) * 0.8,
          );
        },
      );
}
