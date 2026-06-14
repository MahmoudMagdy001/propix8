import 'package:equatable/equatable.dart';

class PaginationModel extends Equatable {
  const PaginationModel({
    required this.currentPage,
    required this.perPage,
    required this.total,
    required this.lastPage,
  });

  factory PaginationModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return PaginationModel.empty();
    return PaginationModel(
      currentPage: (json['current_page'] as int?) ?? 1,
      perPage: (json['per_page'] as int?) ?? 10,
      total: (json['total'] as int?) ?? 0,
      lastPage: (json['last_page'] as int?) ?? 1,
    );
  }

  factory PaginationModel.empty() =>
      const PaginationModel(currentPage: 1, perPage: 10, total: 0, lastPage: 1);

  final int currentPage;
  final int perPage;
  final int total;
  final int lastPage;

  bool get hasMorePages => currentPage < lastPage;

  @override
  List<Object?> get props => [currentPage, perPage, total, lastPage];
}

class PaginatedResponse<T> {
  const PaginatedResponse({required this.data, required this.pagination});

  final List<T> data;
  final PaginationModel pagination;
}
