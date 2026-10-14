import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/home/domain/entities/banner_entity.dart';

part 'banner_model.freezed.dart';
part 'banner_model.g.dart';

@freezed
abstract class BannerModel with _$BannerModel {
  const BannerModel._();

  const factory BannerModel({
    @Default(0) int id,
    @Default('') String image,
    @Default('') String url,
    @JsonKey(name: 'sort_order') @Default(0) int sortOrder,
  }) = _BannerModel;

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);

  factory BannerModel.fromDomain(BannerEntity entity) => BannerModel(
    id: entity.id,
    image: entity.image,
    url: entity.url,
    sortOrder: entity.sortOrder,
  );

  BannerEntity toDomain() => BannerEntity(
    id: id,
    image: image,
    url: url,
    sortOrder: sortOrder,
  );
}
