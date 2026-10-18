import 'dart:async';

import 'package:propix8/core/services/booking_event_service.dart';
import 'package:propix8/core/shared/bloc/safe_bloc.dart';
import 'package:propix8/feature/auth/data/models/auth_model.dart';
import 'package:propix8/feature/bookings/domain/repositories/booking_repository.dart';
import 'package:propix8/feature/maintenance_bookings/domain/repositories/maintenance_booking_repository.dart';
import 'package:propix8/feature/profile/domain/usecases/delete_user_profile_usecase.dart';
import 'package:propix8/feature/profile/domain/usecases/get_profile_cities_usecase.dart';
import 'package:propix8/feature/profile/domain/usecases/get_user_profile_usecase.dart';
import 'package:propix8/feature/profile/domain/usecases/update_user_profile_usecase.dart';
import 'package:propix8/feature/profile/presentation/bloc/user_profile_event.dart';
import 'package:propix8/feature/profile/presentation/bloc/user_profile_state.dart';

class UserProfileBloc extends SafeBloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc({
    required GetUserProfileUseCase getUserProfileUseCase,
    required UpdateUserProfileUseCase updateUserProfileUseCase,
    required GetProfileCitiesUseCase getProfileCitiesUseCase,
    required DeleteUserProfileUseCase deleteUserProfileUseCase,
    required BookingRepository bookingRepository,
    required MaintenanceBookingRepository maintenanceBookingRepository,
    required BookingEventService bookingEventService,
    void Function(User user)? onUserUpdated,
  })  : _getUserProfileUseCase = getUserProfileUseCase,
        _updateUserProfileUseCase = updateUserProfileUseCase,
        _getProfileCitiesUseCase = getProfileCitiesUseCase,
        _deleteUserProfileUseCase = deleteUserProfileUseCase,
        _bookingRepository = bookingRepository,
        _maintenanceBookingRepository = maintenanceBookingRepository,
        _bookingEventService = bookingEventService,
        _onUserUpdated = onUserUpdated,
        super(const UserProfileState()) {
  on<UserProfileLoaded>(_onProfileLoaded);
  on<UserProfileUpdated>(_onProfileUpdated);
  on<UserProfileCitiesFetched>(_onCitiesFetched);
  on<UserProfileDeleted>(_onProfileDeleted);
  on<UserProfileUserChanged>(_onUserChanged);
  on<UserProfileBookingCountsRefreshed>(_onBookingCountsRefreshed);

  _bookingSubscription = _bookingEventService.bookingChanged.listen((_) {
    add(const UserProfileEvent.bookingCountsRefreshed());
  });
}

  final GetUserProfileUseCase _getUserProfileUseCase;
  final UpdateUserProfileUseCase _updateUserProfileUseCase;
  final GetProfileCitiesUseCase _getProfileCitiesUseCase;
  final DeleteUserProfileUseCase _deleteUserProfileUseCase;
  final BookingRepository _bookingRepository;
  final MaintenanceBookingRepository _maintenanceBookingRepository;
  final BookingEventService _bookingEventService;
  final void Function(User user)? _onUserUpdated;
  StreamSubscription<void>? _bookingSubscription;

  Future<void> _onProfileLoaded(
    UserProfileLoaded event,
    Emitter<UserProfileState> emit,
  ) async {
    emit(state.copyWith(status: UserProfileStatus.loading));
    final result = await _getUserProfileUseCase(forceRefresh: event.forceRefresh);
    await result.fold(
      (failure) async => emit(
        state.copyWith(status: UserProfileStatus.failure, errorMessage: failure.message),
      ),
      (user) async {
        _onUserUpdated?.call(user);
        emit(state.copyWith(status: UserProfileStatus.success, user: user));
        add(const UserProfileEvent.bookingCountsRefreshed());
      },
    );
  }

  Future<void> _onProfileUpdated(
    UserProfileUpdated event,
    Emitter<UserProfileState> emit,
  ) async {
    emit(state.copyWith(status: UserProfileStatus.loading));
    final result = await _updateUserProfileUseCase(
      event.data,
      avatarPath: event.avatarPath,
    );
    await result.fold(
      (failure) async => emit(
        state.copyWith(status: UserProfileStatus.failure, errorMessage: failure.message),
      ),
      (user) async {
        _onUserUpdated?.call(user);
        emit(state.copyWith(status: UserProfileStatus.updated, user: user));
      },
    );
  }

  Future<void> _onCitiesFetched(
    UserProfileCitiesFetched event,
    Emitter<UserProfileState> emit,
  ) async {
    final result = await _getProfileCitiesUseCase();
    result.fold(
      (failure) => emit(
        state.copyWith(status: UserProfileStatus.failure, errorMessage: failure.message),
      ),
      (cities) => emit(state.copyWith(cities: cities)),
    );
  }

  Future<void> _onProfileDeleted(
    UserProfileDeleted event,
    Emitter<UserProfileState> emit,
  ) async {
    emit(state.copyWith(status: UserProfileStatus.loading));
    final result = await _deleteUserProfileUseCase();
    result.fold(
      (failure) => emit(
        state.copyWith(status: UserProfileStatus.failure, errorMessage: failure.message),
      ),
      (_) => emit(state.copyWith(status: UserProfileStatus.accountDeleted)),
    );
  }

  void _onUserChanged(
    UserProfileUserChanged event,
    Emitter<UserProfileState> emit,
  ) {
    emit(state.copyWith(user: event.user));
    add(const UserProfileEvent.bookingCountsRefreshed());
  }

  Future<void> _onBookingCountsRefreshed(
    UserProfileBookingCountsRefreshed event,
    Emitter<UserProfileState> emit,
  ) async {
    try {
      final propertyBookings = await _bookingRepository.getBookings();
      final maintenanceBookingsEither =
          await _maintenanceBookingRepository.getMaintenanceBookings();

      final pCount =
          propertyBookings.pagination?.total ?? propertyBookings.data.length;
      final sCount = maintenanceBookingsEither.fold(
        (_) => 0,
        (data) => data.pagination?.total ?? data.bookings.length,
      );

      emit(
        state.copyWith(
          propertyBookingCount: pCount,
          serviceBookingCount: sCount,
        ),
      );
    } on Exception catch (_) {
      // Failed silently for background counts refresh
    }
  }

  @override
  Future<void> close() {
    unawaited(_bookingSubscription?.cancel());
    return super.close();
  }
}
