import 'package:equatable/equatable.dart';

import 'package:propix8/feature/maintenance_services/models/maintenance_service_model.dart';

class MaintenanceBookingResponse extends Equatable {
  const MaintenanceBookingResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory MaintenanceBookingResponse.fromJson(Map<String, dynamic> json) =>
      MaintenanceBookingResponse(
        status: (json['status'] as bool?) ?? false,
        message: (json['message'] as String?) ?? '',
        data: json['data'] != null
            ? MaintenanceBookingData.fromJson(json['data'] as Map<String, dynamic>)
            : null,
      );

  final bool status;
  final String message;
  final MaintenanceBookingData? data;

  @override
  List<Object?> get props => [status, message, data];
}

class MaintenanceBookingData extends Equatable {
  const MaintenanceBookingData({
    required this.id,
    required this.service,
    required this.phone,
    required this.address,
    required this.message,
    required this.status,
    required this.createdAt,
  });

  factory MaintenanceBookingData.fromJson(Map<String, dynamic> json) =>
      MaintenanceBookingData(
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
