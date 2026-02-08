import 'package:equatable/equatable.dart';

import 'maintenance_service_model.dart';

class MaintenanceBookingResponse extends Equatable {
  const MaintenanceBookingResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory MaintenanceBookingResponse.fromJson(Map<String, dynamic> json) =>
      MaintenanceBookingResponse(
        status: json['status'] ?? false,
        message: json['message'] ?? '',
        data: json['data'] != null
            ? MaintenanceBookingData.fromJson(json['data'])
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
        id: json['id'] ?? 0,
        service: json['service'] != null
            ? MaintenanceServiceModel.fromJson(json['service'])
            : null,
        phone: json['phone'] ?? '',
        address: json['address'] ?? '',
        message: json['message'] ?? '',
        status: json['status'] ?? '',
        createdAt: json['created_at'] ?? '',
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
