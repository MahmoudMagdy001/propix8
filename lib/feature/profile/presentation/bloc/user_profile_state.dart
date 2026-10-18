import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/auth/data/models/auth_model.dart';
import 'package:propix8/feature/auth/data/models/city_model.dart';

part 'user_profile_state.freezed.dart';

enum UserProfileStatus {
  initial,
  loading,
  success,
  updated,
  accountDeleted,
  failure,
}

@freezed
abstract class UserProfileState with _$UserProfileState {
  const UserProfileState._();

  const factory UserProfileState({
    @Default(UserProfileStatus.initial) UserProfileStatus status,
    User? user,
    @Default(<City>[]) List<City> cities,
    @Default(0) int propertyBookingCount,
    @Default(0) int serviceBookingCount,
    String? errorMessage,
  }) = _UserProfileState;
}
