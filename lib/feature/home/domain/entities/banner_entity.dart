class BannerEntity {
  const BannerEntity({
    required this.id,
    required this.image,
    required this.url,
    required this.sortOrder,
  });

  final int id;
  final String image;
  final String url;
  final int sortOrder;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BannerEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          image == other.image &&
          url == other.url &&
          sortOrder == other.sortOrder;

  @override
  int get hashCode => Object.hash(id, image, url, sortOrder);
}
