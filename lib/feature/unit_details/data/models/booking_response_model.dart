import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/home/data/models/unit_model.dart';
import 'package:propix8/feature/unit_details/domain/entities/unit_booking_entity.dart';

part 'booking_response_model.freezed.dart';
part 'booking_response_model.g.dart';

int _parseInt(dynamic value) {
  if (value == null) return 0;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value) ?? 0;
  return 0;
}

@freezed
abstract class BookingResponseModel with _$BookingResponseModel {
  const factory BookingResponseModel({
    @Default(false) bool status,
    @Default('') String message,
    BookingDataModel? data,
  }) = _BookingResponseModel;

  const BookingResponseModel._();

  factory BookingResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BookingResponseModelFromJson(json);

  UnitBookingResponseEntity toEntity() => UnitBookingResponseEntity(
        status: status,
        message: message,
        data: data?.toEntity(),
      );
}

@freezed
abstract class BookingDataModel with _$BookingDataModel {
  const factory BookingDataModel({
    @JsonKey(fromJson: _parseInt) @Default(0) int id,
    @JsonKey(name: 'user_id', fromJson: _parseInt) @Default(0) int userId,
    @Default('') String name,
    @Default('') String email,
    @Default('') String phone,
    @Default('') String date,
    @Default('') String time,
    @Default('') String status,
    @Default('') String notes,
    @JsonKey(name: 'created_at') @Default('') String createdAt,
    UnitModel? unit,
  }) = _BookingDataModel;

  const BookingDataModel._();

  factory BookingDataModel.fromJson(Map<String, dynamic> json) =>
      _$BookingDataModelFromJson(json);

  UnitBookingEntity toEntity() => UnitBookingEntity(
        id: id,
        userId: userId,
        name: name,
        email: email,
        phone: phone,
        date: date,
        time: time,
        status: status,
        notes: notes,
        createdAt: createdAt,
        unit: unit?.toDomain(),
      );
}
