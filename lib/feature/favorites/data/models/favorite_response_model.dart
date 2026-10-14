import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/feature/favorites/data/models/favorite_unit_model.dart';
import 'package:propix8/feature/favorites/domain/entities/favorite_response_entity.dart';

part 'favorite_response_model.freezed.dart';

@Freezed(toJson: false, fromJson: false)
abstract class FavoriteResponseModel with _$FavoriteResponseModel implements FavoriteResponseEntity {
  const factory FavoriteResponseModel({
    @Default(false) bool status,
    @Default('') String message,
    @Default([]) List<FavoriteUnitModel> data,
    PaginationModel? pagination,
  }) = _FavoriteResponseModel;

  factory FavoriteResponseModel.fromJson(Map<String, dynamic> json) =>
      FavoriteResponseModel(
        status: json['status'] as bool? ?? false,
        message: json['message'] as String? ?? '',
        data:
            (json['data'] as List?)
                ?.map(
                  (e) => FavoriteUnitModel.fromJson(e as Map<String, dynamic>),
                )
                .toList() ??
            const [],
        pagination: json['pagination'] != null
            ? PaginationModel.fromJson(
                json['pagination'] as Map<String, dynamic>,
              )
            : null,
      );
}
