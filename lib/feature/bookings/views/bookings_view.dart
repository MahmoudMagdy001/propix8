import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_state_manager/internet_state_manager.dart';
import 'package:propix8/core/di/locator.dart';
import 'package:propix8/core/utils/context_extensions.dart';
import 'package:propix8/core/utils/mixins/connectivity_mixin.dart';
import 'package:propix8/core/utils/mixins/scroll_pagination_mixin.dart';
import 'package:propix8/core/utils/responsive_helper.dart';
import 'package:propix8/core/utils/snackbar_utils.dart';
import 'package:propix8/core/widgets/custom_back_button.dart';
import 'package:propix8/feature/bookings/viewmodels/booking_cubit.dart';
import 'package:propix8/feature/bookings/viewmodels/booking_state.dart';
import 'package:propix8/feature/bookings/views/widgets/bookings_empty_widget.dart';
import 'package:propix8/feature/bookings/views/widgets/bookings_error_widget.dart';
import 'package:propix8/feature/bookings/views/widgets/bookings_sliver_list.dart';

class BookingsView extends StatelessWidget {
  const BookingsView({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => locator<BookingCubit>()..fetchBookings(),
    child: const _BookingsViewContent(),
  );
}

class _BookingsViewContent extends StatefulWidget {
  const _BookingsViewContent();

  @override
  State<_BookingsViewContent> createState() => _BookingsViewContentState();
}

class _BookingsViewContentState extends State<_BookingsViewContent>
    with ScrollPaginationMixin, ConnectivityMixin {
  @override
  void onPageFetched() {
    context.read<BookingCubit>().loadMoreBookings();
  }

  @override
  void onConnectivityChanged(bool isConnected) {
    if (isConnected) {
      context.read<BookingCubit>().fetchBookings();
    } else {
      context.read<BookingCubit>().setNetworkFailure();
    }
  }

  @override
  void initState() {
    super.initState();
    startConnectivityListener();
  }

  @override
  Widget build(BuildContext context) =>
      BlocListener<BookingCubit, BookingState>(
        listenWhen: (previous, current) =>
            previous.status != current.status &&
            current.status == RequestStatus.failure,
        listener: (context, state) {
          if (state.bookings.isNotEmpty &&
              state.errorMessage != null &&
              state.errorMessage != 'Network Error') {
            context.showErrorSnackbar(state.errorMessage!);
          }
        },
        child: Scaffold(
          body: InternetStateManager(
            noInternetScreen: const NoInternetScreen(),
            onRestoreInternetConnection: () =>
                context.read<BookingCubit>().fetchBookings(),
            child: RefreshIndicator(
              onRefresh: () => context.read<BookingCubit>().fetchBookings(),
              child: CustomScrollView(
                controller: scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    leading: const CustomBackButton(),
                    title: Text(context.l10n.myBookings),
                    floating: true,
                    snap: true,
                  ),
                  const BookingsSliverList(),
                  const BookingsEmptyWidget(),
                  const BookingsErrorWidget(),
                  BlocBuilder<BookingCubit, BookingState>(
                    builder: (context, state) {
                      if (state.status == RequestStatus.loading &&
                          state.bookings.isNotEmpty) {
                        return SliverPadding(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          sliver: const SliverToBoxAdapter(
                            child: Center(child: CircularProgressIndicator()),
                          ),
                        );
                      }
                      return const SliverToBoxAdapter(child: SizedBox.shrink());
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
