import 'package:freezed_annotation/freezed_annotation.dart';

part 'stat_entity.freezed.dart';

@freezed
abstract class StatEntity with _$StatEntity {
  const factory StatEntity({
    required String label,
    required String value,
    required String icon,
  }) = _StatEntity;
}
