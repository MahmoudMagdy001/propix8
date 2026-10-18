// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookingUserDto _$BookingUserDtoFromJson(Map<String, dynamic> json) =>
    _BookingUserDto(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
    );

Map<String, dynamic> _$BookingUserDtoToJson(_BookingUserDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
    };

_BookingCityDto _$BookingCityDtoFromJson(Map<String, dynamic> json) =>
    _BookingCityDto(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$BookingCityDtoToJson(_BookingCityDto instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_BookingCompoundDto _$BookingCompoundDtoFromJson(Map<String, dynamic> json) =>
    _BookingCompoundDto(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$BookingCompoundDtoToJson(_BookingCompoundDto instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_BookingDeveloperDto _$BookingDeveloperDtoFromJson(Map<String, dynamic> json) =>
    _BookingDeveloperDto(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$BookingDeveloperDtoToJson(
  _BookingDeveloperDto instance,
) => <String, dynamic>{'id': instance.id, 'name': instance.name};

_BookingUnitTypeDto _$BookingUnitTypeDtoFromJson(Map<String, dynamic> json) =>
    _BookingUnitTypeDto(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$BookingUnitTypeDtoToJson(_BookingUnitTypeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
    };

_BookingUnitDto _$BookingUnitDtoFromJson(
  Map<String, dynamic> json,
) => _BookingUnitDto(
  city: BookingCityDto.fromJson(json['city'] as Map<String, dynamic>),
  unitType: BookingUnitTypeDto.fromJson(
    json['unit_type'] as Map<String, dynamic>,
  ),
  createdAt: _parseDateTime(json['created_at']),
  id: (json['id'] as num?)?.toInt() ?? 0,
  title: json['title'] as String? ?? '',
  isVisible: json['is_visible'] as bool? ?? false,
  isFavourite: json['is_favourite'] as bool? ?? false,
  address: json['address'] as String? ?? '',
  price: json['price'] == null ? 0.0 : _parseDouble(json['price']),
  offerType: json['offer_type'] as String? ?? '',
  area: json['area'] == null ? 0.0 : _parseDouble(json['area']),
  rooms: (json['rooms'] as num?)?.toInt() ?? 0,
  bathrooms: (json['bathrooms'] as num?)?.toInt() ?? 0,
  mainImage: json['main_image'] as String? ?? '',
  averageRating: (json['average_rating'] as num?)?.toInt() ?? 0,
  reviewsCount: (json['reviews_count'] as num?)?.toInt() ?? 0,
  compound: json['compound'] == null
      ? null
      : BookingCompoundDto.fromJson(json['compound'] as Map<String, dynamic>),
  developer: json['developer'] == null
      ? null
      : BookingDeveloperDto.fromJson(json['developer'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BookingUnitDtoToJson(_BookingUnitDto instance) =>
    <String, dynamic>{
      'city': instance.city,
      'unit_type': instance.unitType,
      'created_at': instance.createdAt.toIso8601String(),
      'id': instance.id,
      'title': instance.title,
      'is_visible': instance.isVisible,
      'is_favourite': instance.isFavourite,
      'address': instance.address,
      'price': instance.price,
      'offer_type': instance.offerType,
      'area': instance.area,
      'rooms': instance.rooms,
      'bathrooms': instance.bathrooms,
      'main_image': instance.mainImage,
      'average_rating': instance.averageRating,
      'reviews_count': instance.reviewsCount,
      'compound': instance.compound,
      'developer': instance.developer,
    };

_BookingDto _$BookingDtoFromJson(Map<String, dynamic> json) => _BookingDto(
  user: BookingUserDto.fromJson(json['user'] as Map<String, dynamic>),
  unit: BookingUnitDto.fromJson(json['unit'] as Map<String, dynamic>),
  id: (json['id'] as num?)?.toInt() ?? 0,
  userId: (json['user_id'] as num?)?.toInt() ?? 0,
  name: json['name'] as String? ?? '',
  email: json['email'] as String? ?? '',
  phone: json['phone'] as String? ?? '',
  date: json['date'] as String? ?? '',
  time: json['time'] as String? ?? '',
  status: json['status'] as String? ?? '',
  createdAt: json['created_at'] as String? ?? '',
  updatedAt: json['updated_at'] as String? ?? '',
  notes: json['notes'] as String?,
  userMessage: json['user_message'] as String?,
);

Map<String, dynamic> _$BookingDtoToJson(_BookingDto instance) =>
    <String, dynamic>{
      'user': instance.user,
      'unit': instance.unit,
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'date': instance.date,
      'time': instance.time,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'notes': instance.notes,
      'user_message': instance.userMessage,
    };

_BookingResponseDto _$BookingResponseDtoFromJson(Map<String, dynamic> json) =>
    _BookingResponseDto(
      status: json['status'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => BookingDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <BookingDto>[],
      pagination: json['pagination'] == null
          ? null
          : PaginationModel.fromJson(
              json['pagination'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$BookingResponseDtoToJson(_BookingResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'pagination': instance.pagination,
    };
