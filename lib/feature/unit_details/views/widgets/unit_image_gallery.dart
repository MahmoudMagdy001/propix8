import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/responsive_helper.dart';
import '../../../../core/widgets/favorite_button.dart';
import '../../../../core/widgets/reusable_sliver_carousel.dart';
import '../../../home/models/unit_model.dart';
import '../../models/unit_details_model.dart';
import '../../viewmodels/unit_details_cubit.dart';
import '../../viewmodels/unit_details_state.dart';

class UnitImageGallery extends StatelessWidget {
  const UnitImageGallery({super.key});

  @override
  Widget build(
    BuildContext context,
  ) => BlocSelector<UnitDetailsCubit, UnitDetailsState, UnitDetailsModel?>(
    selector: (state) => state.unit,
    builder: (context, unit) {
      final images = unit?.media.where((m) => m.type == 'image').toList() ?? [];

      if (images.isEmpty) {
        return SliverToBoxAdapter(
          child: Stack(
            children: [
              Container(
                height: 200.h,
                width: double.infinity,
                color: Colors.grey.shade200,
                child: Icon(
                  Icons.image_not_supported,
                  size: 50.sp,
                  color: Colors.grey,
                ),
              ),
              if (unit != null)
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: FavoriteButton(
                    unit: UnitModel(
                      id: unit.id,
                      title: unit.title,
                      price: unit.price,
                      isFavorite: unit.isFavourite,
                      address: unit.address,
                      bedrooms: unit.rooms,
                      bathrooms: unit.bathrooms,
                      area: unit.area,
                      description: unit.description,
                    ),
                    isFavorite: unit.isFavourite,
                    size: 26.sp,
                  ),
                ),
            ],
          ),
        );
      }

      return ReusableSliverCarousel<MediaModel>(
        items: images,
        imageUrlBuilder: (media) => media.filePath,
        overlay: unit == null
            ? null
            : Align(
                alignment: AlignmentDirectional.topEnd,
                child: FavoriteButton(
                  unit: UnitModel(
                    id: unit.id,
                    title: unit.title,
                    price: unit.price,
                    imageUrl: images.isNotEmpty ? images.first.filePath : null,
                    isFavorite: unit.isFavourite,
                    address: unit.address,
                    bedrooms: unit.rooms,
                    bathrooms: unit.bathrooms,
                    area: unit.area,
                    description: unit.description,
                  ),
                  isFavorite: unit.isFavourite,
                  size: 26.sp,
                ),
              ),
      );
    },
  );
}
