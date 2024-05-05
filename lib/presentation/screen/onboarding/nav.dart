import 'dart:async';
import 'package:babelos_app/locator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/services/navigation_service.dart';
import '../../../routes/routes.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  NavigationService navigationService = getIt<NavigationService>();
  @override
  void initState() {
    super.initState();
    use();
  }

  use() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String firstName = "${prefs.getString('firstname')}";
    print(firstName);
    Timer(const Duration(seconds: 0), () {
      if (firstName != "null") {
        navigationService.navigateToReplace(AppRoutes.signIn);
      } else {
        navigationService.navigateToReplace(AppRoutes.intro);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
