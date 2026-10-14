import 'package:flutter/foundation.dart';
import 'package:propix8/feature/compounds/domain/entities/compound_entity.dart';
import 'package:propix8/feature/developers/domain/entities/developer_entity.dart';

class UnitDetailsEntity {
  const UnitDetailsEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.address,
    required this.price,
    required this.pricePerM2,
    required this.offerType,
    required this.area,
    required this.rooms,
    required this.bathrooms,
    required this.garages,
    required this.buildYear,
    required this.latitude,
    required this.longitude,
    required this.status,
    required this.isFavourite,
    required this.isVisible,
    required this.developmentStatus,
    required this.owner,
    required this.media,
    required this.city,
    required this.unitType,
    required this.amenities,
    required this.averageRating,
    required this.reviewsCount,
    required this.createdAt,
    this.landArea,
    this.internalArea,
    this.compound,
    this.developer,
  });

  final int id;
  final String title;
  final String description;
  final String address;
  final double price;
  final double pricePerM2;
  final String offerType;
  final double area;
  final double? landArea;
  final double? internalArea;
  final int rooms;
  final int bathrooms;
  final int garages;
  final String buildYear;
  final String latitude;
  final String longitude;
  final String status;
  final bool isFavourite;
  final bool isVisible;
  final String developmentStatus;
  final UnitOwnerEntity owner;
  final List<UnitMediaEntity> media;
  final UnitCityEntity city;
  final UnitTypeEntity unitType;
  final CompoundEntity? compound;
  final DeveloperEntity? developer;
  final List<UnitAmenityEntity> amenities;
  final double averageRating;
  final int reviewsCount;
  final DateTime createdAt;

  String get mainImage =>
      media.where((m) => m.type == 'image').firstOrNull?.filePath ?? '';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnitDetailsEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          description == other.description &&
          address == other.address &&
          price == other.price &&
          pricePerM2 == other.pricePerM2 &&
          offerType == other.offerType &&
          area == other.area &&
          landArea == other.landArea &&
          internalArea == other.internalArea &&
          rooms == other.rooms &&
          bathrooms == other.bathrooms &&
          garages == other.garages &&
          buildYear == other.buildYear &&
          latitude == other.latitude &&
          longitude == other.longitude &&
          status == other.status &&
          isFavourite == other.isFavourite &&
          isVisible == other.isVisible &&
          developmentStatus == other.developmentStatus &&
          owner == other.owner &&
          listEquals(media, other.media) &&
          city == other.city &&
          unitType == other.unitType &&
          compound == other.compound &&
          developer == other.developer &&
          listEquals(amenities, other.amenities) &&
          averageRating == other.averageRating &&
          reviewsCount == other.reviewsCount &&
          createdAt == other.createdAt;

  @override
  int get hashCode => Object.hashAll([
        id,
        title,
        description,
        address,
        price,
        pricePerM2,
        offerType,
        area,
        landArea,
        internalArea,
        rooms,
        bathrooms,
        garages,
        buildYear,
        latitude,
        longitude,
        status,
        isFavourite,
        isVisible,
        developmentStatus,
      ]);

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

class UnitOwnerEntity {
  const UnitOwnerEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.avatar,
    required this.status,
    required this.role,
    this.city,
  });

  final int id;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String avatar;
  final UnitCityEntity? city;
  final String status;
  final String role;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnitOwnerEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          email == other.email &&
          phone == other.phone &&
          address == other.address &&
          avatar == other.avatar &&
          city == other.city &&
          status == other.status &&
          role == other.role;

  @override
  int get hashCode => Object.hash(
        id,
        name,
        email,
        phone,
        address,
        avatar,
        city,
        status,
        role,
      );
}

class UnitMediaEntity {
  const UnitMediaEntity({
    required this.id,
    required this.filePath,
    required this.hlsPath,
    required this.processingStatus,
    required this.type,
  });

  final int id;
  final String filePath;
  final String hlsPath;
  final String processingStatus;
  final String type;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnitMediaEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          filePath == other.filePath &&
          hlsPath == other.hlsPath &&
          processingStatus == other.processingStatus &&
          type == other.type;

  @override
  int get hashCode => Object.hash(
        id,
        filePath,
        hlsPath,
        processingStatus,
        type,
      );
}

class UnitCityEntity {
  const UnitCityEntity({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnitCityEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => Object.hash(id, name);
}

class UnitTypeEntity {
  const UnitTypeEntity({
    required this.id,
    required this.name,
    required this.icon,
  });

  final int id;
  final String name;
  final String icon;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnitTypeEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          icon == other.icon;

  @override
  int get hashCode => Object.hash(id, name, icon);
}

class UnitAmenityEntity {
  const UnitAmenityEntity({
    required this.id,
    required this.name,
    required this.icon,
  });

  final int id;
  final String name;
  final String icon;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnitAmenityEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          icon == other.icon;

  @override
  int get hashCode => Object.hash(id, name, icon);
}
