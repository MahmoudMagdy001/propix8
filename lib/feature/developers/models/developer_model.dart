import 'package:equatable/equatable.dart';

class DeveloperResponse {
  DeveloperResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory DeveloperResponse.fromJson(Map<String, dynamic> json) =>
      DeveloperResponse(
        status: (json['status'] as bool?) ?? false,
        message: (json['message'] as String?) ?? '',
        data:
            (json['data'] as List?)
                ?.map((e) => DeveloperModel.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
      );
  final bool status;
  final String message;
  final List<DeveloperModel> data;
}

class DeveloperModel extends Equatable {
  const DeveloperModel({
    required this.id,
    required this.name,
    required this.logo,
    this.email,
    this.phone,
    this.address,
  });

  factory DeveloperModel.fromJson(Map<String, dynamic> json) => DeveloperModel(
    id: (json['id'] as int?) ?? 0,
    name: (json['name'] as String?) ?? '',
    logo: (json['logo'] as String?) ?? '',
    email: json['email'] as String?,
    phone: json['phone'] as String?,
    address: json['address'] as String?,
  );
  final int id;
  final String name;
  final String logo;
  final String? email;
  final String? phone;
  final String? address;

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'logo': logo,
    'email': email,
    'phone': phone,
    'address': address,
  };

  DeveloperModel copyWith({
    int? id,
    String? name,
    String? logo,
    String? email,
    String? phone,
    String? address,
  }) => DeveloperModel(
    id: id ?? this.id,
    name: name ?? this.name,
    logo: logo ?? this.logo,
    email: email ?? this.email,
    phone: phone ?? this.phone,
    address: address ?? this.address,
  );

  @override
  List<Object?> get props => [id, name, logo, email, phone, address];
}
