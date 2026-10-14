import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/widgets/reusable_sliver_carousel.dart';
import 'package:propix8/feature/unit_details/domain/entities/unit_details_entity.dart';
import 'package:propix8/feature/unit_details/presentation/bloc/unit_details_bloc.dart';
import 'package:propix8/feature/unit_details/presentation/bloc/unit_details_state.dart';

class UnitFloorPlan extends StatelessWidget {
  const UnitFloorPlan({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocSelector<UnitDetailsBloc, UnitDetailsState, List<UnitMediaEntity>>(
        selector: (state) =>
            state.unit?.media.where((m) => m.type == 'floorplan').toList() ??
            [],
        builder: (context, floorplans) {
          if (floorplans.isEmpty) {
            return const SliverToBoxAdapter(child: SizedBox());
          }

          return ReusableSliverCarousel<UnitMediaEntity>(
            title: context.l10n.floorPlan,
            items: floorplans,
            imageUrlBuilder: (media) => media.filePath,
          );
        },
      );
}
