import 'package:equatable/equatable.dart';

class MaintenanceServicesResponse extends Equatable {
  const MaintenanceServicesResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory MaintenanceServicesResponse.fromJson(Map<String, dynamic> json) =>
      MaintenanceServicesResponse(
        status: (json['status'] as bool?) ?? false,
        message: (json['message'] as String?) ?? '',
        data: MaintenanceData.fromJson(
            (json['data'] as Map<String, dynamic>?) ?? {}),
      );
  final bool status;
  final String message;
  final MaintenanceData data;

  @override
  List<Object?> get props => [status, message, data];
}

class MaintenanceData extends Equatable {
  const MaintenanceData({required this.home, required this.technical});

  factory MaintenanceData.fromJson(Map<String, dynamic> json) =>
      MaintenanceData(
        home: ((json['home'] as List?) ?? [])
            .map((e) => MaintenanceServiceModel.fromJson(
                e as Map<String, dynamic>))
            .toList(),
        technical: ((json['technical'] as List?) ?? [])
            .map((e) => MaintenanceServiceModel.fromJson(
                e as Map<String, dynamic>))
            .toList(),
      );
  final List<MaintenanceServiceModel> home;
  final List<MaintenanceServiceModel> technical;

  @override
  List<Object?> get props => [home, technical];
}

class MaintenanceServiceModel extends Equatable {
  const MaintenanceServiceModel({
    required this.id,
    required this.title,
    required this.category,
    required this.image,
    required this.createdAt,
  });

  factory MaintenanceServiceModel.fromJson(Map<String, dynamic> json) =>
      MaintenanceServiceModel(
        id: (json['id'] as int?) ?? 0,
        title: (json['title'] as String?) ?? '',
        category: (json['category'] as String?) ?? '',
        image: (json['image'] as String?) ?? '',
        createdAt: (json['created_at'] as String?) ?? '',
      );
  final int id;
  final String title;
  final String category;
  final String image;
  final String createdAt;

  @override
  List<Object?> get props => [id, title, category, image, createdAt];
}
