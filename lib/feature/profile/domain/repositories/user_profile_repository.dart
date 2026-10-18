import 'package:propix8/core/functional/result.dart';
import 'package:propix8/feature/auth/data/models/auth_model.dart';
import 'package:propix8/feature/auth/data/models/city_model.dart';

abstract class UserProfileRepository {
  ResultFuture<User> getProfile({bool forceRefresh = false});
  ResultFuture<User> updateProfile(
    Map<String, dynamic> data, {
    String? avatarPath,
  });
  ResultFuture<List<City>> getCities();
  ResultUnit deleteProfile();
}
