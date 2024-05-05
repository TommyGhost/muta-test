import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefs;

class SharedPreference extends ChangeNotifier {
  final String onBoardingCompletedKey = 'onBoardingCompleted';
  static const String loggedIn = 'isLoggedIn';
  static const String userSetPinKey = 'userSetPin';
  static const String userInfoKey = 'userInfoKey';
  final String tokenKey = 'token';
  final String languageKey = 'language';
  final String levelKey = 'level';
}