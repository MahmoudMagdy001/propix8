class UnitEntity {
  const UnitEntity({
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

  final int id;
  final String title;
  final double price;
  final String? description;
  final String? address;
  final String? imageUrl;
  final int? bedrooms;
  final int? bathrooms;
  final double? area;
  final bool? isFavorite;
  final String? offerType;

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
      UnitEntity(
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnitEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          price == other.price &&
          description == other.description &&
          address == other.address &&
          imageUrl == other.imageUrl &&
          bedrooms == other.bedrooms &&
          bathrooms == other.bathrooms &&
          area == other.area &&
          isFavorite == other.isFavorite &&
          offerType == other.offerType;

  @override
  int get hashCode => Object.hash(
    id,
    title,
    price,
    description,
    address,
    imageUrl,
    bedrooms,
    bathrooms,
    area,
    isFavorite,
    offerType,
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
