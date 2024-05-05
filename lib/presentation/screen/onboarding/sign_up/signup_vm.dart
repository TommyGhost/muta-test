import 'package:babelos_app/domain/models/registration_response.dart';
import 'package:babelos_app/presentation/base/base.vm.dart';
import 'package:flutter/material.dart';

class SignUpViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  final emailReg =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  TextEditingController password = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  late TextEditingController emails;

  AutovalidateMode get autovalidateMode => _autovalidateMode;

  setValidateMode(AutovalidateMode autovalidateMode) {
    _autovalidateMode = autovalidateMode;
    notifyListeners();
  }

  check(String lang) async {
    await regAcc(
      emails.text.trim(),
      firstName.text.trim(),
      lastName.text.trim(),
      lang,
      password.text.trim(),
      'password',
      'learner',
    );
  }

  Future<RegistrationResponse?> regAcc(
      String email,
      String firstname,
      String lastname,
      String spokenLanguage,
      String password,
      String signinType,
      String userType) async {
    try {
      startLoader();
      var response = await userRepository.regAcc(email, firstname, lastname,
          spokenLanguage, password, signinType, userType);
      stopLoader();
      return response;
    } catch (error) {
      stopLoader();
    }
  }
}
