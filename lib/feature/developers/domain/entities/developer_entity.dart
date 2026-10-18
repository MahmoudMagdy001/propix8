import 'package:freezed_annotation/freezed_annotation.dart';

part 'developer_entity.freezed.dart';

@freezed
abstract class DeveloperEntity with _$DeveloperEntity {
  const factory DeveloperEntity({
    required int id,
    required String name,
    required String logo,
    String? email,
    String? phone,
    String? address,
  }) = _DeveloperEntity;
}
