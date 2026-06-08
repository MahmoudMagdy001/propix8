import 'package:equatable/equatable.dart';

import 'package:propix8/core/models/pagination_model.dart';

class BookingUserModel extends Equatable {
  const BookingUserModel({
    required this.id,
    required this.name,
    required this.email,
  });

  factory BookingUserModel.fromJson(Map<String, dynamic> json) =>
      BookingUserModel(
        id: json['id'] as int? ?? 0,
        name: json['name'] as String? ?? '',
        email: json['email'] as String? ?? '',
      );

  final int id;
  final String name;
  final String email;

  @override
  List<Object?> get props => [id, name, email];
}

class BookingCityModel extends Equatable {
  const BookingCityModel({required this.id, required this.name});

  factory BookingCityModel.fromJson(Map<String, dynamic> json) =>
      BookingCityModel(
        id: json['id'] as int,
        name: json['name'] as String? ?? '',
      );

  final int id;
  final String name;

  @override
  List<Object?> get props => [id, name];
}

class BookingCompoundModel extends Equatable {
  const BookingCompoundModel({required this.id, required this.name});

  factory BookingCompoundModel.fromJson(Map<String, dynamic> json) =>
      BookingCompoundModel(
        id: json['id'] as int,
        name: json['name'] as String? ?? '',
      );

  final int id;
  final String name;

  @override
  List<Object?> get props => [id, name];
}

class BookingDeveloperModel extends Equatable {
  const BookingDeveloperModel({required this.id, required this.name});

  factory BookingDeveloperModel.fromJson(Map<String, dynamic> json) =>
      BookingDeveloperModel(
        id: json['id'] as int,
        name: json['name'] as String? ?? '',
      );

  final int id;
  final String name;

  @override
  List<Object?> get props => [id, name];
}

class BookingUnitTypeModel extends Equatable {
  const BookingUnitTypeModel({required this.id, required this.name, this.icon});

  factory BookingUnitTypeModel.fromJson(Map<String, dynamic> json) =>
      BookingUnitTypeModel(
        id: json['id'] as int,
        name: json['name'] as String? ?? '',
        icon: json['icon'] as String?,
      );

  final int id;
  final String name;
  final String? icon;

  @override
  List<Object?> get props => [id, name, icon];
}

class BookingUnitModel extends Equatable {
  const BookingUnitModel({
    required this.id,
    required this.title,
    required this.isVisible,
    required this.isFavourite,
    required this.address,
    required this.price,
    required this.offerType,
    required this.area,
    required this.rooms,
    required this.bathrooms,
    required this.city,
    required this.compound,
    required this.developer,
    required this.unitType,
    required this.mainImage,
    required this.averageRating,
    required this.reviewsCount,
    required this.createdAt,
  });

  factory BookingUnitModel.fromJson(Map<String, dynamic> json) {
    double parseDouble(value) {
      if (value == null) return 0.0;
      if (value is num) return value.toDouble();
      if (value is String) return double.tryParse(value) ?? 0.0;
      return 0.0;
    }

    return BookingUnitModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      isVisible: json['is_visible'] as bool? ?? false,
      isFavourite: json['is_favourite'] as bool? ?? false,
      address: json['address'] as String? ?? '',
      price: parseDouble(json['price']),
      offerType: json['offer_type'] as String? ?? '',
      area: parseDouble(json['area']),
      rooms: json['rooms'] as int? ?? 0,
      bathrooms: json['bathrooms'] as int? ?? 0,
      city: json['city'] != null
          ? BookingCityModel.fromJson(json['city'] as Map<String, dynamic>)
          : const BookingCityModel(id: 0, name: ''),
      compound: json['compound'] != null
          ? BookingCompoundModel.fromJson(
              json['compound'] as Map<String, dynamic>,
            )
          : null,
      developer: json['developer'] != null
          ? BookingDeveloperModel.fromJson(
              json['developer'] as Map<String, dynamic>,
            )
          : null,
      unitType: json['unit_type'] != null
          ? BookingUnitTypeModel.fromJson(
              json['unit_type'] as Map<String, dynamic>,
            )
          : const BookingUnitTypeModel(id: 0, name: ''),
      mainImage: json['main_image'] as String? ?? '',
      averageRating: json['average_rating'] as int? ?? 0,
      reviewsCount: json['reviews_count'] as int? ?? 0,
      createdAt:
          DateTime.tryParse(json['created_at'] as String? ?? '') ??
          DateTime.now(),
    );
  }

  final int id;
  final String title;
  final bool isVisible;
  final bool isFavourite;
  final String address;
  final double price;
  final String offerType;
  final double area;
  final int rooms;
  final int bathrooms;
  final BookingCityModel city;
  final BookingCompoundModel? compound;
  final BookingDeveloperModel? developer;
  final BookingUnitTypeModel unitType;
  final String mainImage;
  final int averageRating;
  final int reviewsCount;
  final DateTime createdAt;

  @override
  List<Object?> get props => [
    id,
    title,
    isVisible,
    isFavourite,
    address,
    price,
    offerType,
    area,
    rooms,
    bathrooms,
    city,
    compound,
    developer,
    unitType,
    mainImage,
    averageRating,
    reviewsCount,
    createdAt,
  ];
}

