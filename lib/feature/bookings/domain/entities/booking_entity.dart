import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/core/models/pagination_model.dart';

part 'booking_entity.freezed.dart';

@freezed
abstract class BookingUserEntity with _$BookingUserEntity {
  const factory BookingUserEntity({
    required int id,
    required String name,
    required String email,
  }) = _BookingUserEntity;
}

@freezed
abstract class BookingCityEntity with _$BookingCityEntity {
  const factory BookingCityEntity({
    required int id,
    required String name,
  }) = _BookingCityEntity;
}

@freezed
abstract class BookingCompoundEntity with _$BookingCompoundEntity {
  const factory BookingCompoundEntity({
    required int id,
    required String name,
  }) = _BookingCompoundEntity;
}

@freezed
abstract class BookingDeveloperEntity with _$BookingDeveloperEntity {
  const factory BookingDeveloperEntity({
    required int id,
    required String name,
  }) = _BookingDeveloperEntity;
}

@freezed
abstract class BookingUnitTypeEntity with _$BookingUnitTypeEntity {
  const factory BookingUnitTypeEntity({
    required int id,
    required String name,
    String? icon,
  }) = _BookingUnitTypeEntity;
}

@freezed
abstract class BookingUnitEntity with _$BookingUnitEntity {
  const factory BookingUnitEntity({
    required int id,
    required String title,
    required bool isVisible,
    required bool isFavourite,
    required String address,
    required double price,
    required String offerType,
    required double area,
    required int rooms,
    required int bathrooms,
    required BookingCityEntity city,
    required BookingUnitTypeEntity unitType,
    required String mainImage,
    required int averageRating,
    required int reviewsCount,
    required DateTime createdAt,
    BookingCompoundEntity? compound,
    BookingDeveloperEntity? developer,
  }) = _BookingUnitEntity;
}

@freezed
abstract class BookingEntity with _$BookingEntity {
  const factory BookingEntity({
    required int id,
    required int userId,
    required BookingUserEntity user,
    required BookingUnitEntity unit,
    required String name,
    required String email,
    required String phone,
    required String date,
    required String time,
    required String status,
    required String createdAt,
    required String updatedAt,
    String? notes,
    String? userMessage,
  }) = _BookingEntity;
}

@freezed
abstract class BookingResponse with _$BookingResponse {
  const factory BookingResponse({
    required bool status,
    required String message,
    required List<BookingEntity> data,
    PaginationModel? pagination,
  }) = _BookingResponse;
}

typedef BookingResponseEntity = BookingResponse;
typedef BookingModel = BookingEntity;
typedef BookingUnitModel = BookingUnitEntity;
