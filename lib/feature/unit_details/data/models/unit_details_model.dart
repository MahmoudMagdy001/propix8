import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/compounds/data/models/compound_model.dart';
import 'package:propix8/feature/developers/data/models/developer_model.dart';
import 'package:propix8/feature/unit_details/domain/entities/unit_details_entity.dart';

part 'unit_details_model.freezed.dart';
part 'unit_details_model.g.dart';

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
abstract class UnitDetailsModel with _$UnitDetailsModel {
  const factory UnitDetailsModel({
    @JsonKey(name: 'created_at', fromJson: _parseDateTime)
    required DateTime createdAt,
    @Default(0) int id,
    @Default('') String title,
    @Default('') String description,
    @Default('') String address,
    @JsonKey(fromJson: _parseDouble) @Default(0.0) double price,
    @JsonKey(name: 'price_per_m2', fromJson: _parseDouble)
    @Default(0.0)
    double pricePerM2,
    @JsonKey(name: 'offer_type') @Default('') String offerType,
    @JsonKey(fromJson: _parseDouble) @Default(0.0) double area,
    @JsonKey(name: 'land_area', fromJson: _parseDouble) double? landArea,
    @JsonKey(name: 'internal_area', fromJson: _parseDouble) double? internalArea,
    @Default(0) int rooms,
    @Default(0) int bathrooms,
    @Default(0) int garages,
    @JsonKey(name: 'build_year') @Default('') String buildYear,
    @Default('') String latitude,
    @Default('') String longitude,
    @Default('') String status,
    @JsonKey(name: 'is_favourite') @Default(false) bool isFavourite,
    @JsonKey(name: 'is_visible') @Default(true) bool isVisible,
    @JsonKey(name: 'development_status')
    @Default('')
    String developmentStatus,
    @Default(OwnerModel()) OwnerModel owner,
    @Default(<MediaModel>[]) List<MediaModel> media,
    @Default(CityModel()) CityModel city,
    @JsonKey(name: 'unit_type') @Default(UnitTypeModel()) UnitTypeModel unitType,
    CompoundModel? compound,
    DeveloperModel? developer,
    @Default(<AmenityModel>[]) List<AmenityModel> amenities,
    @JsonKey(name: 'average_rating', fromJson: _parseDouble)
    @Default(0.0)
    double averageRating,
    @JsonKey(name: 'reviews_count') @Default(0) int reviewsCount,
  }) = _UnitDetailsModel;

  const UnitDetailsModel._();

  factory UnitDetailsModel.fromJson(Map<String, dynamic>? json) =>
      json != null
          ? _$UnitDetailsModelFromJson(json)
          : UnitDetailsModel.dummyModel;

  UnitDetailsEntity toEntity() => UnitDetailsEntity(
        id: id,
        title: title,
        description: description,
        address: address,
        price: price,
        pricePerM2: pricePerM2,
        offerType: offerType,
        area: area,
        landArea: landArea,
        internalArea: internalArea,
        rooms: rooms,
        bathrooms: bathrooms,
        garages: garages,
        buildYear: buildYear,
        latitude: latitude,
        longitude: longitude,
        status: status,
        isFavourite: isFavourite,
        isVisible: isVisible,
        developmentStatus: developmentStatus,
        owner: owner.toEntity(),
        media: media.map((m) => m.toEntity()).toList(),
        city: city.toEntity(),
        unitType: unitType.toEntity(),
        compound: compound?.toDomain(),
        developer: developer?.toDomain(),
        amenities: amenities.map((a) => a.toEntity()).toList(),
        averageRating: averageRating,
        reviewsCount: reviewsCount,
        createdAt: createdAt,
      );