class BookingModel extends Equatable {
  const BookingModel({
    required this.id,
    required this.userId,
    required this.user,
    required this.unit,
    required this.name,
    required this.email,
    required this.phone,
    required this.date,
    required this.time,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.notes,
    this.userMessage,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
    id: json['id'] as int? ?? 0,
    userId: json['user_id'] as int? ?? 0,
    user: BookingUserModel.fromJson(
      json['user'] as Map<String, dynamic>? ?? {},
    ),
    unit: BookingUnitModel.fromJson(
      json['unit'] as Map<String, dynamic>? ?? {},
    ),
    name: json['name'] as String? ?? '',
    email: json['email'] as String? ?? '',
    phone: json['phone'] as String? ?? '',
    date: json['date'] as String? ?? '',
    time: json['time'] as String? ?? '',
    status: json['status'] as String? ?? '',
    notes: json['notes'] as String?,
    userMessage: json['user_message'] as String?,
    createdAt: json['created_at'] as String? ?? '',
    updatedAt: json['updated_at'] as String? ?? '',
  );

  final int id;
  final int userId;
  final BookingUserModel user;
  final BookingUnitModel unit;
  final String name;
  final String email;
  final String phone;
  final String date;
  final String time;
  final String status;
  final String? notes;
  final String? userMessage;
  final String createdAt;
  final String updatedAt;

  BookingModel copyWith({
    int? id,
    int? userId,
    BookingUserModel? user,
    BookingUnitModel? unit,
    String? name,
    String? email,
    String? phone,
    String? date,
    String? time,
    String? status,
    String? notes,
    String? userMessage,
    String? createdAt,
    String? updatedAt,
  }) => BookingModel(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    user: user ?? this.user,
    unit: unit ?? this.unit,
    name: name ?? this.name,
    email: email ?? this.email,
    phone: phone ?? this.phone,
    date: date ?? this.date,
    time: time ?? this.time,
    status: status ?? this.status,
    notes: notes ?? this.notes,
    userMessage: userMessage ?? this.userMessage,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );

  @override
  List<Object?> get props => [
    id,
    userId,
    user,
    unit,
    name,
    email,
    phone,
    date,
    time,
    status,
    notes,
    userMessage,
    createdAt,
    updatedAt,
  ];
}

class BookingResponse extends Equatable {
  const BookingResponse({
    required this.status,
    required this.message,
    required this.data,
    this.pagination,
  });

  factory BookingResponse.fromJson(Map<String, dynamic> json) =>
      BookingResponse(
        status: json['status'] as bool? ?? false,
        message: json['message'] as String? ?? '',
        data:
            (json['data'] as List?)
                ?.map((e) => BookingModel.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
        pagination: json['pagination'] != null
            ? PaginationModel.fromJson(
                json['pagination'] as Map<String, dynamic>,
              )
            : null,
      );

  final bool status;
  final String message;
  final List<BookingModel> data;
  final PaginationModel? pagination;

  @override
  List<Object?> get props => [status, message, data, pagination];
}
