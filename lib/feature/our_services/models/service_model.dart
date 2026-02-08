import 'package:equatable/equatable.dart';

class ServiceModel extends Equatable {
  const ServiceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
    id: json['id'] as int,
    name: json['name'] as String,
    description: json['description'] as String,
    icon: (json['icon'] as String?) ?? '',
  );
  final int id;
  final String name;
  final String description;
  final String icon;

  @override
  List<Object?> get props => [id, name, description, icon];
}
