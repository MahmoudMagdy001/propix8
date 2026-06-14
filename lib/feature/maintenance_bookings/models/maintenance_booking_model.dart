import 'package:equatable/equatable.dart';

import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/feature/maintenance_services/models/maintenance_service_model.dart';

class MaintenanceBookingModel extends Equatable {
  const MaintenanceBookingModel({
    required this.id,
    required this.service,
    required this.phone,
    required this.address,
    required this.message,
    required this.status,
    required this.createdAt,
  });

  factory MaintenanceBookingModel.fromJson(Map<String, dynamic> json) =>
      MaintenanceBookingModel(
        id: (json['id'] as int?) ?? 0,
        service: json['service'] != null
            ? MaintenanceServiceModel.fromJson(json['service'] as Map<String, dynamic>)
            : null,
        phone: (json['phone'] as String?) ?? '',
        address: (json['address'] as String?) ?? '',
        message: (json['message'] as String?) ?? '',
        status: (json['status'] as String?) ?? '',
        createdAt: (json['created_at'] as String?) ?? '',
      );

  final int id;
  final MaintenanceServiceModel? service;
  final String phone;
  final String address;
  final String message;
  final String status;
  final String createdAt;

  MaintenanceBookingModel copyWith({
    int? id,
    MaintenanceServiceModel? service,
    String? phone,
    String? address,
    String? message,
    String? status,
    String? createdAt,
  }) => MaintenanceBookingModel(
    id: id ?? this.id,
    service: service ?? this.service,
    phone: phone ?? this.phone,
    address: address ?? this.address,
    message: message ?? this.message,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
  );

  @override
  List<Object?> get props => [
    id,
    service,
    phone,
    address,
    message,
    status,
    createdAt,
  ];
}

class MaintenanceBookingsListResponse extends Equatable {
  const MaintenanceBookingsListResponse({
    required this.status,
    required this.message,
    required this.data,
    this.pagination,
  });

  factory MaintenanceBookingsListResponse.fromJson(Map<String, dynamic> json) =>
      MaintenanceBookingsListResponse(
        status: (json['status'] as bool?) ?? false,
        message: (json['message'] as String?) ?? '',
        data: ((json['data'] as List?) ?? [])
            .map((e) => MaintenanceBookingModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        pagination: json['pagination'] != null
            ? PaginationModel.fromJson(json['pagination'] as Map<String, dynamic>)
            : null,
      );

  final bool status;
  final String message;
  final List<MaintenanceBookingModel> data;
  final PaginationModel? pagination;

  @override
  List<Object?> get props => [status, message, data, pagination];
}
