import 'package:equatable/equatable.dart';

class UnitDetailsModel extends Equatable {
  const UnitDetailsModel({
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

  factory UnitDetailsModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return UnitDetailsModel.dummy;
    double parseDouble(dynamic value) {
      if (value == null) return 0.0;
      if (value is num) return value.toDouble();
      if (value is String) return double.tryParse(value) ?? 0.0;
      return 0.0;
    }

    return UnitDetailsModel(
      id: (json['id'] as int?) ?? 0,
      title: (json['title'] as String?) ?? '',
      description: (json['description'] as String?) ?? '',
      address: (json['address'] as String?) ?? '',
      price: parseDouble(json['price']),
      pricePerM2: parseDouble(json['price_per_m2']),
      offerType: (json['offer_type'] as String?) ?? '',
      area: parseDouble(json['area']),
      landArea: parseDouble(json['land_area']),
      internalArea: parseDouble(json['internal_area']),
      rooms: (json['rooms'] as int?) ?? 0,
      bathrooms: (json['bathrooms'] as int?) ?? 0,
      garages: (json['garages'] as int?) ?? 0,
      buildYear: (json['build_year'] as String?) ?? '',
      latitude: (json['latitude'] as String?) ?? '',
      longitude: (json['longitude'] as String?) ?? '',
      status: (json['status'] as String?) ?? '',
      isFavourite: (json['is_favourite'] as bool?) ?? false,
      isVisible: (json['is_visible'] as bool?) ?? true,
      developmentStatus: (json['development_status'] as String?) ?? '',
      owner: OwnerModel.fromJson(json['owner'] as Map<String, dynamic>?),
      media:
          (json['media'] as List?)
              ?.map((m) => MediaModel.fromJson(m as Map<String, dynamic>?))
              .toList() ??
          [],
      city: CityModel.fromJson(json['city'] as Map<String, dynamic>?),
      unitType: UnitTypeModel.fromJson(json['unit_type'] as Map<String, dynamic>?),
      compound: json['compound'] != null
          ? CompoundModel.fromJson(json['compound'] as Map<String, dynamic>?)
          : null,
      developer: json['developer'] != null
          ? DeveloperModel.fromJson(json['developer'] as Map<String, dynamic>?)
          : null,
      amenities:
          (json['amenities'] as List?)
              ?.map((a) => AmenityModel.fromJson(a as Map<String, dynamic>?))
              .toList() ??
          [],
      averageRating: parseDouble(json['average_rating']),
      reviewsCount: (json['reviews_count'] as int?) ?? 0,
      createdAt: DateTime.tryParse((json['created_at'] as String?) ?? '') ?? DateTime.now(),
    );
  }
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
  final OwnerModel owner;
  final List<MediaModel> media;
  final CityModel city;
  final UnitTypeModel unitType;
  final CompoundModel? compound;
  final DeveloperModel? developer;
  final List<AmenityModel> amenities;
  final double averageRating;
  final int reviewsCount;
  final DateTime createdAt;

  @override
  List<Object?> get props => [
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
    owner,
    media,
    city,
    unitType,
    compound,
    developer,
    amenities,
    averageRating,
    reviewsCount,
    createdAt,
  ];

  static UnitDetailsModel get dummy => UnitDetailsModel(
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
    owner: const OwnerModel(
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
      MediaModel(
        id: 1,
        filePath: '',
        hlsPath: '',
        processingStatus: 'completed',
        type: 'image',
      ),
      MediaModel(
        id: 2,
        filePath: '',
        hlsPath: '',
        processingStatus: 'completed',
        type: 'floorplan',
      ),
      MediaModel(
        id: 3,
        filePath: '',
        hlsPath: '',
        processingStatus: 'completed',
        type: 'video',
      ),
    ],
    city: const CityModel(id: 1, name: 'Cairo'),
    unitType: const UnitTypeModel(id: 1, name: 'Apartment', icon: ''),
    compound: const CompoundModel(
      id: 1,
      name: 'Compound Name',
      description: 'Compound Description',
    ),
    developer: const DeveloperModel(
      id: 1,
      name: 'Developer Name',
      logo: '',
      email: '',
      phone: '',
      address: '',
    ),
    amenities: const [
      AmenityModel(id: 1, name: 'Swimming Pool', icon: ''),
      AmenityModel(id: 2, name: 'Gym', icon: ''),
    ],
    averageRating: 4.0,
    reviewsCount: 10,
    createdAt: DateTime.now(),
  );
}

class OwnerModel extends Equatable {
  const OwnerModel({
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

  factory OwnerModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const OwnerModel(
        id: -1,
        name: 'Unknown',
        email: '',
        phone: '',
        address: '',
        avatar: '',
        status: '',
        role: '',
      );
    }
    return OwnerModel(
      id: (json['id'] as int?) ?? 0,
      name: (json['name'] as String?) ?? '',
      email: (json['email'] as String?) ?? '',
      phone: (json['phone'] as String?) ?? '',
      address: (json['address'] as String?) ?? '',
      avatar: (json['avatar'] as String?) ?? '',
      city: json['city'] != null ? CityModel.fromJson(json['city'] as Map<String, dynamic>?) : null,
      status: (json['status'] as String?) ?? '',
      role: (json['role'] as String?) ?? '',
    );
  }
  final int id;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String avatar;
  final CityModel? city;
  final String status;
  final String role;

