import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_entity.freezed.dart';

@freezed
abstract class BannerEntity with _$BannerEntity {
  const factory BannerEntity({
    required int id,
    required String image,
    required String url,
    required int sortOrder,
  }) = _BannerEntity;
}
