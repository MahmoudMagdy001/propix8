import '../models/banner_model.dart';
import '../models/category_model.dart';
import '../models/unit_model.dart';
import '../models/unit_response.dart';
import '../services/unit_service.dart';

abstract class UnitRepository {
  Future<UnitResponse> getNearbyUnits({int page = 1});
  Future<List<UnitModel>> getLatestUnits();
  Future<UnitResponse> getAllUnits({
    int page = 1,
    int? unitTypeId,
    String? offerType,
    String? developmentStatus,
    String? searchQuery,
    double? minPrice,
    double? maxPrice,
    int? rooms,
    int? bathrooms,
    double? minArea,
    double? maxArea,
    int? cityId,
  });
  Future<List<CategoryModel>> getCategories();
  Future<List<BannerModel>> getBanners();
  Future<bool> toggleFavorite(int unitId);
}

class UnitRepositoryImpl implements UnitRepository {
  UnitRepositoryImpl(this._unitService);
  final UnitService _unitService;

  @override
  Future<UnitResponse> getNearbyUnits({int page = 1}) async {
    try {
      return await _unitService.getNearbyUnits(page: page);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<UnitModel>> getLatestUnits() async {
    try {
      return await _unitService.getLatestUnits();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UnitResponse> getAllUnits({
    int page = 1,
    int? unitTypeId,
    String? offerType,
    String? developmentStatus,
    String? searchQuery,
    double? minPrice,
    double? maxPrice,
    int? rooms,
    int? bathrooms,
    double? minArea,
    double? maxArea,
    int? cityId,
  }) async {
    try {
      return await _unitService.getAllUnits(
        page: page,
        unitTypeId: unitTypeId,
        offerType: offerType,
        developmentStatus: developmentStatus,
        searchQuery: searchQuery,
        minPrice: minPrice,
        maxPrice: maxPrice,
        rooms: rooms,
        bathrooms: bathrooms,
        minArea: minArea,
        maxArea: maxArea,
        cityId: cityId,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      return await _unitService.getCategories();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<BannerModel>> getBanners() async {
    try {
      return await _unitService.getBanners();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> toggleFavorite(int unitId) async {
    try {
      return await _unitService.toggleFavorite(unitId);
    } catch (e) {
      rethrow;
    }
  }
}
