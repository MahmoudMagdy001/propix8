import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
abstract class UserCity with _$UserCity {
  const factory UserCity({
    int? id,
    String? name,
  }) = _UserCity;

  factory UserCity.fromJson(Map<String, dynamic> json) =>
      _$UserCityFromJson(json);
}

@freezed
abstract class User with _$User {
  const User._();

  const factory User({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? avatar,
    String? address,
    int? cityId,
    UserCity? city,
    String? status,
    String? role,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) {
    UserCity? city;
    int? cityId;

    if (json['city'] != null && json['city'] is Map<String, dynamic>) {
      city = UserCity.fromJson(json['city'] as Map<String, dynamic>);
      cityId = city.id;
    } else if (json['city_id'] != null) {
      cityId = json['city_id'] is String
          ? int.tryParse(json['city_id'] as String)
          : json['city_id'] as int?;
    }

    return User(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone']?.toString(),
      avatar: json['avatar'] as String?,
      address: json['address'] as String?,
      cityId: cityId,
      city: city,
      status: json['status'] as String?,
      role: json['role'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'phone': phone,
    'avatar': avatar,
    'address': address,
    'city_id': cityId,
    'city': city?.toJson(),
    'status': status,
    'role': role,
  };
}
