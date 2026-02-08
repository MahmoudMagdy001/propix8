import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:internet_state_manager/internet_state_manager.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/di/locator.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../core/utils/responsive_helper.dart';
import '../../../core/widgets/custom_back_button.dart';
import '../models/unit_details_model.dart';
import '../viewmodels/unit_details_cubit.dart';
import '../viewmodels/unit_details_state.dart';
import 'widgets/unit_action_buttons.dart';
import 'widgets/unit_amenities.dart';
import 'widgets/unit_compound.dart';
import 'widgets/unit_description.dart';
import 'widgets/unit_developer.dart';
import 'widgets/unit_floor_plan.dart';
import 'widgets/unit_header.dart';
import 'widgets/unit_image_gallery.dart';
import 'widgets/unit_location.dart';
import 'widgets/unit_related_section.dart';
import 'widgets/unit_reviews.dart';
import 'widgets/unit_specs.dart';
import 'widgets/unit_virtual_tour.dart';

class UnitDetailsView extends StatefulWidget {
  const UnitDetailsView({required this.unitId, super.key});
  final int unitId;

  @override
  State<UnitDetailsView> createState() => _UnitDetailsViewState();
}

class _UnitDetailsViewState extends State<UnitDetailsView> {
  late final UnitDetailsCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = locator<UnitDetailsCubit>()..loadUnitDetails(widget.unitId);
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
    value: _cubit,
    child: Scaffold(
      body: InternetStateManager(
        noInternetScreen: const NoInternetScreen(),
        onRestoreInternetConnection: () =>
            _cubit.loadUnitDetails(widget.unitId),
        child: BlocSelector<UnitDetailsCubit, UnitDetailsState, RequestStatus>(
          selector: (state) => state.status,
          builder: (context, status) {
            if (status == RequestStatus.failure) {
              return BlocSelector<UnitDetailsCubit, UnitDetailsState, String?>(
                selector: (state) => state.errorMessage,
                builder: (context, errorMessage) =>
                    Center(child: Text(errorMessage ?? context.l10n.error)),
              );
            }

            return BlocSelector<
              UnitDetailsCubit,
              UnitDetailsState,
              ({UnitDetailsModel? unit, bool hasRelated})
            >(
              selector: (state) =>
                  (unit: state.unit, hasRelated: state.relatedUnits.isNotEmpty),
              builder: (context, result) {
                final unit = result.unit;
                if (unit == null && status != RequestStatus.loading) {
                  return const SizedBox();
                }

                return Column(
                  children: [
                    Expanded(
                      child: Skeletonizer(
                        enabled: status == RequestStatus.loading,
                        child: CustomScrollView(
                          slivers: [
                            SliverAppBar(
                              leading: const CustomBackButton(),
                              title: Text(context.l10n.unitDetails),
                              actions: [
                                if (unit != null) ...[
                                  IconButton(
                                    icon: const Icon(Icons.compare_arrows),
                                    tooltip: context.l10n.compare,
                                    onPressed: () => context.pushNamed(
                                      AppRoutes.chooseProduct,
                                      pathParameters: {
                                        'baseId': unit.id.toString(),
                                      },
                                    ),
                                  ),
                                ],
                              ],
                              floating: true,
                            ),
                            const UnitImageGallery(),
                            SliverToBoxAdapter(child: SizedBox(height: 16.h)),
                            const UnitHeader(),
                            SliverToBoxAdapter(child: SizedBox(height: 16.h)),
                            const UnitSpecs(),
                            if (unit != null &&
                                unit.description.isNotEmpty) ...[
                              SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                              const UnitDescription(),
                            ],
                            if (unit != null &&
                                unit.media.any(
                                  (m) => m.type == 'floorplan',
                                )) ...[
                              SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                              const UnitFloorPlan(),
                            ],
                            if (unit != null && unit.amenities.isNotEmpty) ...[
                              SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                              const UnitAmenities(),
                            ],
                            if (unit != null &&
                                unit.latitude.isNotEmpty &&
                                unit.longitude.isNotEmpty) ...[
                              SliverToBoxAdapter(child: SizedBox(height: 8.h)),
                              const UnitLocation(),
                            ],
                            if (unit != null &&
                                unit.media.any((m) => m.type == 'video')) ...[
                              SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                              const UnitVirtualTour(),
                            ],
                            if (unit != null && unit.compound != null) ...[
                              SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                              const UnitCompound(),
                            ],
                            if (unit != null && unit.developer != null) ...[
                              SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                              const UnitDeveloper(),
                            ],
                            if (result.hasRelated) ...[
                              SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                              const UnitRelatedSection(),
                            ],
                            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                            const UnitReviews(),
                            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
      bottomNavigationBar: const UnitActionButtons(),
    ),
  );
}
