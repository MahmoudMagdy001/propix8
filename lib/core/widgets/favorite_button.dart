import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/utils/snackbar_utils.dart';
import 'package:propix8/feature/favorites/presentation/bloc/favorite_bloc.dart';
import 'package:propix8/feature/favorites/presentation/bloc/favorite_event.dart';
import 'package:propix8/feature/favorites/presentation/bloc/favorite_state.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({
    required this.unit,
    required this.isFavorite,
    this.size,
    this.padding,
    this.color,
    this.enableHapticFeedback = true,
    super.key,
  });

  final UnitEntity unit;
  final bool isFavorite;
  final double? size;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final bool enableHapticFeedback;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final bloc = context.read<FavoriteBloc>();
        if (!bloc.state.favorites.containsKey(widget.unit.id)) {
          bloc.add(
            FavoriteEvent.favoriteStatusUpdated(
              unitId: widget.unit.id,
              isFavorite: widget.isFavorite,
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) =>
      BlocSelector<FavoriteBloc, FavoriteState, bool>(
        selector: (state) =>
            state.favorites[widget.unit.id] ?? widget.isFavorite,
        builder: (context, currentFavorite) => IconButton(
          onPressed: () {
            if (widget.enableHapticFeedback) {
              unawaited(HapticFeedback.lightImpact());
            }

            final bloc = context.read<FavoriteBloc>();
            final isCurrentlyFavorite =
                bloc.state.favorites[widget.unit.id] ?? widget.isFavorite;

            if (context.mounted) {
              context.showSuccessSnackbar(
                !isCurrentlyFavorite
                    ? context.l10n.addedToFavorites
                    : context.l10n.removedFromFavorites,
              );
            }

            bloc.add(FavoriteEvent.favoriteToggled(widget.unit));
          },
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) =>
                ScaleTransition(scale: animation, child: child),
            child: Icon(
              currentFavorite ? Icons.favorite : Icons.favorite_outline,
              key: ValueKey<bool>(currentFavorite),
              color: currentFavorite
                  ? context.colors.primary
                  : (widget.color ?? Colors.white),
              size: widget.size ?? 24.sp,
            ),
          ),
          padding: widget.padding ?? EdgeInsets.all(8.w),
          constraints: const BoxConstraints(),
          splashRadius: (widget.size ?? 24.sp) * 0.8,
        ),
      );
}
