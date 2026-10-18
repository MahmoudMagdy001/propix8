import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:propix8/core/network/auth_interceptor.dart';
import 'package:propix8/core/network/dio_client.dart';
import 'package:propix8/core/services/booking_event_service.dart';
import 'package:propix8/core/services/deep_link_service.dart';
import 'package:propix8/core/storage/storage_service.dart';
import 'package:propix8/feature/auth/data/datasources/address_setup_remote_data_source.dart';
import 'package:propix8/feature/auth/data/datasources/auth_remote_data_source.dart';
import 'package:propix8/feature/auth/data/repositories/address_setup_repository_impl.dart';
import 'package:propix8/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:propix8/feature/auth/domain/repositories/address_setup_repository.dart';
import 'package:propix8/feature/auth/domain/repositories/auth_repository.dart';
import 'package:propix8/feature/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:propix8/feature/auth/domain/usecases/get_auth_profile_usecase.dart';
import 'package:propix8/feature/auth/domain/usecases/get_cities_usecase.dart';
import 'package:propix8/feature/auth/domain/usecases/login_usecase.dart';
import 'package:propix8/feature/auth/domain/usecases/logout_usecase.dart';
import 'package:propix8/feature/auth/domain/usecases/register_usecase.dart';
import 'package:propix8/feature/auth/domain/usecases/resend_verification_email_usecase.dart';
import 'package:propix8/feature/auth/domain/usecases/reset_password_usecase.dart';
import 'package:propix8/feature/auth/domain/usecases/update_address_profile_usecase.dart';
import 'package:propix8/feature/auth/domain/usecases/verify_email_usecase.dart';
import 'package:propix8/feature/auth/presentation/bloc/address_setup_bloc.dart';
import 'package:propix8/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:propix8/feature/auth/presentation/bloc/reset_password_bloc.dart';
import 'package:propix8/feature/bookings/data/datasources/booking_remote_data_source.dart';
import 'package:propix8/feature/bookings/data/repositories/booking_repository_impl.dart';
import 'package:propix8/feature/bookings/domain/repositories/booking_repository.dart';
import 'package:propix8/feature/bookings/domain/usecases/delete_booking_usecase.dart';
import 'package:propix8/feature/bookings/domain/usecases/get_bookings_usecase.dart';
import 'package:propix8/feature/bookings/domain/usecases/suggest_new_time_usecase.dart';
import 'package:propix8/feature/bookings/domain/usecases/update_booking_status_usecase.dart';
import 'package:propix8/feature/bookings/presentation/bloc/booking_bloc.dart';
import 'package:propix8/feature/comparison/domain/usecases/compare_units_usecase.dart';
import 'package:propix8/feature/comparison/presentation/bloc/choose_product_bloc.dart';
import 'package:propix8/feature/comparison/presentation/bloc/comparison_bloc.dart';
import 'package:propix8/feature/compound_details/data/datasources/compound_details_remote_data_source.dart';
import 'package:propix8/feature/compound_details/data/repositories/compound_details_repository_impl.dart';
import 'package:propix8/feature/compound_details/domain/repositories/compound_details_repository.dart';
import 'package:propix8/feature/compound_details/domain/usecases/get_compound_units_usecase.dart';
import 'package:propix8/feature/compound_details/presentation/bloc/compound_units_bloc.dart';
import 'package:propix8/feature/compounds/data/datasources/compounds_remote_data_source.dart';
import 'package:propix8/feature/compounds/data/repositories/compounds_repository_impl.dart';
import 'package:propix8/feature/compounds/domain/repositories/compounds_repository.dart';
import 'package:propix8/feature/compounds/domain/usecases/get_compounds_usecase.dart';
import 'package:propix8/feature/compounds/presentation/bloc/compounds_bloc.dart';
import 'package:propix8/feature/contact/data/datasources/contact_remote_data_source.dart';
import 'package:propix8/feature/contact/data/repositories/contact_repository_impl.dart';
import 'package:propix8/feature/contact/domain/repositories/contact_repository.dart';
import 'package:propix8/feature/contact/domain/usecases/send_contact_request_usecase.dart';
import 'package:propix8/feature/contact/presentation/bloc/contact_bloc.dart';
import 'package:propix8/feature/developer_details/data/datasources/developer_details_remote_data_source.dart';
import 'package:propix8/feature/developer_details/data/repositories/developer_details_repository_impl.dart';
import 'package:propix8/feature/developer_details/domain/repositories/developer_details_repository.dart';
import 'package:propix8/feature/developer_details/domain/usecases/get_developer_units_usecase.dart';
import 'package:propix8/feature/developer_details/presentation/bloc/developer_units_bloc.dart';
import 'package:propix8/feature/developers/data/datasources/developers_remote_data_source.dart';
import 'package:propix8/feature/developers/data/repositories/developers_repository_impl.dart';
import 'package:propix8/feature/developers/domain/repositories/developers_repository.dart';
import 'package:propix8/feature/developers/domain/usecases/get_developers_usecase.dart';
import 'package:propix8/feature/developers/presentation/bloc/developers_bloc.dart';
import 'package:propix8/feature/favorites/data/datasources/favorites_remote_data_source.dart';
import 'package:propix8/feature/favorites/data/repositories/favorites_repository_impl.dart';
import 'package:propix8/feature/favorites/domain/repositories/favorites_repository.dart';
import 'package:propix8/feature/favorites/domain/usecases/get_favorites_usecase.dart';
import 'package:propix8/feature/favorites/domain/usecases/toggle_favorite_item_usecase.dart';
import 'package:propix8/feature/favorites/presentation/bloc/favorite_bloc.dart';
import 'package:propix8/feature/home/data/datasources/unit_remote_data_source.dart';
import 'package:propix8/feature/home/data/repositories/unit_repository_impl.dart';
import 'package:propix8/feature/home/domain/repositories/unit_repository.dart';
import 'package:propix8/feature/home/domain/usecases/get_all_units_usecase.dart';
import 'package:propix8/feature/home/domain/usecases/get_banners_usecase.dart';
import 'package:propix8/feature/home/domain/usecases/get_categories_usecase.dart';
import 'package:propix8/feature/home/domain/usecases/get_latest_units_usecase.dart';
import 'package:propix8/feature/home/domain/usecases/get_nearby_units_usecase.dart';
import 'package:propix8/feature/home/domain/usecases/toggle_favorite_usecase.dart';
import 'package:propix8/feature/home/presentation/bloc/home_bloc.dart';
import 'package:propix8/feature/home/presentation/bloc/nearby_units_bloc.dart';
import 'package:propix8/feature/home/presentation/filter/bloc/filter_bloc.dart';
import 'package:propix8/feature/maintenance_bookings/data/datasources/maintenance_booking_remote_data_source.dart';
import 'package:propix8/feature/maintenance_bookings/data/repositories/maintenance_booking_repository_impl.dart';
import 'package:propix8/feature/maintenance_bookings/domain/repositories/maintenance_booking_repository.dart';
import 'package:propix8/feature/maintenance_bookings/domain/usecases/delete_maintenance_booking_usecase.dart';
import 'package:propix8/feature/maintenance_bookings/domain/usecases/get_maintenance_bookings_usecase.dart';
import 'package:propix8/feature/maintenance_bookings/domain/usecases/update_maintenance_booking_usecase.dart';
import 'package:propix8/feature/maintenance_bookings/presentation/bloc/maintenance_bookings_bloc.dart';
import 'package:propix8/feature/maintenance_services/data/datasources/maintenance_service_remote_data_source.dart';
import 'package:propix8/feature/maintenance_services/data/repositories/maintenance_service_repository_impl.dart';
import 'package:propix8/feature/maintenance_services/domain/repositories/maintenance_service_repository.dart';
import 'package:propix8/feature/maintenance_services/domain/usecases/book_maintenance_service_usecase.dart';
import 'package:propix8/feature/maintenance_services/domain/usecases/get_maintenance_services_usecase.dart';
import 'package:propix8/feature/maintenance_services/presentation/bloc/maintenance_booking_bloc.dart';
import 'package:propix8/feature/maintenance_services/presentation/bloc/maintenance_services_bloc.dart';
import 'package:propix8/feature/onboarding/data/datasources/onboarding_local_data_source.dart';
import 'package:propix8/feature/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:propix8/feature/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:propix8/feature/onboarding/domain/usecases/complete_onboarding_usecase.dart';
import 'package:propix8/feature/onboarding/domain/usecases/get_onboarding_pages_usecase.dart';
import 'package:propix8/feature/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:propix8/feature/our_services/data/datasources/our_services_remote_data_source.dart';
import 'package:propix8/feature/our_services/data/repositories/our_services_repository_impl.dart';
import 'package:propix8/feature/our_services/domain/repositories/our_services_repository.dart';
import 'package:propix8/feature/our_services/domain/usecases/add_testimonial_usecase.dart';
import 'package:propix8/feature/our_services/domain/usecases/delete_testimonial_usecase.dart';
import 'package:propix8/feature/our_services/domain/usecases/get_faqs_usecase.dart';
import 'package:propix8/feature/our_services/domain/usecases/get_services_usecase.dart';
import 'package:propix8/feature/our_services/domain/usecases/get_testimonials_usecase.dart';
import 'package:propix8/feature/our_services/domain/usecases/update_testimonial_usecase.dart';
import 'package:propix8/feature/our_services/presentation/bloc/our_services_bloc.dart';
import 'package:propix8/feature/profile/data/datasources/user_profile_remote_data_source.dart';
import 'package:propix8/feature/profile/data/repositories/user_profile_repository_impl.dart';
import 'package:propix8/feature/profile/domain/repositories/user_profile_repository.dart';
import 'package:propix8/feature/profile/domain/usecases/delete_user_profile_usecase.dart';
import 'package:propix8/feature/profile/domain/usecases/get_profile_cities_usecase.dart';
import 'package:propix8/feature/profile/domain/usecases/get_user_profile_usecase.dart';
import 'package:propix8/feature/profile/domain/usecases/update_user_profile_usecase.dart';
import 'package:propix8/feature/profile/presentation/bloc/user_profile_bloc.dart';
import 'package:propix8/feature/search/domain/usecases/search_units_usecase.dart';
import 'package:propix8/feature/search/presentation/bloc/search_bloc.dart';
import 'package:propix8/feature/settings/data/datasources/settings_local_data_source.dart';
import 'package:propix8/feature/settings/data/datasources/settings_remote_data_source.dart';
import 'package:propix8/feature/settings/data/repositories/settings_repository_impl.dart';
import 'package:propix8/feature/settings/domain/repositories/settings_repository.dart';
import 'package:propix8/feature/settings/domain/usecases/get_locale_usecase.dart';
import 'package:propix8/feature/settings/domain/usecases/get_site_settings_usecase.dart';
import 'package:propix8/feature/settings/domain/usecases/get_theme_mode_usecase.dart';
import 'package:propix8/feature/settings/domain/usecases/save_locale_usecase.dart';
import 'package:propix8/feature/settings/domain/usecases/save_theme_mode_usecase.dart';
import 'package:propix8/feature/settings/presentation/bloc/settings_bloc.dart';
import 'package:propix8/feature/static_pages/data/datasources/pages_remote_data_source.dart';
import 'package:propix8/feature/static_pages/data/repositories/pages_repository_impl.dart';
import 'package:propix8/feature/static_pages/domain/repositories/pages_repository.dart';
import 'package:propix8/feature/static_pages/domain/usecases/get_pages_usecase.dart';
import 'package:propix8/feature/static_pages/domain/usecases/get_stats_usecase.dart';
import 'package:propix8/feature/static_pages/presentation/bloc/pages_bloc.dart';
import 'package:propix8/feature/unit_details/data/datasources/unit_details_remote_data_source.dart';
import 'package:propix8/feature/unit_details/data/repositories/unit_details_repository_impl.dart';
import 'package:propix8/feature/unit_details/domain/repositories/unit_details_repository.dart';
import 'package:propix8/feature/unit_details/domain/usecases/contact_owner_usecase.dart';
import 'package:propix8/feature/unit_details/domain/usecases/create_unit_booking_usecase.dart';
import 'package:propix8/feature/unit_details/domain/usecases/delete_unit_review_usecase.dart';
import 'package:propix8/feature/unit_details/domain/usecases/get_related_units_usecase.dart';
import 'package:propix8/feature/unit_details/domain/usecases/get_unit_details_usecase.dart';
import 'package:propix8/feature/unit_details/domain/usecases/get_unit_reviews_usecase.dart';
import 'package:propix8/feature/unit_details/domain/usecases/submit_unit_review_usecase.dart';
import 'package:propix8/feature/unit_details/domain/usecases/update_unit_review_usecase.dart';
import 'package:propix8/feature/unit_details/presentation/bloc/unit_details_bloc.dart';
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
    // Data Sources & Services
    ..registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(locator<DioClient>()),
    )
    ..registerLazySingleton<AddressSetupRemoteDataSource>(
      () => AddressSetupRemoteDataSourceImpl(locator<DioClient>()),
    )
    ..registerLazySingleton<UnitRemoteDataSource>(
      () => UnitRemoteDataSourceImpl(locator<DioClient>()),
    )
    ..registerLazySingleton<MaintenanceServiceRemoteDataSource>(
      () => MaintenanceServiceRemoteDataSourceImpl(locator<DioClient>()),
    )
    ..registerLazySingleton<BookingRemoteDataSource>(
      () => BookingRemoteDataSourceImpl(locator<DioClient>()),
    )
    ..registerLazySingleton<MaintenanceBookingRemoteDataSource>(
      () => MaintenanceBookingRemoteDataSourceImpl(locator<DioClient>()),
    )
    ..registerLazySingleton<DevelopersRemoteDataSource>(
      () => DevelopersRemoteDataSourceImpl(locator<DioClient>()),
    )
    ..registerLazySingleton<CompoundsRemoteDataSource>(
      () => CompoundsRemoteDataSourceImpl(locator<DioClient>()),
    )
    ..registerLazySingleton<PagesRemoteDataSource>(
      () => PagesRemoteDataSourceImpl(locator<DioClient>()),
    )
    ..registerLazySingleton<OurServicesRemoteDataSource>(
      () => OurServicesRemoteDataSourceImpl(locator<DioClient>()),
    )
    ..registerLazySingleton<SettingsRemoteDataSource>(
      () => SettingsRemoteDataSourceImpl(locator<DioClient>()),
    )
    ..registerLazySingleton<SettingsLocalDataSource>(
      () => SettingsLocalDataSourceImpl(locator<StorageService>()),
    )
    ..registerLazySingleton<ContactRemoteDataSource>(
      () => ContactRemoteDataSourceImpl(locator<DioClient>()),
    )
    ..registerLazySingleton<OnboardingLocalDataSource>(
      () => OnboardingLocalDataSourceImpl(locator<StorageService>()),
    )
    ..registerLazySingleton<BookingEventService>(BookingEventService.new)
    // Repositories
    ..registerFactory<OnboardingRepository>(
      () => OnboardingRepositoryImpl(locator<OnboardingLocalDataSource>()),
    )
    ..registerLazySingleton(
      () => GetOnboardingPagesUseCase(locator<OnboardingRepository>()),
    )
    ..registerLazySingleton(
      () => CompleteOnboardingUseCase(locator<OnboardingRepository>()),
    )
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        locator<AuthRemoteDataSource>(),
        locator<StorageService>(),
      ),
    )
    ..registerLazySingleton<AddressSetupRepository>(
      () => AddressSetupRepositoryImpl(
        locator<AddressSetupRemoteDataSource>(),
        locator<StorageService>(),
      ),
    )
    // Auth Use Cases
    ..registerLazySingleton(() => LoginUseCase(locator<AuthRepository>()))
    ..registerLazySingleton(() => RegisterUseCase(locator<AuthRepository>()))
    ..registerLazySingleton(() => LogoutUseCase(locator<AuthRepository>()))
    ..registerLazySingleton(
      () => ForgotPasswordUseCase(locator<AuthRepository>()),
    )
    ..registerLazySingleton(
      () => ResetPasswordUseCase(locator<AuthRepository>()),
    )
    ..registerLazySingleton(
      () => ResendVerificationEmailUseCase(locator<AuthRepository>()),
    )
    ..registerLazySingleton(() => VerifyEmailUseCase(locator<AuthRepository>()))
    ..registerLazySingleton(
      () => GetAuthProfileUseCase(locator<AddressSetupRepository>()),
    )
    ..registerLazySingleton(
      () => GetCitiesUseCase(locator<AddressSetupRepository>()),
    )
    ..registerLazySingleton(
      () => UpdateAddressProfileUseCase(locator<AddressSetupRepository>()),
    )
    ..registerLazySingleton<UnitRepository>(
      () => UnitRepositoryImpl(locator<UnitRemoteDataSource>()),
    )
    ..registerLazySingleton(() => GetBannersUseCase(locator<UnitRepository>()))
    ..registerLazySingleton(
      () => GetCategoriesUseCase(locator<UnitRepository>()),
    )
    ..registerLazySingleton(
      () => GetNearbyUnitsUseCase(locator<UnitRepository>()),
    )
    ..registerLazySingleton(
      () => GetLatestUnitsUseCase(locator<UnitRepository>()),
    )
    ..registerLazySingleton(() => GetAllUnitsUseCase(locator<UnitRepository>()))
    ..registerLazySingleton(
      () => ToggleFavoriteUseCase(locator<UnitRepository>()),
    )
    ..registerLazySingleton<UnitDetailsRemoteDataSource>(
      () => UnitDetailsRemoteDataSourceImpl(locator<DioClient>()),
    )
    ..registerLazySingleton<UnitDetailsRepository>(
      () => UnitDetailsRepositoryImpl(
        locator<UnitDetailsRemoteDataSource>(),
        locator<BookingEventService>(),
      ),
    )
    ..registerLazySingleton(
      () => GetUnitDetailsUseCase(locator<UnitDetailsRepository>()),
    )
    ..registerLazySingleton(
      () => GetRelatedUnitsUseCase(locator<UnitDetailsRepository>()),
    )
    ..registerLazySingleton(
      () => GetUnitReviewsUseCase(locator<UnitDetailsRepository>()),
    )
    ..registerLazySingleton(
      () => SubmitUnitReviewUseCase(locator<UnitDetailsRepository>()),
    )
    ..registerLazySingleton(
      () => DeleteUnitReviewUseCase(locator<UnitDetailsRepository>()),
    )
    ..registerLazySingleton(
      () => UpdateUnitReviewUseCase(locator<UnitDetailsRepository>()),
    )
    ..registerLazySingleton(
      () => ContactOwnerUseCase(locator<UnitDetailsRepository>()),
    )
    ..registerLazySingleton(
      () => CreateUnitBookingUseCase(locator<UnitDetailsRepository>()),
    )
    ..registerLazySingleton<CompoundDetailsRemoteDataSource>(
      () => CompoundDetailsRemoteDataSourceImpl(locator<DioClient>()),
    )
    ..registerLazySingleton<CompoundDetailsRepository>(
      () => CompoundDetailsRepositoryImpl(
        locator<CompoundDetailsRemoteDataSource>(),
      ),
    )
    ..registerLazySingleton(
      () => GetCompoundUnitsUseCase(locator<CompoundDetailsRepository>()),
    )
    ..registerLazySingleton<DeveloperDetailsRemoteDataSource>(
      () => DeveloperDetailsRemoteDataSourceImpl(locator<DioClient>()),
    )
    ..registerLazySingleton<DeveloperDetailsRepository>(
      () => DeveloperDetailsRepositoryImpl(
        locator<DeveloperDetailsRemoteDataSource>(),
      ),
    )
    ..registerLazySingleton(
      () => GetDeveloperUnitsUseCase(locator<DeveloperDetailsRepository>()),
    )
    ..registerLazySingleton<FavoritesRemoteDataSource>(
      () => FavoritesRemoteDataSourceImpl(locator<DioClient>()),
    )
    ..registerLazySingleton<FavoritesRepository>(
      () => FavoritesRepositoryImpl(locator<FavoritesRemoteDataSource>()),
    )
    ..registerLazySingleton(
      () => GetFavoritesUseCase(locator<FavoritesRepository>()),
    )
    ..registerLazySingleton(
      () => ToggleFavoriteItemUseCase(locator<FavoritesRepository>()),
    )
    ..registerLazySingleton<MaintenanceServiceRepository>(
      () => MaintenanceServiceRepositoryImpl(
        locator<MaintenanceServiceRemoteDataSource>(),
        locator<BookingEventService>(),
      ),
    )
    ..registerLazySingleton(
      () => GetMaintenanceServicesUseCase(
        locator<MaintenanceServiceRepository>(),
      ),
    )
    ..registerLazySingleton(
      () => BookMaintenanceServiceUseCase(
        locator<MaintenanceServiceRepository>(),
      ),
    )
    ..registerLazySingleton<BookingRepository>(
      () => BookingRepositoryImpl(
        locator<BookingRemoteDataSource>(),
        locator<BookingEventService>(),
      ),
    )
    ..registerLazySingleton(
      () => GetBookingsUseCase(locator<BookingRepository>()),
    )
    ..registerLazySingleton(
      () => UpdateBookingStatusUseCase(locator<BookingRepository>()),
    )
    ..registerLazySingleton(
      () => SuggestNewTimeUseCase(locator<BookingRepository>()),
    )
    ..registerLazySingleton(
      () => DeleteBookingUseCase(locator<BookingRepository>()),
    )
    ..registerLazySingleton<MaintenanceBookingRepository>(
      () => MaintenanceBookingRepositoryImpl(
        locator<MaintenanceBookingRemoteDataSource>(),
        locator<BookingEventService>(),
      ),
    )
    ..registerLazySingleton(
      () => GetMaintenanceBookingsUseCase(locator<MaintenanceBookingRepository>()),
    )
    ..registerLazySingleton(
      () => DeleteMaintenanceBookingUseCase(locator<MaintenanceBookingRepository>()),
    )
    ..registerLazySingleton(
      () => UpdateMaintenanceBookingUseCase(locator<MaintenanceBookingRepository>()),
    )
    ..registerLazySingleton<DevelopersRepository>(
      () => DevelopersRepositoryImpl(locator<DevelopersRemoteDataSource>()),
    )
    ..registerLazySingleton(
      () => GetDevelopersUseCase(locator<DevelopersRepository>()),
    )
    ..registerLazySingleton<CompoundsRepository>(
      () => CompoundsRepositoryImpl(locator<CompoundsRemoteDataSource>()),
    )
    ..registerLazySingleton(
      () => GetCompoundsUseCase(locator<CompoundsRepository>()),
    )
    ..registerLazySingleton<PagesRepository>(
      () => PagesRepositoryImpl(locator<PagesRemoteDataSource>()),
    )
    ..registerLazySingleton(() => GetPagesUseCase(locator<PagesRepository>()))
    ..registerLazySingleton(() => GetStatsUseCase(locator<PagesRepository>()))
    ..registerLazySingleton<OurServicesRepository>(
      () => OurServicesRepositoryImpl(locator<OurServicesRemoteDataSource>()),
    )
    ..registerLazySingleton(
      () => GetServicesUseCase(locator<OurServicesRepository>()),
    )
    ..registerLazySingleton(
      () => GetFaqsUseCase(locator<OurServicesRepository>()),
    )
    ..registerLazySingleton(
      () => GetTestimonialsUseCase(locator<OurServicesRepository>()),
    )
    ..registerLazySingleton(
      () => AddTestimonialUseCase(locator<OurServicesRepository>()),
    )
    ..registerLazySingleton(
      () => UpdateTestimonialUseCase(locator<OurServicesRepository>()),
    )
    ..registerLazySingleton(
      () => DeleteTestimonialUseCase(locator<OurServicesRepository>()),
    )
    ..registerLazySingleton<SettingsRepository>(
      () => SettingsRepositoryImpl(
        remoteDataSource: locator<SettingsRemoteDataSource>(),
        localDataSource: locator<SettingsLocalDataSource>(),
      ),
    )
    ..registerLazySingleton(
      () => GetSiteSettingsUseCase(locator<SettingsRepository>()),
    )
    ..registerLazySingleton(
      () => GetThemeModeUseCase(locator<SettingsRepository>()),
    )
    ..registerLazySingleton(
      () => SaveThemeModeUseCase(locator<SettingsRepository>()),
    )
    ..registerLazySingleton(
      () => GetLocaleUseCase(locator<SettingsRepository>()),
    )
    ..registerLazySingleton(
      () => SaveLocaleUseCase(locator<SettingsRepository>()),
    )
    ..registerLazySingleton<ContactRepository>(
      () => ContactRepositoryImpl(locator<ContactRemoteDataSource>()),
    )
    ..registerLazySingleton(
      () => SendContactRequestUseCase(locator<ContactRepository>()),
    )
    // ViewModels
    ..registerFactory(
      () => OnboardingBloc(
        getOnboardingPagesUseCase: locator<GetOnboardingPagesUseCase>(),
        completeOnboardingUseCase: locator<CompleteOnboardingUseCase>(),
      ),
    )
    ..registerLazySingleton(
      () => AuthBloc(
        authRepository: locator<AuthRepository>(),
        addressSetupRepository: locator<AddressSetupRepository>(),
        loginUseCase: locator<LoginUseCase>(),
        registerUseCase: locator<RegisterUseCase>(),
        logoutUseCase: locator<LogoutUseCase>(),
        resendVerificationEmailUseCase:
            locator<ResendVerificationEmailUseCase>(),
        verifyEmailUseCase: locator<VerifyEmailUseCase>(),
        getAuthProfileUseCase: locator<GetAuthProfileUseCase>(),
      ),
    )
    ..registerFactory(
      () => ResetPasswordBloc(
        authRepository: locator<AuthRepository>(),
        forgotPasswordUseCase: locator<ForgotPasswordUseCase>(),
        resetPasswordUseCase: locator<ResetPasswordUseCase>(),
      ),
    )
    ..registerFactory(
      () => HomeBloc(
        getBannersUseCase: locator<GetBannersUseCase>(),
        getCategoriesUseCase: locator<GetCategoriesUseCase>(),
        getNearbyUnitsUseCase: locator<GetNearbyUnitsUseCase>(),
        getLatestUnitsUseCase: locator<GetLatestUnitsUseCase>(),
        getAllUnitsUseCase: locator<GetAllUnitsUseCase>(),
        toggleFavoriteUseCase: locator<ToggleFavoriteUseCase>(),
      ),
    )
    ..registerFactory(
      () => NearbyUnitsBloc(
        getNearbyUnitsUseCase: locator<GetNearbyUnitsUseCase>(),
        toggleFavoriteUseCase: locator<ToggleFavoriteUseCase>(),
      ),
    )
    ..registerFactory(() => FilterBloc(locator<AddressSetupRepository>()))
    ..registerFactory(
      () => UnitDetailsBloc(
        getUnitDetailsUseCase: locator<GetUnitDetailsUseCase>(),
        getRelatedUnitsUseCase: locator<GetRelatedUnitsUseCase>(),
        getUnitReviewsUseCase: locator<GetUnitReviewsUseCase>(),
        submitUnitReviewUseCase: locator<SubmitUnitReviewUseCase>(),
        deleteUnitReviewUseCase: locator<DeleteUnitReviewUseCase>(),
        updateUnitReviewUseCase: locator<UpdateUnitReviewUseCase>(),
        contactOwnerUseCase: locator<ContactOwnerUseCase>(),
        createUnitBookingUseCase: locator<CreateUnitBookingUseCase>(),
        bookingRepository: locator<BookingRepository>(),
      ),
    )
    ..registerLazySingleton(
      () => SearchUnitsUseCase(locator<GetAllUnitsUseCase>()),
    )
    ..registerFactory(
      () => SearchBloc(searchUnitsUseCase: locator<SearchUnitsUseCase>()),
    )
    ..registerFactory(
      () => CompoundUnitsBloc(
        getCompoundUnitsUseCase: locator<GetCompoundUnitsUseCase>(),
      ),
    )
    ..registerFactory(
      () => DeveloperUnitsBloc(
        getDeveloperUnitsUseCase: locator<GetDeveloperUnitsUseCase>(),
      ),
    )
    // Profile Feature
    ..registerLazySingleton<UserProfileRemoteDataSource>(
      () => UserProfileRemoteDataSourceImpl(locator<DioClient>()),
    )
    ..registerLazySingleton<UserProfileRepository>(
      () => UserProfileRepositoryImpl(
        locator<UserProfileRemoteDataSource>(),
        locator<StorageService>(),
      ),
    )
    ..registerLazySingleton(
      () => GetUserProfileUseCase(locator<UserProfileRepository>()),
    )
    ..registerLazySingleton(
      () => UpdateUserProfileUseCase(locator<UserProfileRepository>()),
    )
    ..registerLazySingleton(
      () => GetProfileCitiesUseCase(locator<UserProfileRepository>()),
    )
    ..registerLazySingleton(
      () => DeleteUserProfileUseCase(locator<UserProfileRepository>()),
    )
    ..registerLazySingleton(
      () => UserProfileBloc(
        getUserProfileUseCase: locator<GetUserProfileUseCase>(),
        updateUserProfileUseCase: locator<UpdateUserProfileUseCase>(),
        getProfileCitiesUseCase: locator<GetProfileCitiesUseCase>(),
        deleteUserProfileUseCase: locator<DeleteUserProfileUseCase>(),
        bookingRepository: locator<BookingRepository>(),
        maintenanceBookingRepository: locator<MaintenanceBookingRepository>(),
        bookingEventService: locator<BookingEventService>(),
        onUserUpdated: (user) => locator<AuthBloc>().updateUser(user),
      ),
    )
    ..registerFactory(
      () => AddressSetupBloc(
        addressSetupRepository: locator<AddressSetupRepository>(),
        authBloc: locator<AuthBloc>(),
        getCitiesUseCase: locator<GetCitiesUseCase>(),
        updateAddressProfileUseCase: locator<UpdateAddressProfileUseCase>(),
      ),
    )
    ..registerLazySingleton(
      () => FavoriteBloc(
        getFavoritesUseCase: locator<GetFavoritesUseCase>(),
        toggleFavoriteItemUseCase: locator<ToggleFavoriteItemUseCase>(),
      ),
    )
    ..registerLazySingleton(
      () => MaintenanceServicesBloc(
        getMaintenanceServicesUseCase:
            locator<GetMaintenanceServicesUseCase>(),
        maintenanceBookingRepository: locator<MaintenanceBookingRepository>(),
      ),
    )
    ..registerFactory(
      () => MaintenanceBookingBloc(locator<BookMaintenanceServiceUseCase>()),
    )
    ..registerFactory(
      () => BookingBloc(
        getBookingsUseCase: locator<GetBookingsUseCase>(),
        updateBookingStatusUseCase: locator<UpdateBookingStatusUseCase>(),
        suggestNewTimeUseCase: locator<SuggestNewTimeUseCase>(),
        deleteBookingUseCase: locator<DeleteBookingUseCase>(),
      ),
    )
    ..registerFactory(
      () => MaintenanceBookingsBloc(
        getMaintenanceBookingsUseCase: locator<GetMaintenanceBookingsUseCase>(),
        deleteMaintenanceBookingUseCase: locator<DeleteMaintenanceBookingUseCase>(),
        updateMaintenanceBookingUseCase: locator<UpdateMaintenanceBookingUseCase>(),
      ),
    )
    ..registerFactory(
      () =>
          DevelopersBloc(getDevelopersUseCase: locator<GetDevelopersUseCase>()),
    )
    ..registerFactory(
      () => CompoundsBloc(getCompoundsUseCase: locator<GetCompoundsUseCase>()),
    )
    ..registerFactory(
      () => PagesBloc(
        getPagesUseCase: locator<GetPagesUseCase>(),
        getStatsUseCase: locator<GetStatsUseCase>(),
      ),
    )
    ..registerFactory(
      () => OurServicesBloc(
        getServicesUseCase: locator<GetServicesUseCase>(),
        getFaqsUseCase: locator<GetFaqsUseCase>(),
        getTestimonialsUseCase: locator<GetTestimonialsUseCase>(),
        addTestimonialUseCase: locator<AddTestimonialUseCase>(),
        updateTestimonialUseCase: locator<UpdateTestimonialUseCase>(),
        deleteTestimonialUseCase: locator<DeleteTestimonialUseCase>(),
      ),
    )
    ..registerLazySingleton(
      () => SettingsBloc(
        getSiteSettingsUseCase: locator<GetSiteSettingsUseCase>(),
        getThemeModeUseCase: locator<GetThemeModeUseCase>(),
        saveThemeModeUseCase: locator<SaveThemeModeUseCase>(),
        getLocaleUseCase: locator<GetLocaleUseCase>(),
        saveLocaleUseCase: locator<SaveLocaleUseCase>(),
      ),
    )
    ..registerLazySingleton(
      () => CompareUnitsUseCase(locator<GetUnitDetailsUseCase>()),
    )
    ..registerFactory(
      () => ComparisonBloc(compareUnitsUseCase: locator<CompareUnitsUseCase>()),
    )
    ..registerFactory(
      () =>
          ChooseProductBloc(getAllUnitsUseCase: locator<GetAllUnitsUseCase>()),
    )
    ..registerFactory(
      () => ContactBloc(
        sendContactRequestUseCase: locator<SendContactRequestUseCase>(),
      ),
    )
    ..registerLazySingleton(DeepLinkService.new);
}
