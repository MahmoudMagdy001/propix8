import 'package:propix8/feature/home/domain/entities/unit_entity.dart';

class UnitBookingResponseEntity {
  const UnitBookingResponseEntity({
    required this.status,
    required this.message,
    this.data,
  });

  final bool status;
  final String message;
  final UnitBookingEntity? data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnitBookingResponseEntity &&
          runtimeType == other.runtimeType &&
          status == other.status &&
          message == other.message &&
          data == other.data;

  @override
  int get hashCode => Object.hash(status, message, data);
}

class UnitBookingEntity {
  const UnitBookingEntity({
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
  final UnitEntity? unit;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnitBookingEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          userId == other.userId &&
          name == other.name &&
          email == other.email &&
          phone == other.phone &&
          date == other.date &&
          time == other.time &&
          status == other.status &&
          notes == other.notes &&
          createdAt == other.createdAt &&
          unit == other.unit;

  @override
  int get hashCode => Object.hash(
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
      );
}
