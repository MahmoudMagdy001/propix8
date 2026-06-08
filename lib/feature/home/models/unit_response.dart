import 'package:equatable/equatable.dart';

import 'package:propix8/core/models/pagination_model.dart';
import 'package:propix8/feature/home/models/unit_model.dart';

class UnitResponse extends Equatable {
  const UnitResponse({required this.units, this.pagination});

  factory UnitResponse.fromJson(Map<String, dynamic> json) => UnitResponse(
    units:
        (json['data'] as List?)
            ?.map((e) => UnitModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    pagination: json['pagination'] != null
        ? PaginationModel.fromJson(json['pagination'] as Map<String, dynamic>)
        : null,
  );
  final List<UnitModel> units;
  final PaginationModel? pagination;

  @override
  List<Object?> get props => [units, pagination];
}
