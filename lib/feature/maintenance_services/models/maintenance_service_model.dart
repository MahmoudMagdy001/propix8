import 'package:equatable/equatable.dart';

class MaintenanceServicesResponse extends Equatable {
  const MaintenanceServicesResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory MaintenanceServicesResponse.fromJson(Map<String, dynamic> json) =>
      MaintenanceServicesResponse(
        status: json['status'] ?? false,
        message: json['message'] ?? '',
        data: MaintenanceData.fromJson(json['data'] ?? {}),
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
        home: (json['home'] as List? ?? [])
            .map((e) => MaintenanceServiceModel.fromJson(e))
            .toList(),
        technical: (json['technical'] as List? ?? [])
            .map((e) => MaintenanceServiceModel.fromJson(e))
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
        id: json['id'] ?? 0,
        title: json['title'] ?? '',
        category: json['category'] ?? '',
        image: json['image'] ?? '',
        createdAt: json['created_at'] ?? '',
      );
  final int id;
  final String title;
  final String category;
  final String image;
  final String createdAt;

  @override
  List<Object?> get props => [id, title, category, image, createdAt];
}
