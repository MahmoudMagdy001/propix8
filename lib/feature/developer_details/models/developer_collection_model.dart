import 'package:equatable/equatable.dart';

import '../../../../core/models/pagination_model.dart';
import '../../home/models/unit_model.dart';

class DeveloperCollectionModel extends Equatable {
  const DeveloperCollectionModel({
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

  factory DeveloperCollectionModel.fromJson(
    Map<String, dynamic> json, {
    PaginationModel? pagination,
  }) => DeveloperCollectionModel(
    id: json['id'] as int,
    name: json['name'] as String? ?? '',
    description: json['description'] as String? ?? '',
    logo: json['logo'] as String? ?? '',
    email: json['email'] as String? ?? '',
    phone: json['phone'] as String? ?? '',
    address: json['address'] as String? ?? '',
    units:
        (json['units'] as List?)
            ?.map((e) => UnitModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    pagination: pagination,
  );
  final int id;
  final String name;
  final String description;
  final String logo;
  final String email;
  final String phone;
  final String address;
  final List<UnitModel> units;
  final PaginationModel? pagination;

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    logo,
    email,
    phone,
    address,
    units,
    pagination,
  ];

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