  @override
  List<Object?> get props => [
    id,
    name,
    email,
    phone,
    address,
    avatar,
    city,
    status,
    role,
  ];
}

class MediaModel extends Equatable {
  const MediaModel({
    required this.id,
    required this.filePath,
    required this.hlsPath,
    required this.processingStatus,
    required this.type,
  });

  factory MediaModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const MediaModel(
        id: -1,
        filePath: '',
        hlsPath: '',
        processingStatus: '',
        type: '',
      );
    }
    return MediaModel(
      id: (json['id'] as int?) ?? -1,
      filePath: (json['file_path'] as String?) ?? '',
      hlsPath: (json['hls_path'] as String?) ?? '',
      processingStatus: (json['processing_status'] as String?) ?? '',
      type: (json['type'] as String?) ?? '',
    );
  }
  final int id;
  final String filePath;
  final String hlsPath;
  final String processingStatus;
  final String type;

  @override
  List<Object?> get props => [id, filePath, hlsPath, processingStatus, type];
}

class CityModel extends Equatable {
  const CityModel({required this.id, required this.name});

  factory CityModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const CityModel(id: -1, name: 'Unknown');
    }
    return CityModel(
      id: (json['id'] as int?) ?? -1,
      name: (json['name'] as String?) ?? 'Unknown',
    );
  }
  final int id;
  final String name;

  @override
  List<Object?> get props => [id, name];
}

class UnitTypeModel extends Equatable {
  const UnitTypeModel({
    required this.id,
    required this.name,
    required this.icon,
  });

  factory UnitTypeModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const UnitTypeModel(id: -1, name: 'Unknown', icon: '');
    }
    return UnitTypeModel(
      id: (json['id'] as int?) ?? -1,
      name: (json['name'] as String?) ?? 'Unknown',
      icon: (json['icon'] as String?) ?? '',
    );
  }
  final int id;
  final String name;
  final String icon;

  @override
  List<Object?> get props => [id, name, icon];
}

class CompoundModel extends Equatable {
  const CompoundModel({
    required this.id,
    required this.name,
    required this.description,
  });

  factory CompoundModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const CompoundModel(id: -1, name: '', description: '');
    }
    return CompoundModel(
      id: (json['id'] as int?) ?? -1,
      name: (json['name'] as String?) ?? '',
      description: (json['description'] as String?) ?? '',
    );
  }
  final int id;
  final String name;
  final String description;

  @override
  List<Object?> get props => [id, name, description];
}

class DeveloperModel extends Equatable {
  const DeveloperModel({
    required this.id,
    required this.name,
    required this.logo,
    required this.email,
    required this.phone,
    required this.address,
  });

  factory DeveloperModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const DeveloperModel(
        id: -1,
        name: '',
        logo: '',
        email: '',
        phone: '',
        address: '',
      );
    }
    return DeveloperModel(
      id: (json['id'] as int?) ?? -1,
      name: (json['name'] as String?) ?? '',
      logo: (json['logo'] as String?) ?? '',
      email: (json['email'] as String?) ?? '',
      phone: (json['phone'] as String?) ?? '',
      address: (json['address'] as String?) ?? '',
    );
  }
  final int id;
  final String name;
  final String logo;
  final String email;
  final String phone;
  final String address;

  @override
  List<Object?> get props => [id, name, logo, email, phone, address];
}

class AmenityModel extends Equatable {
  const AmenityModel({
    required this.id,
    required this.name,
    required this.icon,
  });

  factory AmenityModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const AmenityModel(id: -1, name: '', icon: '');
    }
    return AmenityModel(
      id: (json['id'] as int?) ?? -1,
      name: (json['name'] as String?) ?? '',
      icon: (json['icon'] as String?) ?? '',
    );
  }
  final int id;
  final String name;
  final String icon;

  @override
  List<Object?> get props => [id, name, icon];
}
