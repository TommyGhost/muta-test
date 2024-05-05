import 'package:babelos_app/data/repository/user_repository.dart';
import 'package:babelos_app/domain/models/languages_response.dart';
import 'package:babelos_app/domain/models/login_response.dart';
import 'package:babelos_app/domain/models/registration_response.dart';
import '../remote/user_remote.dart';

class UserRepositoryImpl extends UserRepository {
  final UserRemote userRemote;
  UserRepositoryImpl(this.userRemote);

  @override
  Future<RegistrationResponse?> regAcc(
      String email,
      String firstname,
      String lastname,
      String spokenLanguage,
      String password,
      String signinType,
      String userType) async {
    final response = await userRemote.regAcc(email, firstname, lastname, spokenLanguage, password, signinType, userType);
    return response;
  }

  @override
  Future<LoginResponse?> login(String email, String password) async {
    final response = await userRemote.login(email, password);
    return response;
  }


  @override
  Future<GetLanguagesResponse?> getLanguage() async {
    final response = await userRemote.getLanguage();
    return response;
  }

  }
