import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/widgets/favorite_button.dart';
import 'package:propix8/core/widgets/reusable_sliver_carousel.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';
import 'package:propix8/feature/unit_details/domain/entities/unit_details_entity.dart';
import 'package:propix8/feature/unit_details/presentation/bloc/unit_details_bloc.dart';
import 'package:propix8/feature/unit_details/presentation/bloc/unit_details_state.dart';

class UnitImageGallery extends StatelessWidget {
  const UnitImageGallery({super.key});

  @override
  Widget build(
    BuildContext context,
  ) =>
      BlocSelector<UnitDetailsBloc, UnitDetailsState, UnitDetailsEntity?>(
        selector: (state) => state.unit,
        builder: (context, unit) {
          final images =
              unit?.media.where((m) => m.type == 'image').toList() ?? [];

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
                        unit: _buildUnitEntity(unit),
                        isFavorite: unit.isFavourite,
                        size: 26.sp,
                      ),
                    ),
                ],
              ),
            );
          }

          return ReusableSliverCarousel<UnitMediaEntity>(
            items: images,
            imageUrlBuilder: (media) => media.filePath,
            overlay: unit == null
                ? null
                : Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: FavoriteButton(
                      unit: _buildUnitEntity(
                        unit,
                        imageUrl: images.first.filePath,
                      ),
                      isFavorite: unit.isFavourite,
                      size: 26.sp,
                    ),
                  ),
          );
        },
      );

  UnitEntity _buildUnitEntity(UnitDetailsEntity unit, {String? imageUrl}) =>
      UnitEntity(
        id: unit.id,
        title: unit.title,
        price: unit.price,
        imageUrl: imageUrl,
        isFavorite: unit.isFavourite,
        address: unit.address,
        bedrooms: unit.rooms,
        bathrooms: unit.bathrooms,
        area: unit.area,
        description: unit.description,
      );
}
