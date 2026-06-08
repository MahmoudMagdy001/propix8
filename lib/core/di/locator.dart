import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:propix8/core/network/auth_interceptor.dart';
import 'package:propix8/core/network/dio_client.dart';
import 'package:propix8/core/public_feature/repositories/pages_repository.dart';
import 'package:propix8/core/public_feature/services/deep_link_service.dart';
import 'package:propix8/core/public_feature/services/pages_service.dart';
import 'package:propix8/core/public_feature/services/storage_service.dart';
import 'package:propix8/core/public_feature/viewmodels/pages_cubit.dart';
import 'package:propix8/core/services/booking_event_service.dart';
import 'package:propix8/feature/auth/repositories/address_setup_repository.dart';
import 'package:propix8/feature/auth/repositories/auth_repository.dart';
import 'package:propix8/feature/auth/services/address_setup_service.dart';
import 'package:propix8/feature/auth/services/auth_service.dart';
import 'package:propix8/feature/auth/viewmodels/address_setup_cubit.dart';
import 'package:propix8/feature/auth/viewmodels/auth_cubit.dart';
import 'package:propix8/feature/auth/viewmodels/reset_password_cubit.dart';
import 'package:propix8/feature/bookings/repositories/booking_repository.dart';
import 'package:propix8/feature/bookings/services/booking_service.dart';
import 'package:propix8/feature/bookings/viewmodels/booking_cubit.dart';
import 'package:propix8/feature/comparison/viewmodels/choose_product_cubit.dart';
import 'package:propix8/feature/comparison/viewmodels/comparison_cubit.dart';
import 'package:propix8/feature/compound_details/repositories/compound_repository.dart';
import 'package:propix8/feature/compound_details/services/compound_service.dart';
import 'package:propix8/feature/compound_details/viewmodels/compound_units_cubit.dart';
import 'package:propix8/feature/compounds/repositories/compound_repository.dart';
import 'package:propix8/feature/compounds/services/compound_service.dart';
import 'package:propix8/feature/compounds/viewmodels/compound_cubit.dart';
import 'package:propix8/feature/contact/repositories/contact_repository.dart';
import 'package:propix8/feature/contact/services/contact_service.dart';
import 'package:propix8/feature/contact/viewmodels/contact_cubit.dart';
import 'package:propix8/feature/developer_details/repositories/developer_repository.dart';
import 'package:propix8/feature/developer_details/services/developer_service.dart';
import 'package:propix8/feature/developer_details/viewmodels/developer_units_cubit.dart';
import 'package:propix8/feature/developers/repositories/developer_repository.dart';
import 'package:propix8/feature/developers/services/developer_service.dart';
import 'package:propix8/feature/developers/viewmodels/developer_cubit.dart';
import 'package:propix8/feature/favorites/repositories/favorite_repository.dart';
import 'package:propix8/feature/favorites/services/favorite_service.dart';
import 'package:propix8/feature/favorites/viewmodels/favorite_cubit.dart';
import 'package:propix8/feature/home/repositories/unit_repository.dart';
import 'package:propix8/feature/home/services/unit_service.dart';
import 'package:propix8/feature/home/viewmodels/home_cubit.dart';
import 'package:propix8/feature/home/viewmodels/nearby_units_cubit.dart';
import 'package:propix8/feature/maintenance_bookings/repositories/maintenance_booking_repository.dart';
import 'package:propix8/feature/maintenance_bookings/services/maintenance_booking_service.dart';
import 'package:propix8/feature/maintenance_bookings/viewmodels/maintenance_bookings_cubit.dart';
import 'package:propix8/feature/maintenance_services/repositories/maintenance_service_repository.dart';
import 'package:propix8/feature/maintenance_services/services/maintenance_service_source.dart';
import 'package:propix8/feature/maintenance_services/viewmodels/maintenance_booking_cubit.dart';
import 'package:propix8/feature/maintenance_services/viewmodels/maintenance_services_cubit.dart';
import 'package:propix8/feature/onboarding/repositories/onboarding_repository.dart';
import 'package:propix8/feature/onboarding/viewmodels/onboarding_cubit.dart';
import 'package:propix8/feature/our_services/repositories/our_services_repository.dart';
import 'package:propix8/feature/our_services/services/our_services_service.dart';
import 'package:propix8/feature/our_services/viewmodels/our_services_cubit.dart';
import 'package:propix8/feature/profile/repositories/user_profile_repository.dart';
import 'package:propix8/feature/profile/services/user_profile_service.dart';
import 'package:propix8/feature/profile/viewmodels/user_profile_cubit.dart';
import 'package:propix8/feature/search/viewmodels/search_cubit.dart';
import 'package:propix8/feature/settings/repositories/settings_repository.dart';
import 'package:propix8/feature/settings/services/settings_service.dart';
import 'package:propix8/feature/settings/viewmodels/settings_cubit.dart';
import 'package:propix8/feature/unit_details/repositories/unit_details_repository.dart';
import 'package:propix8/feature/unit_details/services/unit_details_service.dart';
import 'package:propix8/feature/unit_details/viewmodels/unit_details_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  const secureStorage = FlutterSecureStorage();
  final storageService = StorageService(sharedPreferences, secureStorage);
  await storageService.initializeCache();
  locator
    ..registerLazySingleton<SharedPreferences>(() => sharedPreferences)
    // Network
    ..registerLazySingleton(() => storageService)
    ..registerLazySingleton(() => AuthInterceptor(locator<StorageService>()))
    ..registerLazySingleton(() => DioClient(Dio(), locator<AuthInterceptor>()))
    // Services
    ..registerLazySingleton(() => AuthService(locator<DioClient>()))
    ..registerLazySingleton(() => UnitService(locator<DioClient>()))
    ..registerLazySingleton(() => UnitDetailsService(locator<DioClient>()))
    ..registerLazySingleton(() => CompoundService(locator<DioClient>()))
    ..registerLazySingleton(() => DeveloperService(locator<DioClient>()))
    ..registerLazySingleton(() => FavoriteService(locator<DioClient>()))
    ..registerLazySingleton(
      () => MaintenanceServiceSource(locator<DioClient>()),
    )
    ..registerLazySingleton(() => BookingService(locator<DioClient>()))
    ..registerLazySingleton(
      () => MaintenanceBookingService(locator<DioClient>()),
    )
    ..registerLazySingleton(() => DevelopersService(locator<DioClient>()))
    ..registerLazySingleton(() => CompoundsService(locator<DioClient>()))
    ..registerLazySingleton(() => PagesService(locator<DioClient>()))
    ..registerLazySingleton(() => OurServicesService(locator<DioClient>()))
    ..registerLazySingleton(() => SettingsService(locator<DioClient>()))
    ..registerLazySingleton(() => ContactService(locator<DioClient>()))
    ..registerLazySingleton<BookingEventService>(BookingEventService.new)
    // Repositories
    ..registerFactory<OnboardingRepository>(OnboardingRepositoryImpl.new)
    ..registerLazySingleton<AuthRepository>(
      () =>
          AuthRepositoryImpl(locator<AuthService>(), locator<StorageService>()),
    )
    ..registerLazySingleton<UnitRepository>(
      () => UnitRepositoryImpl(locator<UnitService>()),
    )
    ..registerLazySingleton<UnitDetailsRepository>(
      () => UnitDetailsRepositoryImpl(
        locator<UnitDetailsService>(),
        locator<BookingEventService>(),
      ),
    )
    ..registerLazySingleton<CompoundRepository>(
      () => CompoundRepositoryImpl(locator<CompoundService>()),
    )
    ..registerLazySingleton<DeveloperRepository>(
      () => DeveloperRepositoryImpl(locator<DeveloperService>()),
    )
    ..registerLazySingleton<FavoriteRepository>(
      () => FavoriteRepositoryImpl(locator<FavoriteService>()),
    )
    ..registerLazySingleton<MaintenanceServiceRepository>(
      () => MaintenanceServiceRepositoryImpl(
        locator<MaintenanceServiceSource>(),
        locator<BookingEventService>(),
      ),
    )
    ..registerLazySingleton<BookingRepository>(
      () => BookingRepositoryImpl(
        locator<BookingService>(),
        locator<BookingEventService>(),
      ),
    )
    ..registerLazySingleton<MaintenanceBookingRepository>(
      () => MaintenanceBookingRepositoryImpl(
        locator<MaintenanceBookingService>(),
        locator<BookingEventService>(),
      ),
    )
    ..registerLazySingleton<DevelopersRepository>(
      () => DevelopersRepositoryImpl(locator<DevelopersService>()),
    )
    ..registerLazySingleton<CompoundsRepository>(
      () => CompoundsRepositoryImpl(locator<CompoundsService>()),
    )
    ..registerLazySingleton<PagesRepository>(
      () => PagesRepositoryImpl(locator<PagesService>()),
    )
    ..registerLazySingleton<OurServicesRepository>(
      () => OurServicesRepositoryImpl(locator<OurServicesService>()),
    )
    ..registerLazySingleton<SettingsRepository>(
      () => SettingsRepositoryImpl(locator<SettingsService>()),
    )
    ..registerLazySingleton<ContactRepository>(
      () => ContactRepositoryImpl(locator<ContactService>()),
    )
    // ViewModels
    ..registerFactory(() => OnboardingCubit(locator<OnboardingRepository>()))
    ..registerLazySingleton(
      () => AuthCubit(
        locator<AuthRepository>(),
        locator<AddressSetupRepository>(),
      ),
    )
    ..registerFactory(() => ResetPasswordCubit(locator<AuthRepository>()))
    ..registerFactory(() => HomeCubit(locator<UnitRepository>()))
    ..registerFactory(() => NearbyUnitsCubit(locator<UnitRepository>()))
    ..registerFactory(
      () => UnitDetailsCubit(
        locator<UnitDetailsRepository>(),
        locator<BookingRepository>(),
      ),
    )
    ..registerFactory(() => SearchCubit(locator<UnitRepository>()))
    ..registerFactory(() => CompoundUnitsCubit(locator<CompoundRepository>()))
    ..registerFactory(() => DeveloperUnitsCubit(locator<DeveloperRepository>()))
    // Profile Feature
    ..registerLazySingleton(() => UserProfileService(locator<DioClient>()))
    ..registerLazySingleton<UserProfileRepository>(
      () => UserProfileRepositoryImpl(
        locator<UserProfileService>(),
        locator<StorageService>(),
      ),
    )
    ..registerLazySingleton(
      () => UserProfileCubit(
        locator<UserProfileRepository>(),
        locator<BookingRepository>(),
        locator<MaintenanceBookingRepository>(),
        locator<BookingEventService>(),
      ),
    )
    ..registerLazySingleton(() => AddressSetupService(locator<DioClient>()))
    ..registerLazySingleton<AddressSetupRepository>(
      () => AddressSetupRepositoryImpl(
        locator<AddressSetupService>(),
        locator<StorageService>(),
      ),
    )
    ..registerFactory(
      () => AddressSetupCubit(locator<AddressSetupRepository>()),
    )
    ..registerLazySingleton(() => FavoriteCubit(locator<FavoriteRepository>()))
    ..registerLazySingleton(
      () => MaintenanceServicesCubit(
        locator<MaintenanceServiceRepository>(),
        locator<MaintenanceBookingRepository>(),
      ),
    )
    ..registerFactory(
      () => MaintenanceBookingCubit(locator<MaintenanceServiceRepository>()),
    )
    ..registerFactory(() => BookingCubit(locator<BookingRepository>()))
    ..registerFactory(
      () => MaintenanceBookingsCubit(locator<MaintenanceBookingRepository>()),
    )
    ..registerFactory(() => DevelopersCubit(locator<DevelopersRepository>()))
    ..registerFactory(() => CompoundsCubit(locator<CompoundsRepository>()))
    ..registerFactory(() => PagesCubit(locator<PagesRepository>()))
    ..registerFactory(() => OurServicesCubit(locator<OurServicesRepository>()))
    ..registerFactory(
      () => SettingsCubit(
        locator<StorageService>(),
        locator<SettingsRepository>(),
      ),
    )
    ..registerFactory(() => ComparisonCubit(locator<UnitDetailsRepository>()))
    ..registerFactory(() => ChooseProductCubit(locator<UnitRepository>()))
    ..registerFactory(() => ContactCubit(locator<ContactRepository>()))
    ..registerLazySingleton(DeepLinkService.new);
}
