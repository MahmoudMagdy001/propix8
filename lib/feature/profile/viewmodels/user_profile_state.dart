import 'package:equatable/equatable.dart';

import '../../auth/models/auth_model.dart';
import '../../auth/views/map/models/city_model.dart';

enum UserProfileStatus {
  initial,
  loading,
  success,
  failure,
  updated,
  accountDeleted,
}

class UserProfileState extends Equatable {
  const UserProfileState({
    this.status = UserProfileStatus.initial,
    this.user,
    this.errorMessage,
    this.cities = const [],
  });

  final UserProfileStatus status;
  final User? user;
  final String? errorMessage;
  final List<City> cities;

  UserProfileState copyWith({
    UserProfileStatus? status,
    User? user,
    String? errorMessage,
    List<City>? cities,
  }) => UserProfileState(
    status: status ?? this.status,
    user: user ?? this.user,
    errorMessage: errorMessage ?? this.errorMessage,
    cities: cities ?? this.cities,
  );

  @override
  List<Object?> get props => [status, user, errorMessage, cities];
}
