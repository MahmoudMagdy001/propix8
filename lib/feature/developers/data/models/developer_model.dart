import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/developers/domain/entities/developer_entity.dart';

part 'developer_model.freezed.dart';
part 'developer_model.g.dart';

@freezed
abstract class DeveloperModel with _$DeveloperModel {
  const DeveloperModel._();

  const factory DeveloperModel({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String logo,
    String? email,
    String? phone,
    String? address,
  }) = _DeveloperModel;

  factory DeveloperModel.fromJson(Map<String, dynamic> json) =>
      _$DeveloperModelFromJson(json);

  factory DeveloperModel.fromDomain(DeveloperEntity entity) => DeveloperModel(
    id: entity.id,
    name: entity.name,
    logo: entity.logo,
    email: entity.email,
    phone: entity.phone,
    address: entity.address,
  );

  DeveloperEntity toDomain() => DeveloperEntity(
    id: id,
    name: name,
    logo: logo,
    email: email,
    phone: phone,
    address: address,
  );
}
