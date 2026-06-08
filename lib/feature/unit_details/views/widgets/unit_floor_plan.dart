import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/widgets/reusable_sliver_carousel.dart';
import 'package:propix8/feature/unit_details/models/unit_details_model.dart';
import 'package:propix8/feature/unit_details/viewmodels/unit_details_cubit.dart';
import 'package:propix8/feature/unit_details/viewmodels/unit_details_state.dart';

class UnitFloorPlan extends StatelessWidget {
  const UnitFloorPlan({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocSelector<UnitDetailsCubit, UnitDetailsState, List<MediaModel>>(
        selector: (state) =>
            state.unit?.media.where((m) => m.type == 'floorplan').toList() ??
            [],
        builder: (context, floorplans) {
          if (floorplans.isEmpty) {
            return const SliverToBoxAdapter(child: SizedBox());
          }

          return ReusableSliverCarousel<MediaModel>(
            title: context.l10n.floorPlan,
            items: floorplans,
            imageUrlBuilder: (media) => media.filePath,
          );
        },
      );
}
