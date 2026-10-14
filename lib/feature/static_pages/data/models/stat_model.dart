import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/static_pages/domain/entities/stat_entity.dart';

part 'stat_model.freezed.dart';
part 'stat_model.g.dart';

@freezed
abstract class StatModel with _$StatModel {
  const StatModel._();

  const factory StatModel({
    @Default('') String label,
    @Default('') String value,
    @Default('') String icon,
  }) = _StatModel;

  factory StatModel.fromJson(Map<String, dynamic> json) =>
      _$StatModelFromJson(json);

  StatEntity toDomain() => StatEntity(label: label, value: value, icon: icon);
}
