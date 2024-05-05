import 'package:babelos_app/presentation/base/base.vm.dart';
import 'package:babelos_app/presentation/screen/bottom_nav/bottom_nav.vm.dart';
import 'package:babelos_app/presentation/screen/home/home_vm.dart';
import 'package:babelos_app/presentation/screen/onboarding/intro_screen/lang_learn_choice/want_learn_vm.dart';
import 'package:babelos_app/presentation/screen/onboarding/intro_screen/lang_select/language_selection_vm.dart';
import 'package:babelos_app/presentation/screen/onboarding/intro_screen/rate_prof/rate_proficiency_vm.dart';
import 'package:dio/dio.dart';
import 'package:babelos_app/presentation/screen/onboarding/__onboarding.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'data/cache/sharedpreferences.dart';
import 'data/remote/user_remote.dart';
import 'data/remote/user_remote_impl.dart';
import 'data/repository/user_repository.dart';
import 'data/repository/user_repository_impl.dart';
import 'data/services/app_cache.dart';
import 'data/services/navigation_service.dart';
import 'data/services/storage-service.dart';

GetIt getIt = GetIt.I;

void setupLocator() {
  setupDio();

  // Services
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());
  getIt.registerLazySingleton<StorageService>(() => StorageService());
  getIt.registerLazySingleton<SharedPreference>(() => SharedPreference());
  getIt.registerLazySingleton<UserRemoteImpl>(
      () => UserRemoteImpl(getIt<Dio>()));
  getIt.registerFactory<UserRemote>(
      () => UserRemoteImpl(getIt<Dio>()));
  getIt.registerFactory<UserRepository>(
      () => UserRepositoryImpl(getIt<UserRemote>()));
  getIt.registerLazySingleton<AppCache>(() => AppCache());
  registerViewModel();
}

void setupDio() {
  getIt.registerFactory(() {
    Dio dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
// customization
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90));
    return dio;
  });
}

void registerViewModel() {
  //View Model
  getIt.registerFactory<BaseViewModel>(() => BaseViewModel());
  getIt.registerFactory<BottomNavViewModel>(() => BottomNavViewModel());
  getIt.registerFactory<SignUpViewModel>(() => SignUpViewModel());
  getIt.registerFactory<SignInViewModel>(() => SignInViewModel());
  getIt.registerFactory<LangSelectionViewModel>(() => LangSelectionViewModel());
  getIt.registerFactory<RateProfViewModel>(() => RateProfViewModel());
  getIt.registerFactory<WantLearnViewModel>(() => WantLearnViewModel());
  getIt.registerFactory<HomeViewModel>(()=> HomeViewModel());
}
