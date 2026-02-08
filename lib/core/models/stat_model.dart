import 'package:equatable/equatable.dart';

class StatModel extends Equatable {
  const StatModel({
    required this.label,
    required this.value,
    required this.icon,
  });

  factory StatModel.fromJson(Map<String, dynamic> json) => StatModel(
    label: json['label'] as String? ?? '',
    value: json['value'] as String? ?? '',
    icon: json['icon'] as String? ?? '',
  );

  final String label;
  final String value;
  final String icon;

  @override
  List<Object?> get props => [label, value, icon];
}
