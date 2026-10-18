import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/feature/bookings/domain/entities/booking_entity.dart';

part 'booking_dto.freezed.dart';
part 'booking_dto.g.dart';

double _parseDouble(dynamic value) {
  if (value == null) return 0.0;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? 0.0;
  return 0.0;
}

DateTime _parseDateTime(dynamic value) {
  if (value == null) return DateTime(2025);
  if (value is String) return DateTime.tryParse(value) ?? DateTime(2025);
  return DateTime(2025);
}

@freezed
abstract class BookingUserDto with _$BookingUserDto {
  const factory BookingUserDto({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String email,
  }) = _BookingUserDto;

  factory BookingUserDto.fromJson(Map<String, dynamic> json) =>
      _$BookingUserDtoFromJson(json);
}

extension BookingUserDtoX on BookingUserDto {
  BookingUserEntity toEntity() =>
      BookingUserEntity(id: id, name: name, email: email);
}

@freezed
abstract class BookingCityDto with _$BookingCityDto {
  const factory BookingCityDto({
    @Default(0) int id,
    @Default('') String name,
  }) = _BookingCityDto;

  factory BookingCityDto.fromJson(Map<String, dynamic> json) =>
      _$BookingCityDtoFromJson(json);
}

extension BookingCityDtoX on BookingCityDto {
  BookingCityEntity toEntity() => BookingCityEntity(id: id, name: name);
}

@freezed
abstract class BookingCompoundDto with _$BookingCompoundDto {
  const factory BookingCompoundDto({
    @Default(0) int id,
    @Default('') String name,
  }) = _BookingCompoundDto;

  factory BookingCompoundDto.fromJson(Map<String, dynamic> json) =>
      _$BookingCompoundDtoFromJson(json);
}

extension BookingCompoundDtoX on BookingCompoundDto {
  BookingCompoundEntity toEntity() =>
      BookingCompoundEntity(id: id, name: name);
}

@freezed
abstract class BookingDeveloperDto with _$BookingDeveloperDto {
  const factory BookingDeveloperDto({
    @Default(0) int id,
    @Default('') String name,
  }) = _BookingDeveloperDto;

  factory BookingDeveloperDto.fromJson(Map<String, dynamic> json) =>
      _$BookingDeveloperDtoFromJson(json);
}

extension BookingDeveloperDtoX on BookingDeveloperDto {
  BookingDeveloperEntity toEntity() =>
      BookingDeveloperEntity(id: id, name: name);
}

@freezed
abstract class BookingUnitTypeDto with _$BookingUnitTypeDto {
  const factory BookingUnitTypeDto({
    @Default(0) int id,
    @Default('') String name,
    String? icon,
  }) = _BookingUnitTypeDto;

  factory BookingUnitTypeDto.fromJson(Map<String, dynamic> json) =>
      _$BookingUnitTypeDtoFromJson(json);
}

extension BookingUnitTypeDtoX on BookingUnitTypeDto {
  BookingUnitTypeEntity toEntity() =>
      BookingUnitTypeEntity(id: id, name: name, icon: icon);
}

@freezed
abstract class BookingUnitDto with _$BookingUnitDto {
  const factory BookingUnitDto({
    required BookingCityDto city,
    @JsonKey(name: 'unit_type') required BookingUnitTypeDto unitType,
    @JsonKey(name: 'created_at', fromJson: _parseDateTime)
    required DateTime createdAt,
    @Default(0) int id,
    @Default('') String title,
    @JsonKey(name: 'is_visible') @Default(false) bool isVisible,
    @JsonKey(name: 'is_favourite') @Default(false) bool isFavourite,
    @Default('') String address,
    @JsonKey(fromJson: _parseDouble) @Default(0.0) double price,
    @JsonKey(name: 'offer_type') @Default('') String offerType,
    @JsonKey(fromJson: _parseDouble) @Default(0.0) double area,
    @Default(0) int rooms,
    @Default(0) int bathrooms,
    @JsonKey(name: 'main_image') @Default('') String mainImage,
    @JsonKey(name: 'average_rating') @Default(0) int averageRating,
    @JsonKey(name: 'reviews_count') @Default(0) int reviewsCount,
    BookingCompoundDto? compound,
    BookingDeveloperDto? developer,
  }) = _BookingUnitDto;

  factory BookingUnitDto.fromJson(Map<String, dynamic> json) =>
      _$BookingUnitDtoFromJson(json);
}

extension BookingUnitDtoX on BookingUnitDto {
  BookingUnitEntity toEntity() => BookingUnitEntity(
    id: id,
    title: title,
    isVisible: isVisible,
    isFavourite: isFavourite,
    address: address,
    price: price,
    offerType: offerType,
    area: area,
    rooms: rooms,
    bathrooms: bathrooms,
    city: city.toEntity(),
    compound: compound?.toEntity(),
    developer: developer?.toEntity(),
    unitType: unitType.toEntity(),
    mainImage: mainImage,
    averageRating: averageRating,
    reviewsCount: reviewsCount,
    createdAt: createdAt,
  );
}

@freezed
abstract class BookingDto with _$BookingDto {
  const factory BookingDto({
    required BookingUserDto user,
    required BookingUnitDto unit,
    @Default(0) int id,
    @JsonKey(name: 'user_id') @Default(0) int userId,
    @Default('') String name,
    @Default('') String email,
    @Default('') String phone,
    @Default('') String date,
    @Default('') String time,
    @Default('') String status,
    @JsonKey(name: 'created_at') @Default('') String createdAt,
    @JsonKey(name: 'updated_at') @Default('') String updatedAt,
    String? notes,
    @JsonKey(name: 'user_message') String? userMessage,
  }) = _BookingDto;

  factory BookingDto.fromJson(Map<String, dynamic> json) =>
      _$BookingDtoFromJson(json);
}

extension BookingDtoX on BookingDto {
  BookingEntity toEntity() => BookingEntity(
    id: id,
    userId: userId,
    user: user.toEntity(),
    unit: unit.toEntity(),
    name: name,
    email: email,
    phone: phone,
    date: date,
    time: time,
    status: status,
    notes: notes,
    userMessage: userMessage,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}

@freezed
abstract class BookingResponseDto with _$BookingResponseDto {
  const factory BookingResponseDto({
    @Default(false) bool status,
    @Default('') String message,
    @Default(<BookingDto>[]) List<BookingDto> data,
    PaginationModel? pagination,
  }) = _BookingResponseDto;

  factory BookingResponseDto.fromJson(Map<String, dynamic> json) =>
      _$BookingResponseDtoFromJson(json);
}

extension BookingResponseDtoX on BookingResponseDto {
  BookingResponse toEntity() => BookingResponse(
    status: status,
    message: message,
    data: data.map((d) => d.toEntity()).toList(),
    pagination: pagination,
  );
}
