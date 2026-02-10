import 'package:equatable/equatable.dart';

import '../../auth/models/auth_model.dart';
import '../../auth/models/city_model.dart';

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
    this.propertyBookingCount = 0,
    this.serviceBookingCount = 0,
  });

  final UserProfileStatus status;
  final User? user;
  final String? errorMessage;
  final List<City> cities;
  final int propertyBookingCount;
  final int serviceBookingCount;

  UserProfileState copyWith({
    UserProfileStatus? status,
    User? user,
    String? errorMessage,
    List<City>? cities,
    int? propertyBookingCount,
    int? serviceBookingCount,
  }) => UserProfileState(
    status: status ?? this.status,
    user: user ?? this.user,
    errorMessage: errorMessage ?? this.errorMessage,
    cities: cities ?? this.cities,
    propertyBookingCount: propertyBookingCount ?? this.propertyBookingCount,
    serviceBookingCount: serviceBookingCount ?? this.serviceBookingCount,
  );

  @override
  List<Object?> get props => [
    status,
    user,
    errorMessage,
    cities,
    propertyBookingCount,
    serviceBookingCount,
  ];
}
