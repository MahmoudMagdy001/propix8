import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/locator.dart';
import '../../auth/models/auth_model.dart';
import '../../auth/viewmodels/auth_cubit.dart';
import '../repositories/user_profile_repository.dart';
import 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit(this._repository) : super(const UserProfileState());

  final UserProfileRepository _repository;

  Future<void> loadProfile() async {
    emit(state.copyWith(status: UserProfileStatus.loading));
    final result = await _repository.getProfile();
    if (isClosed) return;
    result.fold(
      (error) => emit(
        state.copyWith(status: UserProfileStatus.failure, errorMessage: error),
      ),
      (user) {
        locator<AuthCubit>().updateUser(user);
        emit(state.copyWith(status: UserProfileStatus.success, user: user));
      },
    );
  }

  void setUser(User user) {
    emit(state.copyWith(user: user));
  }

  Future<void> updateProfile(
    Map<String, dynamic> data, {
    String? avatarPath,
  }) async {
    emit(state.copyWith(status: UserProfileStatus.loading));
    final result = await _repository.updateProfile(
      data,
      avatarPath: avatarPath,
    );
    if (isClosed) return;
    result.fold(
      (error) => emit(
        state.copyWith(status: UserProfileStatus.failure, errorMessage: error),
      ),
      (user) {
        locator<AuthCubit>().updateUser(user);
        emit(state.copyWith(status: UserProfileStatus.updated, user: user));
      },
    );
  }

  Future<void> fetchCities() async {
    final result = await _repository.getCities();
    if (isClosed) return;
    result.fold(
      (error) => emit(
        state.copyWith(status: UserProfileStatus.failure, errorMessage: error),
      ),
      (cities) => emit(state.copyWith(cities: cities)),
    );
  }

  Future<void> deleteProfile() async {
    emit(state.copyWith(status: UserProfileStatus.loading));
    final result = await _repository.deleteProfile();
    if (isClosed) return;
    result.fold(
      (error) => emit(
        state.copyWith(status: UserProfileStatus.failure, errorMessage: error),
      ),
      (_) => emit(state.copyWith(status: UserProfileStatus.accountDeleted)),
    );
  }
}
