import 'package:babelos_app/domain/models/login_response.dart';
import 'package:babelos_app/presentation/base/base.vm.dart';
import 'package:flutter/material.dart';

class SignInViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  final emailReg =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  bool _isPasswordVisible = false;
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  late TextEditingController emails;

  bool get isPasswordVisible => _isPasswordVisible;
  AutovalidateMode get autovalidateMode => _autovalidateMode;

  setValidateMode(AutovalidateMode autovalidateMode) {
    _autovalidateMode = autovalidateMode;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  check() async {
    await login(
      emails.text.trim(),
      password.text.trim(),
    );
  }

  Future<LoginResponse?> login(
    String email,
    String password,
  ) async {
    try {
      startLoader();
      var response = await userRepository.login(
        email,
        password,
      );
      stopLoader();
      return response;
    } catch (error) {
      stopLoader();
    }
  }
}
