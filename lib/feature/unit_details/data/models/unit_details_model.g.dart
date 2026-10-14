// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UnitDetailsModel _$UnitDetailsModelFromJson(Map<String, dynamic> json) =>
    _UnitDetailsModel(
      createdAt: _parseDateTime(json['created_at']),
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      address: json['address'] as String? ?? '',
      price: json['price'] == null ? 0.0 : _parseDouble(json['price']),
      pricePerM2: json['price_per_m2'] == null
          ? 0.0
          : _parseDouble(json['price_per_m2']),
      offerType: json['offer_type'] as String? ?? '',
      area: json['area'] == null ? 0.0 : _parseDouble(json['area']),
      landArea: _parseDouble(json['land_area']),
      internalArea: _parseDouble(json['internal_area']),
      rooms: (json['rooms'] as num?)?.toInt() ?? 0,
      bathrooms: (json['bathrooms'] as num?)?.toInt() ?? 0,
      garages: (json['garages'] as num?)?.toInt() ?? 0,
      buildYear: json['build_year'] as String? ?? '',
      latitude: json['latitude'] as String? ?? '',
      longitude: json['longitude'] as String? ?? '',
      status: json['status'] as String? ?? '',
      isFavourite: json['is_favourite'] as bool? ?? false,
      isVisible: json['is_visible'] as bool? ?? true,
      developmentStatus: json['development_status'] as String? ?? '',
      owner: json['owner'] == null
          ? const OwnerModel()
          : OwnerModel.fromJson(json['owner'] as Map<String, dynamic>?),
      media:
          (json['media'] as List<dynamic>?)
              ?.map((e) => MediaModel.fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const <MediaModel>[],
      city: json['city'] == null
          ? const CityModel()
          : CityModel.fromJson(json['city'] as Map<String, dynamic>?),
      unitType: json['unit_type'] == null
          ? const UnitTypeModel()
          : UnitTypeModel.fromJson(json['unit_type'] as Map<String, dynamic>?),
      compound: json['compound'] == null
          ? null
          : CompoundModel.fromJson(json['compound'] as Map<String, dynamic>),
      developer: json['developer'] == null
          ? null
          : DeveloperModel.fromJson(json['developer'] as Map<String, dynamic>),
      amenities:
          (json['amenities'] as List<dynamic>?)
              ?.map((e) => AmenityModel.fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const <AmenityModel>[],
      averageRating: json['average_rating'] == null
          ? 0.0
          : _parseDouble(json['average_rating']),
      reviewsCount: (json['reviews_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$UnitDetailsModelToJson(_UnitDetailsModel instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'address': instance.address,
      'price': instance.price,
      'price_per_m2': instance.pricePerM2,
      'offer_type': instance.offerType,
      'area': instance.area,
      'land_area': instance.landArea,
      'internal_area': instance.internalArea,
      'rooms': instance.rooms,
      'bathrooms': instance.bathrooms,
      'garages': instance.garages,
      'build_year': instance.buildYear,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'status': instance.status,
      'is_favourite': instance.isFavourite,
      'is_visible': instance.isVisible,
      'development_status': instance.developmentStatus,
      'owner': instance.owner,
      'media': instance.media,
      'city': instance.city,
      'unit_type': instance.unitType,
      'compound': instance.compound,
      'developer': instance.developer,
      'amenities': instance.amenities,
      'average_rating': instance.averageRating,
      'reviews_count': instance.reviewsCount,
    };

_OwnerModel _$OwnerModelFromJson(Map<String, dynamic> json) => _OwnerModel(
  id: (json['id'] as num?)?.toInt() ?? 0,
  name: json['name'] as String? ?? '',
  email: json['email'] as String? ?? '',
  phone: json['phone'] as String? ?? '',
  address: json['address'] as String? ?? '',
  avatar: json['avatar'] as String? ?? '',
  status: json['status'] as String? ?? '',
  role: json['role'] as String? ?? '',
  city: json['city'] == null
      ? null
      : CityModel.fromJson(json['city'] as Map<String, dynamic>?),
);

Map<String, dynamic> _$OwnerModelToJson(_OwnerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'avatar': instance.avatar,
      'status': instance.status,
      'role': instance.role,
      'city': instance.city,
    };

_MediaModel _$MediaModelFromJson(Map<String, dynamic> json) => _MediaModel(
  id: (json['id'] as num?)?.toInt() ?? 0,
  filePath: json['file_path'] as String? ?? '',
  hlsPath: json['hls_path'] as String? ?? '',
  processingStatus: json['processing_status'] as String? ?? '',
  type: json['type'] as String? ?? '',
);

Map<String, dynamic> _$MediaModelToJson(_MediaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'file_path': instance.filePath,
      'hls_path': instance.hlsPath,
      'processing_status': instance.processingStatus,
      'type': instance.type,
    };

_CityModel _$CityModelFromJson(Map<String, dynamic> json) => _CityModel(
  id: (json['id'] as num?)?.toInt() ?? 0,
  name: json['name'] as String? ?? '',
);

Map<String, dynamic> _$CityModelToJson(_CityModel instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_UnitTypeModel _$UnitTypeModelFromJson(Map<String, dynamic> json) =>
    _UnitTypeModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      icon: json['icon'] as String? ?? '',
    );

Map<String, dynamic> _$UnitTypeModelToJson(_UnitTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
    };

_AmenityModel _$AmenityModelFromJson(Map<String, dynamic> json) =>
    _AmenityModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      icon: json['icon'] as String? ?? '',
    );

Map<String, dynamic> _$AmenityModelToJson(_AmenityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
    };
