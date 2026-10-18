import 'package:freezed_annotation/freezed_annotation.dart';

part 'unit_entity.freezed.dart';

@freezed
abstract class UnitEntity with _$UnitEntity {
  const UnitEntity._();

  const factory UnitEntity({
    required int id,
    required String title,
    required double price,
    String? description,
    String? address,
    String? imageUrl,
    int? bedrooms,
    int? bathrooms,
    double? area,
    bool? isFavorite,
    String? offerType,
  }) = _UnitEntity;

  UnitEntity copyWithUnit({
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
      copyWith(
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

  static List<UnitEntity> get dummyUnits => List.generate(
    5,
    (index) => const UnitEntity(
      id: 0,
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
