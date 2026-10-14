import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/developers/data/models/developer_model.dart';

part 'developer_response_model.freezed.dart';
part 'developer_response_model.g.dart';

@freezed
abstract class DeveloperResponseModel with _$DeveloperResponseModel {
  const factory DeveloperResponseModel({
    @Default(false) bool status,
    @Default('') String message,
    @Default([]) List<DeveloperModel> data,
  }) = _DeveloperResponseModel;

  factory DeveloperResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DeveloperResponseModelFromJson(json);
}
