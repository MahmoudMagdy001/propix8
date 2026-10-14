// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UnitModel _$UnitModelFromJson(Map<String, dynamic> json) => _UnitModel(
  id: (json['id'] as num?)?.toInt() ?? 0,
  title: json['title'] as String? ?? 'No Title',
  price: (json['price'] as num?)?.toDouble() ?? 0.0,
  description: json['description'] as String?,
  address: json['address'] as String?,
  imageUrl: json['image_url'] as String?,
  bedrooms: (json['bedrooms'] as num?)?.toInt(),
  bathrooms: (json['bathrooms'] as num?)?.toInt(),
  area: (json['area'] as num?)?.toDouble(),
  isFavorite: json['is_favourite'] as bool?,
  offerType: json['offer_type'] as String?,
);

Map<String, dynamic> _$UnitModelToJson(_UnitModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'address': instance.address,
      'image_url': instance.imageUrl,
      'bedrooms': instance.bedrooms,
      'bathrooms': instance.bathrooms,
      'area': instance.area,
      'is_favourite': instance.isFavorite,
      'offer_type': instance.offerType,
    };
