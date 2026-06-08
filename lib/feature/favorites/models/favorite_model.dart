import 'package:equatable/equatable.dart';

import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/feature/home/models/unit_model.dart';

class FavoriteUnitModel extends Equatable {
  const FavoriteUnitModel({
    required this.id,
    required this.unit,
    required this.createdAt,
  });

  factory FavoriteUnitModel.fromJson(Map<String, dynamic> json) {
    // Get the unit JSON and force is_favourite to true
    // since this unit is from favorites endpoint
    final unitJson = Map<String, dynamic>.from(
      json['unit'] as Map<String, dynamic>,
    );
    unitJson['is_favourite'] = true;

    return FavoriteUnitModel(
      id: json['id'] as int,
      unit: UnitModel.fromJson(unitJson),
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }
  final int id;
  final UnitModel unit;
  final DateTime createdAt;

  @override
  List<Object?> get props => [id, unit, createdAt];
}

class FavoriteResponse extends Equatable {
  const FavoriteResponse({
    required this.status,
    required this.message,
    required this.data,
    this.pagination,
  });

  factory FavoriteResponse.fromJson(
    Map<String, dynamic> json,
  ) => FavoriteResponse(
    status: json['status'] as bool? ?? false,
    message: json['message'] as String? ?? '',
    data:
        (json['data'] as List?)
            ?.map((e) => FavoriteUnitModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    pagination: json['pagination'] != null
        ? PaginationModel.fromJson(json['pagination'] as Map<String, dynamic>)
        : null,
  );
  final bool status;
  final String message;
  final List<FavoriteUnitModel> data;
  final PaginationModel? pagination;

  @override
  List<Object?> get props => [status, message, data, pagination];
}
