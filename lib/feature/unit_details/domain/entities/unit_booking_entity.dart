import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';

part 'unit_booking_entity.freezed.dart';

@freezed
abstract class UnitBookingResponseEntity with _$UnitBookingResponseEntity {
  const factory UnitBookingResponseEntity({
    required bool status,
    required String message,
    UnitBookingEntity? data,
  }) = _UnitBookingResponseEntity;
}

@freezed
abstract class UnitBookingEntity with _$UnitBookingEntity {
  const factory UnitBookingEntity({
    required int id,
    required int userId,
    required String name,
    required String email,
    required String phone,
    required String date,
    required String time,
    required String status,
    required String notes,
    required String createdAt,
    UnitEntity? unit,
  }) = _UnitBookingEntity;
}
