import 'package:babelos_app/presentation/base/base_ui.dart';
import 'package:babelos_app/routes/routes.dart';
import 'package:babelos_app/utils/__utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    next();
  }

  void next() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(seconds: 3));

      navigationService.navigateToReplace(AppRoutes.intro);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Image.asset(
            AppImages.appSplashLogo,
            width: 112.0.w,
            height: 112.0.h,
          ),
        ),
      ),
    );
  }
}
