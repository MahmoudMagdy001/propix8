import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/compounds/data/models/compound_model.dart';

part 'compound_response_model.freezed.dart';
part 'compound_response_model.g.dart';

@freezed
abstract class CompoundResponseModel with _$CompoundResponseModel {
  const factory CompoundResponseModel({
    @Default(false) bool status,
    @Default('') String message,
    @Default([]) List<CompoundModel> data,
  }) = _CompoundResponseModel;

  factory CompoundResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CompoundResponseModelFromJson(json);
}
