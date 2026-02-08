import 'package:equatable/equatable.dart';

class City extends Equatable {
  const City({required this.id, required this.name});

  factory City.fromJson(Map<String, dynamic> json) =>
      City(id: json['id'] as int, name: json['name'] as String);
  final int id;
  final String name;

  Map<String, dynamic> toJson() => {'id': id, 'name': name};

  @override
  List<Object?> get props => [id, name];
}
