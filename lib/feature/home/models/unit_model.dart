import 'package:equatable/equatable.dart';

class UnitModel extends Equatable {
  const UnitModel({
    required this.id,
    required this.title,
    required this.price,
    this.description,
    this.address,
    this.imageUrl,
    this.bedrooms,
    this.bathrooms,
    this.area,
    this.isFavorite,
    this.offerType,
  });

  factory UnitModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const UnitModel(id: -1, title: 'Unknown', price: 0);
    }
    double parseDouble(value) {
      if (value == null) return 0.0;
      if (value is num) return value.toDouble();
      if (value is String) return double.tryParse(value) ?? 0.0;
      return 0.0;
    }

    return UnitModel(
      id: json['id'] as int,
      title: json['title'] as String? ?? json['name'] as String? ?? 'No Title',
      description: json['description'] as String?,
      price: parseDouble(json['price']),
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
      area: parseDouble(json['area']),
      isFavorite: json['is_favourite'] as bool?,
      offerType: json['offer_type'] as String?,
    );
  }
  final int id;
  final String title;
  final String? description;
  final double price;
  final String? address;
  final String? imageUrl;
  final int? bedrooms;
  final int? bathrooms;
  final double? area;
  final bool? isFavorite;
  final String? offerType;

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'price': price,
    'address': address,
    'image_url': imageUrl,
    'bedrooms': bedrooms,
    'bathrooms': bathrooms,
    'area': area,
    'is_favourite': isFavorite,
    'offer_type': offerType,
  };

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    price,
    address,
    imageUrl,
    bedrooms,
    bathrooms,
    area,
    isFavorite,
    offerType,
  ];

  static List<UnitModel> get dummyUnits => List.generate(
    5,
    (index) => UnitModel(
      id: index,
      title: 'Property Title $index',
      price: 1500000.0,
      address: 'Cairo, Egypt',
      bedrooms: 3,
      bathrooms: 2,
      area: 120.0,
      imageUrl: '',
    ),
  );
}