  static UnitDetailsModel dummyModel = UnitDetailsModel(
    createdAt: DateTime(2025),
    id: 1,
    title: 'Modern Apartment in New Cairo',
    description: 'Beautiful modern apartment with great views...',
    address: 'New Cairo, Egypt',
    price: 2500000,
    pricePerM2: 15000,
    offerType: 'sale',
    area: 150,
    rooms: 3,
    bathrooms: 2,
    garages: 1,
    buildYear: '2023',
    latitude: '30.0444',
    longitude: '31.2357',
    status: 'available',
    developmentStatus: 'completed',
    owner: const OwnerModel(
      id: 1,
      name: 'John Doe',
      email: 'john@example.com',
      phone: '0123456789',
      address: 'Cairo',
      status: 'active',
      role: 'agent',
    ),
    media: const [
      MediaModel(
        id: 1,
        processingStatus: 'completed',
        type: 'image',
      ),
      MediaModel(
        id: 2,
        processingStatus: 'completed',
        type: 'floorplan',
      ),
      MediaModel(
        id: 3,
        processingStatus: 'completed',
        type: 'video',
      ),
    ],
    city: const CityModel(id: 1, name: 'Cairo'),
    unitType: const UnitTypeModel(id: 1, name: 'Apartment'),
    compound: const CompoundModel(
      id: 1,
      name: 'Compound Name',
      description: 'Compound Description',
    ),
    developer: const DeveloperModel(
      id: 1,
      name: 'Developer Name',
      email: '',
      phone: '',
      address: '',
    ),
    amenities: const [
      AmenityModel(id: 1, name: 'Swimming Pool'),
      AmenityModel(id: 2, name: 'Gym'),
    ],
    averageRating: 4.0,
    reviewsCount: 10,
  );
}

@freezed
abstract class OwnerModel with _$OwnerModel {
  const factory OwnerModel({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String email,
    @Default('') String phone,
    @Default('') String address,
    @Default('') String avatar,
    @Default('') String status,
    @Default('') String role,
    CityModel? city,
  }) = _OwnerModel;

  const OwnerModel._();

  factory OwnerModel.fromJson(Map<String, dynamic>? json) =>
      json != null ? _$OwnerModelFromJson(json) : const OwnerModel();

  UnitOwnerEntity toEntity() => UnitOwnerEntity(
        id: id,
        name: name,
        email: email,
        phone: phone,
        address: address,
        avatar: avatar,
        status: status,
        role: role,
        city: city?.toEntity(),
      );
}

@freezed
abstract class MediaModel with _$MediaModel {
  const factory MediaModel({
    @Default(0) int id,
    @JsonKey(name: 'file_path') @Default('') String filePath,
    @JsonKey(name: 'hls_path') @Default('') String hlsPath,
    @JsonKey(name: 'processing_status') @Default('') String processingStatus,
    @Default('') String type,
  }) = _MediaModel;

  const MediaModel._();

  factory MediaModel.fromJson(Map<String, dynamic>? json) =>
      json != null ? _$MediaModelFromJson(json) : const MediaModel();

  UnitMediaEntity toEntity() => UnitMediaEntity(
        id: id,
        filePath: filePath,
        hlsPath: hlsPath,
        processingStatus: processingStatus,
        type: type,
      );
}

@freezed
abstract class CityModel with _$CityModel {
  const factory CityModel({
    @Default(0) int id,
    @Default('') String name,
  }) = _CityModel;

  const CityModel._();

  factory CityModel.fromJson(Map<String, dynamic>? json) =>
      json != null ? _$CityModelFromJson(json) : const CityModel();

  UnitCityEntity toEntity() => UnitCityEntity(id: id, name: name);
}

@freezed
abstract class UnitTypeModel with _$UnitTypeModel {
  const factory UnitTypeModel({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String icon,
  }) = _UnitTypeModel;

  const UnitTypeModel._();

  factory UnitTypeModel.fromJson(Map<String, dynamic>? json) =>
      json != null ? _$UnitTypeModelFromJson(json) : const UnitTypeModel();

  UnitTypeEntity toEntity() => UnitTypeEntity(id: id, name: name, icon: icon);
}

@freezed
abstract class AmenityModel with _$AmenityModel {
  const factory AmenityModel({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String icon,
  }) = _AmenityModel;

  const AmenityModel._();

  factory AmenityModel.fromJson(Map<String, dynamic>? json) =>
      json != null ? _$AmenityModelFromJson(json) : const AmenityModel();

  UnitAmenityEntity toEntity() =>
      UnitAmenityEntity(id: id, name: name, icon: icon);
}
