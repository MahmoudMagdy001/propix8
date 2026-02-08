import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../core/widgets/reusable_sliver_carousel.dart';
import '../../models/unit_details_model.dart';
import '../../viewmodels/unit_details_cubit.dart';
import '../../viewmodels/unit_details_state.dart';

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
