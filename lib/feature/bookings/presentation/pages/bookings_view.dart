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
import 'package:propix8/feature/bookings/presentation/bloc/booking_bloc.dart';
import 'package:propix8/feature/bookings/presentation/bloc/booking_event.dart';
import 'package:propix8/feature/bookings/presentation/bloc/booking_state.dart';
import 'package:propix8/feature/bookings/presentation/widgets/bookings_empty_widget.dart';
import 'package:propix8/feature/bookings/presentation/widgets/bookings_error_widget.dart';
import 'package:propix8/feature/bookings/presentation/widgets/bookings_sliver_list.dart';

class BookingsView extends StatelessWidget {
  const BookingsView({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) =>
        locator<BookingBloc>()..add(const BookingEvent.fetchRequested()),
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
    context.read<BookingBloc>().add(const BookingEvent.loadMoreRequested());
  }

  @override
  void onConnectivityChanged({required bool isConnected}) {
    if (isConnected) {
      context.read<BookingBloc>().add(const BookingEvent.fetchRequested());
    } else {
      context.read<BookingBloc>().add(const BookingEvent.networkFailed());
    }
  }

  @override
  void initState() {
    super.initState();
    startConnectivityListener();
  }

  @override
  Widget build(BuildContext context) => BlocListener<BookingBloc, BookingState>(
    listenWhen: (previous, current) =>
        previous.status != current.status &&
        current.status == RequestStatus.failure,
    listener: (context, state) {
      if (state.bookings.isNotEmpty &&
          state.errorMessage != null &&
          state.errorMessage != 'Network Error' &&
          state.errorMessage != 'No Internet Connection') {
        context.showErrorSnackbar(state.errorMessage!);
      }
    },
    child: Scaffold(
      body: InternetStateManager(
        noInternetScreen: const NoInternetScreen(),
        onRestoreInternetConnection: () => context.read<BookingBloc>().add(
          const BookingEvent.fetchRequested(),
        ),
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<BookingBloc>().add(
              const BookingEvent.fetchRequested(isRefresh: true),
            );
          },
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
              BlocBuilder<BookingBloc, BookingState>(
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
