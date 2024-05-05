import 'package:babelos_app/data/core/config.dart';
import 'package:babelos_app/data/core/network/error_handler.dart';
import 'package:babelos_app/data/core/network/urlPath.dart';
import 'package:babelos_app/data/remote/user_remote.dart';
import 'package:babelos_app/domain/models/languages_response.dart';
import 'package:dio/dio.dart';
import 'package:babelos_app/domain/models/login_response.dart';
import 'package:babelos_app/domain/models/registration_response.dart';
import 'package:babelos_app/routes/routes.dart';
import 'package:babelos_app/utils/__utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../locator.dart';
import '../services/app_cache.dart';

/// This calls implements the UserRemote logic
class UserRemoteImpl extends UserRemote {
  AppCache cache = getIt<AppCache>();
  final Dio dio;

  UserRemoteImpl(
    this.dio,
  );

  @override
  Future<RegistrationResponse?> regAcc(
      String email,
      String firstname,
      String lastname,
      String spokenLanguage,
      String password,
      String signinType,
      String userType) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var dataBody = {
        "email": email,
        "firstName": firstname,
        "lastName": lastname,
        "password": password,
        "signinType": "password",
        "spokenLanguage": spokenLanguage,
        "userType": userType,
        "country": {
          "name": "Nigeria",
          "code": "NG",
          "flag":
              "https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/NG.svg"
        }
      };
      var response = await dio.post("${Config.BASEURL}${UrlPath.signup}",
          data: dataBody,
          options: Options(followRedirects: true, headers: {
            "Accept": "application/json",
          }));
      final responseData = RegistrationResponse.fromJson(response.data);
      final token = responseData.token.toString();
      print("+++++++++++$token");
      prefs.setString(sharedPreference.tokenKey, token);

      navigationService.navigateToReplace(AppRoutes.bottomNav, argument: 0);
      showCustomToast("Registration Successful", success: true);
      return responseData;
    } on DioError catch (err) {
      handleError(err);
      print("Show login remote error:: $err");
      rethrow;
    }
  }

  @override
  Future<LoginResponse?> login(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var dataBody = {'email': email, 'password': password};
      var response = await dio.post("${Config.BASEURL}${UrlPath.login}",
          data: dataBody,
          options: Options(followRedirects: true, headers: {
            "Accept": "application/json",
          }));
      final responseData = LoginResponse.fromJson(response.data);

      final token = responseData.token.toString();
      print("+++++++++++$token");
      prefs.setString(sharedPreference.tokenKey, token);
      navigationService.navigateToReplace(AppRoutes.bottomNav, argument: 0);
      showCustomToast("Login successful", success: true);

      return responseData;
    } on DioError catch (err) {
      handleError(err);
      print("Show login remote error:: $err");
      rethrow;
    }
  }

  @override
  Future<GetLanguagesResponse?> getLanguage() async {
    try {
      var response = await dio.get("${Config.BASEURL}${UrlPath.getLanguages}",
          options: Options(followRedirects: true, headers: {
            "Accept": "application/json",
          }));
      final responseData = GetLanguagesResponse.fromJson(response.data);
      return responseData;
    } on DioError catch (err) {
      handleError(err);
      print("Show login remote error:: $err");
      rethrow;
    }
  }
}
