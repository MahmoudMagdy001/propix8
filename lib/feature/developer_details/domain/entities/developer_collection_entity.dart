import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';

part 'developer_collection_entity.freezed.dart';

@freezed
abstract class DeveloperCollectionEntity with _$DeveloperCollectionEntity {
  const DeveloperCollectionEntity._();

  const factory DeveloperCollectionEntity({
    required int id,
    required String name,
    required String description,
    required String logo,
    required String email,
    required String phone,
    required String address,
    required List<UnitEntity> units,
    PaginationModel? pagination,
  }) = _DeveloperCollectionEntity;

  static DeveloperCollectionEntity dummy() => DeveloperCollectionEntity(
        id: 0,
        name: 'Developer Name',
        description: 'This is a dummy description for skeleton loading.',
        logo: '',
        email: 'developer@example.com',
        phone: '0123456789',
        address: 'Cairo, Egypt',
        units: UnitEntity.dummyUnits,
      );
}
