import 'package:equatable/equatable.dart';

class CompoundResponse {
  CompoundResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CompoundResponse.fromJson(Map<String, dynamic> json) =>
      CompoundResponse(
        status: json['status'] ?? false,
        message: json['message'] ?? '',
        data:
            (json['data'] as List?)
                ?.map((e) => CompoundModel.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
      );
  final bool status;
  final String message;
  final List<CompoundModel> data;
}

class CompoundModel extends Equatable {
  const CompoundModel({
    required this.id,
    required this.name,
    required this.description,
  });

  factory CompoundModel.fromJson(Map<String, dynamic> json) => CompoundModel(
    id: json['id'] ?? 0,
    name: json['name'] ?? '',
    description: json['description'] ?? '',
  );
  final int id;
  final String name;
  final String description;

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
  };

  CompoundModel copyWith({int? id, String? name, String? description}) =>
      CompoundModel(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
      );

  @override
  List<Object?> get props => [id, name, description];
}
