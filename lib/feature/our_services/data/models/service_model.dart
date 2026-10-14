import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/feature/our_services/domain/entities/service_entity.dart';

part 'service_model.freezed.dart';
part 'service_model.g.dart';

@freezed
abstract class ServiceModel with _$ServiceModel {
  const ServiceModel._();

  const factory ServiceModel({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String description,
    @Default('') String icon,
  }) = _ServiceModel;

  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);

  factory ServiceModel.fromDomain(ServiceEntity entity) => ServiceModel(
    id: entity.id,
    name: entity.name,
    description: entity.description,
    icon: entity.icon,
  );

  ServiceEntity toDomain() =>
      ServiceEntity(id: id, name: name, description: description, icon: icon);
}
