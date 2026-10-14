import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/feature/developer_details/domain/entities/developer_collection_entity.dart';
import 'package:propix8/feature/home/data/models/unit_model.dart';

part 'developer_collection_model.freezed.dart';

@Freezed(toJson: false, fromJson: false)
abstract class DeveloperCollectionModel with _$DeveloperCollectionModel
    implements DeveloperCollectionEntity {
  const factory DeveloperCollectionModel({
    required int id,
    required String name,
    required String description,
    required String logo,
    required String email,
    required String phone,
    required String address,
    required List<UnitModel> units,
    PaginationModel? pagination,
  }) = _DeveloperCollectionModel;

  factory DeveloperCollectionModel.fromJson(
    Map<String, dynamic> json, {
    PaginationModel? pagination,
  }) =>
      DeveloperCollectionModel(
        id: json['id'] as int? ?? 0,
        name: json['name'] as String? ?? '',
        description: json['description'] as String? ?? '',
        logo: json['logo'] as String? ?? '',
        email: json['email'] as String? ?? '',
        phone: json['phone'] as String? ?? '',
        address: json['address'] as String? ?? '',
        units: (json['units'] as List?)
                ?.map((e) => UnitModel.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const [],
        pagination: pagination,
      );

  static DeveloperCollectionModel dummy() => DeveloperCollectionModel(
        id: 0,
        name: 'Developer Name',
        description: 'This is a dummy description for skeleton loading.',
        logo: '',
        email: 'developer@example.com',
        phone: '0123456789',
        address: 'Cairo, Egypt',
        units: UnitModel.dummyUnits,
      );
}
