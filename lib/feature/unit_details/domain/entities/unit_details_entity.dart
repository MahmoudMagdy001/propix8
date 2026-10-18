import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/compounds/domain/entities/compound_entity.dart';
import 'package:propix8/feature/developers/domain/entities/developer_entity.dart';

part 'unit_details_entity.freezed.dart';

@freezed
abstract class UnitDetailsEntity with _$UnitDetailsEntity {
  const UnitDetailsEntity._();

  const factory UnitDetailsEntity({
    required int id,
    required String title,
    required String description,
    required String address,
    required double price,
    required double pricePerM2,
    required String offerType,
    required double area,
    required int rooms,
    required int bathrooms,
    required int garages,
    required String buildYear,
    required String latitude,
    required String longitude,
    required String status,
    required bool isFavourite,
    required bool isVisible,
    required String developmentStatus,
    required UnitOwnerEntity owner,
    required List<UnitMediaEntity> media,
    required UnitCityEntity city,
    required UnitTypeEntity unitType,
    required List<UnitAmenityEntity> amenities,
    required double averageRating,
    required int reviewsCount,
    required DateTime createdAt,
    double? landArea,
    double? internalArea,
    CompoundEntity? compound,
    DeveloperEntity? developer,
  }) = _UnitDetailsEntity;

  String get mainImage =>
      media.where((m) => m.type == 'image').firstOrNull?.filePath ?? '';

  static UnitDetailsEntity dummy = UnitDetailsEntity(
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
    isFavourite: false,
    isVisible: true,
    developmentStatus: 'completed',
    owner: const UnitOwnerEntity(
      id: 1,
      name: 'John Doe',
      email: 'john@example.com',
      phone: '0123456789',
      address: 'Cairo',
      avatar: '',
      status: 'active',
      role: 'agent',
    ),
    media: const [
      UnitMediaEntity(
        id: 1,
        filePath: '',
        hlsPath: '',
        processingStatus: 'completed',
        type: 'image',
      ),
      UnitMediaEntity(
        id: 2,
        filePath: '',
        hlsPath: '',
        processingStatus: 'completed',
        type: 'floorplan',
      ),
      UnitMediaEntity(
        id: 3,
        filePath: '',
        hlsPath: '',
        processingStatus: 'completed',
        type: 'video',
      ),
    ],
    city: const UnitCityEntity(id: 1, name: 'Cairo'),
    unitType: const UnitTypeEntity(id: 1, name: 'Apartment', icon: ''),
    compound: const CompoundEntity(
      id: 1,
      name: 'Compound Name',
      description: 'Compound Description',
    ),
    developer: const DeveloperEntity(
      id: 1,
      name: 'Developer Name',
      logo: '',
      email: '',
      phone: '',
      address: '',
    ),
    amenities: const [
      UnitAmenityEntity(id: 1, name: 'Swimming Pool', icon: ''),
      UnitAmenityEntity(id: 2, name: 'Gym', icon: ''),
    ],
    averageRating: 4.0,
    reviewsCount: 10,
    createdAt: DateTime(2025),
  );
}

@freezed
abstract class UnitOwnerEntity with _$UnitOwnerEntity {
  const factory UnitOwnerEntity({
    required int id,
    required String name,
    required String email,
    required String phone,
    required String address,
    required String avatar,
    required String status,
    required String role,
    UnitCityEntity? city,
  }) = _UnitOwnerEntity;
}

@freezed
abstract class UnitMediaEntity with _$UnitMediaEntity {
  const factory UnitMediaEntity({
    required int id,
    required String filePath,
    required String hlsPath,
    required String processingStatus,
    required String type,
  }) = _UnitMediaEntity;
}

@freezed
abstract class UnitCityEntity with _$UnitCityEntity {
  const factory UnitCityEntity({
    required int id,
    required String name,
  }) = _UnitCityEntity;
}

@freezed
abstract class UnitTypeEntity with _$UnitTypeEntity {
  const factory UnitTypeEntity({
    required int id,
    required String name,
    required String icon,
  }) = _UnitTypeEntity;
}

@freezed
abstract class UnitAmenityEntity with _$UnitAmenityEntity {
  const factory UnitAmenityEntity({
    required int id,
    required String name,
    required String icon,
  }) = _UnitAmenityEntity;
}
