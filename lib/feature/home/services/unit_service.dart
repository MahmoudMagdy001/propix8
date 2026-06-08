import 'package:propix8/core/network/dio_client.dart';
import 'package:propix8/feature/home/models/banner_model.dart';
import 'package:propix8/feature/home/models/category_model.dart';
import 'package:propix8/feature/home/models/unit_model.dart';
import 'package:propix8/feature/home/models/unit_response.dart';

class UnitService {
  UnitService(this._dioClient);
  final DioClient _dioClient;

  Future<UnitResponse> getNearbyUnits({int page = 1}) async {
    try {
      final response = await _dioClient.get(
        'units/nearby',
        queryParameters: {'page': page},
      );
      return UnitResponse.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UnitModel>> getLatestUnits() async {
    try {
      final response = await _dioClient.get('units/latest');
      final data = (response.data as Map<String, dynamic>)['data'] as List?;
      return data
              ?.map((e) => UnitModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];
    } catch (e) {
      rethrow;
    }
  }

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
      final queryParams = <String, dynamic>{'page': page};
      if (unitTypeId != null) {
        queryParams['unit_type_id'] = unitTypeId;
      }
      if (offerType != null) {
        queryParams['offer_type'] = offerType;
      }
      if (developmentStatus != null) {
        queryParams['development_status'] = developmentStatus;
      }
      if (searchQuery != null) {
        queryParams['q'] = searchQuery;
      }
      if (minPrice != null) {
        queryParams['min_price'] = minPrice;
      }
      if (maxPrice != null) {
        queryParams['max_price'] = maxPrice;
      }
      if (rooms != null && rooms > 0) {
        queryParams['rooms'] = rooms;
      }
      if (bathrooms != null && bathrooms > 0) {
        queryParams['bathrooms'] = bathrooms;
      }
      if (minArea != null) {
        queryParams['min_area'] = minArea;
      }
      if (maxArea != null) {
        queryParams['max_area'] = maxArea;
      }
      if (cityId != null) {
        queryParams['city_id'] = cityId;
      }
      final response = await _dioClient.get(
        'units',
        queryParameters: queryParams,
      );
      return UnitResponse.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await _dioClient.get('unit-types');
      final data = (response.data as Map<String, dynamic>)['data'] as List?;
      return data
              ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];
    } catch (e) {
      rethrow;
    }
  }

  Future<List<BannerModel>> getBanners() async {
    try {
      final response = await _dioClient.get('banners');
      final data = (response.data as Map<String, dynamic>)['data'] as List?;
      return data
              ?.map((e) => BannerModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> toggleFavorite(int unitId) async {
    try {
      final response = await _dioClient.post(
        'favorites/toggle',
        data: {'unit_id': unitId},
      );
      return (response.data as Map<String, dynamic>)['status'] as bool? ??
          false;
    } catch (e) {
      rethrow;
    }
  }
}
