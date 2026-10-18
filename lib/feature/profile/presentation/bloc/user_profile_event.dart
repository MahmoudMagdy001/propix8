import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/auth/data/models/auth_model.dart';

part 'user_profile_event.freezed.dart';

@freezed
abstract class UserProfileEvent with _$UserProfileEvent {
  const factory UserProfileEvent.profileLoaded({
    @Default(false) bool forceRefresh,
  }) = UserProfileLoaded;

  const factory UserProfileEvent.profileUpdated(
    Map<String, dynamic> data, {
    String? avatarPath,
  }) = UserProfileUpdated;

  const factory UserProfileEvent.citiesFetched() = UserProfileCitiesFetched;

  const factory UserProfileEvent.profileDeleted() = UserProfileDeleted;

  const factory UserProfileEvent.userChanged(User user) = UserProfileUserChanged;

  const factory UserProfileEvent.bookingCountsRefreshed() =
      UserProfileBookingCountsRefreshed;
}
