import 'package:equatable/equatable.dart';

/// Represents a city with id and name for User model caching
class UserCity extends Equatable {
  const UserCity({this.id, this.name});

  factory UserCity.fromJson(Map<String, dynamic> json) =>
      UserCity(id: json['id'] as int?, name: json['name'] as String?);
  final int? id;
  final String? name;

  Map<String, dynamic> toJson() => {'id': id, 'name': name};

  @override
  List<Object?> get props => [id, name];
}

class User extends Equatable {
  const User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.avatar,
    this.address,
    this.cityId,
    this.city,
    this.status,
    this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    // Parse city object if present
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
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? avatar;
  final String? address;
  final int? cityId;
  final UserCity? city;
  final String? status;
  final String? role;

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

  @override
  List<Object?> get props => [
    id,
    name,
    email,
    phone,
    avatar,
    address,
    cityId,
    city,
    status,
    role,
  ];
}

class AuthResponse extends Equatable {
  const AuthResponse({this.token, this.user, this.message});

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
    token:
        json['token'] as String? ??
        (json['data'] as Map<String, dynamic>?)?['token'] as String? ??
        (json['data'] as Map<String, dynamic>?)?['access_token'] as String?,
    user: json['user'] != null
        ? User.fromJson(json['user'] as Map<String, dynamic>)
        : ((json['data'] as Map<String, dynamic>?)?['user'] != null
              ? User.fromJson(
                  (json['data'] as Map<String, dynamic>)['user']
                      as Map<String, dynamic>,
                )
              : null),
    message: json['message'] as String?,
  );
  final String? token;
  final User? user;
  final String? message;

  @override
  List<Object?> get props => [token, user, message];
}

class LoginRequest extends Equatable {
  const LoginRequest({required this.email, required this.password});
  final String email;
  final String password;

  Map<String, dynamic> toJson() => {'email': email, 'password': password};

  @override
  List<Object?> get props => [email, password];
}

class RegisterRequest extends Equatable {
  const RegisterRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.phone,
  });
  final String name;
  final String email;
  final String password;
  final String passwordConfirmation;
  final String phone;

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'password': password,
    'password_confirmation': passwordConfirmation,
    'phone': phone,
  };

  @override
  List<Object?> get props => [
    name,
    email,
    password,
    passwordConfirmation,
    phone,
  ];
}

class ResetPasswordRequest extends Equatable {
  const ResetPasswordRequest({
    required this.token,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });
  final String token;
  final String email;
  final String password;
  final String passwordConfirmation;

  Map<String, dynamic> toJson() => {
    'token': token,
    'email': email,
    'password': password,
    'password_confirmation': passwordConfirmation,
  };

  @override
  List<Object?> get props => [token, email, password, passwordConfirmation];
}
