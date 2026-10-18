import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/auth/domain/entities/city_entity.dart';
import 'package:propix8/feature/auth/domain/entities/user_entity.dart';

abstract class AddressSetupRepository {
  ResultFuture<List<City>> getCities();
  ResultFuture<User> updateProfile({
    required int cityId,
    required String address,
  });
  ResultFuture<User> getProfile();
}
