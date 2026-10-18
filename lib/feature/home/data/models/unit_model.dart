import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';

part 'unit_model.freezed.dart';
part 'unit_model.g.dart';

double _parseDouble(dynamic value) {
  if (value == null) return 0.0;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? 0.0;
  return 0.0;
}

double? _parseDoubleNullable(dynamic value) {
  if (value == null) return null;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}

@freezed
abstract class UnitModel with _$UnitModel {
  const UnitModel._();

  const factory UnitModel({
    @Default(0) int id,
    @Default('No Title') String title,
    @Default(0.0) double price,
    String? description,
    String? address,
    @JsonKey(name: 'image_url') String? imageUrl,
    int? bedrooms,
    int? bathrooms,
    double? area,
    @JsonKey(name: 'is_favourite') bool? isFavorite,
    @JsonKey(name: 'offer_type') String? offerType,
  }) = _UnitModel;

  factory UnitModel.fromJson(Map<String, dynamic> json) => UnitModel(
    id: (json['id'] as num?)?.toInt() ?? 0,
    title: json['title'] as String? ?? json['name'] as String? ?? 'No Title',
    description: json['description'] as String?,
    price: _parseDouble(json['price']),
    address: json['address'] as String? ?? json['location'] as String?,
    imageUrl:
        json['image_url'] as String? ??
        json['main_image'] as String? ??
        json['image'] as String?,
    bedrooms:
        json['bedrooms'] as int? ??
        json['rooms'] as int? ??
        json['beds'] as int?,
    bathrooms: json['bathrooms'] as int? ?? json['baths'] as int?,
    area: _parseDoubleNullable(json['area']),
    isFavorite: json['is_favourite'] as bool?,
    offerType: json['offer_type'] as String?,
  );

  factory UnitModel.fromDomain(UnitEntity entity) => UnitModel(
    id: entity.id,
    title: entity.title,
    price: entity.price,
    description: entity.description,
    address: entity.address,
    imageUrl: entity.imageUrl,
    bedrooms: entity.bedrooms,
    bathrooms: entity.bathrooms,
    area: entity.area,
    isFavorite: entity.isFavorite,
    offerType: entity.offerType,
  );

  UnitEntity toDomain() => UnitEntity(
    id: id,
    title: title,
    price: price,
    description: description,
    address: address,
    imageUrl: imageUrl,
    bedrooms: bedrooms,
    bathrooms: bathrooms,
    area: area,
    isFavorite: isFavorite,
    offerType: offerType,
  );

  UnitModel copyWithUnit({
    int? id,
    String? title,
    double? price,
    String? description,
    String? address,
    String? imageUrl,
    int? bedrooms,
    int? bathrooms,
    double? area,
    bool? isFavorite,
    String? offerType,
  }) =>
      UnitModel(
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        description: description ?? this.description,
        address: address ?? this.address,
        imageUrl: imageUrl ?? this.imageUrl,
        bedrooms: bedrooms ?? this.bedrooms,
        bathrooms: bathrooms ?? this.bathrooms,
        area: area ?? this.area,
        isFavorite: isFavorite ?? this.isFavorite,
        offerType: offerType ?? this.offerType,
      );

  static List<UnitModel> get dummyUnits => List.generate(
    5,
    (index) => const UnitModel(
      title: 'Dummy Unit',
      price: 1000000.0,
      description: 'Dummy Description',
      address: 'Dummy Address',
      bedrooms: 3,
      bathrooms: 2,
      area: 150.0,
      isFavorite: false,
    ),
  );
}
