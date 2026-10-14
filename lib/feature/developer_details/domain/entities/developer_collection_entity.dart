import 'package:flutter/foundation.dart';
import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/feature/home/domain/entities/unit_entity.dart';

class DeveloperCollectionEntity {
  const DeveloperCollectionEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.logo,
    required this.email,
    required this.phone,
    required this.address,
    required this.units,
    this.pagination,
  });

  final int id;
  final String name;
  final String description;
  final String logo;
  final String email;
  final String phone;
  final String address;
  final List<UnitEntity> units;
  final PaginationModel? pagination;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeveloperCollectionEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          description == other.description &&
          logo == other.logo &&
          email == other.email &&
          phone == other.phone &&
          address == other.address &&
          listEquals(units, other.units) &&
          pagination == other.pagination;

  @override
  int get hashCode => Object.hash(
        id,
        name,
        description,
        logo,
        email,
        phone,
        address,
        units,
        pagination,
      );

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
