import 'package:equatable/equatable.dart';

import '../../home/models/unit_model.dart';

class BookingResponse extends Equatable {
  const BookingResponse({
    required this.status,
    required this.message,
    this.data,
  });

  factory BookingResponse.fromJson(Map<String, dynamic> json) =>
      BookingResponse(
        status: json['status'] as bool? ?? false,
        message: json['message'] as String? ?? '',
        data: json['data'] != null
            ? BookingData.fromJson(json['data'] as Map<String, dynamic>)
            : null,
      );

  final bool status;
  final String message;
  final BookingData? data;

  @override
  List<Object?> get props => [status, message, data];
}

class BookingData extends Equatable {
  const BookingData({
    required this.id,
    required this.userId,
    required this.name,
    required this.email,
    required this.phone,
    required this.date,
    required this.time,
    required this.status,
    required this.notes,
    required this.createdAt,
    this.unit,
  });

  factory BookingData.fromJson(Map<String, dynamic> json) => BookingData(
    id: json['id'] as int? ?? 0,
    userId: json['user_id'] as int? ?? 0,
    name: json['name'] as String? ?? '',
    email: json['email'] as String? ?? '',
    phone: json['phone'] as String? ?? '',
    date: json['date'] as String? ?? '',
    time: json['time'] as String? ?? '',
    status: json['status'] as String? ?? '',
    notes: json['notes'] as String? ?? '',
    createdAt: json['created_at'] as String? ?? '',
    unit: json['unit'] != null
        ? UnitModel.fromJson(json['unit'] as Map<String, dynamic>)
        : null,
  );

  final int id;
  final int userId;
  final String name;
  final String email;
  final String phone;
  final String date;
  final String time;
  final String status;
  final String notes;
  final String createdAt;
  final UnitModel? unit;

  @override
  List<Object?> get props => [
    id,
    userId,
    name,
    email,
    phone,
    date,
    time,
    status,
    notes,
    createdAt,
    unit,
  ];
}
