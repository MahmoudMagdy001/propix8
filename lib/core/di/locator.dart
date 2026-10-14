import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:propix8/core/network/auth_interceptor.dart';
import 'package:propix8/core/network/dio_client.dart';
import 'package:propix8/core/services/booking_event_service.dart';
import 'package:propix8/core/services/deep_link_service.dart';
import 'package:propix8/core/storage/storage_service.dart';
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
import 'package:propix8/feature/maintenance_bookings/repositories/maintenance_booking_repository.dart';
import 'package:propix8/feature/maintenance_bookings/services/maintenance_booking_service.dart';
import 'package:propix8/feature/maintenance_bookings/viewmodels/maintenance_bookings_cubit.dart';
import 'package:propix8/feature/maintenance_services/repositories/maintenance_service_repository.dart';
import 'package:propix8/feature/maintenance_services/services/maintenance_service_source.dart';
import 'package:propix8/feature/maintenance_services/viewmodels/maintenance_booking_cubit.dart';
import 'package:propix8/feature/maintenance_services/viewmodels/maintenance_services_cubit.dart';
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
import 'package:propix8/feature/profile/repositories/user_profile_repository.dart';
import 'package:propix8/feature/profile/services/user_profile_service.dart';
import 'package:propix8/feature/profile/viewmodels/user_profile_cubit.dart';
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
    // Services
    ..registerLazySingleton(() => AuthService(locator<DioClient>()))
    ..registerLazySingleton<UnitRemoteDataSource>(
      () => UnitRemoteDataSourceImpl(locator<DioClient>()),
    )
    ..registerLazySingleton(
      () => MaintenanceServiceSource(locator<DioClient>()),
    )
    ..registerLazySingleton(() => BookingService(locator<DioClient>()))
    ..registerLazySingleton(
      () => MaintenanceBookingService(locator<DioClient>()),
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
      () =>
          AuthRepositoryImpl(locator<AuthService>(), locator<StorageService>()),
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
      () => AuthCubit(
        locator<AuthRepository>(),
        locator<AddressSetupRepository>(),
      ),
    )
    ..registerFactory(() => ResetPasswordCubit(locator<AuthRepository>()))
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
    ..registerLazySingleton(
      () => FavoriteBloc(
        getFavoritesUseCase: locator<GetFavoritesUseCase>(),
        toggleFavoriteItemUseCase: locator<ToggleFavoriteItemUseCase>(),
      ),
    )
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
