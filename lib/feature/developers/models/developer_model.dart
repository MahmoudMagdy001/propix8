import 'package:equatable/equatable.dart';

class DeveloperResponse {
  DeveloperResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory DeveloperResponse.fromJson(Map<String, dynamic> json) =>
      DeveloperResponse(
        status: json['status'] ?? false,
        message: json['message'] ?? '',
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
    id: json['id'] ?? 0,
    name: json['name'] ?? '',
    logo: json['logo'] ?? '',
    email: json['email'],
    phone: json['phone'],
    address: json['address'],
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
