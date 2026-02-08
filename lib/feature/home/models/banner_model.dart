import 'package:equatable/equatable.dart';

class BannerModel extends Equatable {
  const BannerModel({
    required this.id,
    required this.image,
    required this.url,
    required this.sortOrder,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    id: json['id'] as int,
    image: json['image'] as String? ?? '',
    url: json['url'] as String? ?? '',
    sortOrder: json['sort_order'] as int? ?? 0,
  );

  final int id;
  final String image;
  final String url;
  final int sortOrder;

  @override
  List<Object?> get props => [id, image, url, sortOrder];

  static List<BannerModel> get dummyBanners => List.generate(
    3,
    (index) => BannerModel(id: index, image: '', url: '', sortOrder: index),
  );
}
