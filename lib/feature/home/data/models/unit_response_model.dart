import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/feature/home/data/models/unit_model.dart';

part 'unit_response_model.freezed.dart';

@Freezed(toJson: false, fromJson: false)
abstract class UnitResponseModel with _$UnitResponseModel {
  const UnitResponseModel._();

  const factory UnitResponseModel({
    @Default([]) List<UnitModel> units,
    PaginationModel? pagination,
  }) = _UnitResponseModel;

  factory UnitResponseModel.fromJson(Map<String, dynamic> json) =>
      UnitResponseModel(
        units:
            (json['data'] as List?)
                ?.map((e) => UnitModel.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
        pagination: json['pagination'] != null
            ? PaginationModel.fromJson(
                json['pagination'] as Map<String, dynamic>,
              )
            : null,
      );
}
