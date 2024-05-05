import 'package:babelos_app/domain/models/languages_response.dart';
import 'package:babelos_app/domain/models/login_response.dart';
import 'package:babelos_app/domain/models/registration_response.dart';

abstract class UserRemote {
  Future<RegistrationResponse?> regAcc(
      String email,
      String firstname,
      String lastname,
      String spokenLanguage,
      String password,
      String signinType,
      String userType);
  Future<LoginResponse?> login(String email, String password);
  Future<GetLanguagesResponse?> getLanguage();
}
