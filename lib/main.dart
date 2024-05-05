import 'dart:async';
import 'package:babelos_app/presentation/screen/onboarding/splash.dart';
import 'package:babelos_app/routes/routes.dart';
import 'package:babelos_app/theme/app_theme_style.dart';
import 'package:babelos_app/utils/app_strings.dart';
import 'package:babelos_app/utils/pallet.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'data/core/config.dart';
import 'data/services/navigation_service.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Pallet.bg,
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
  Config.appFlavor = Flavor.DEVELOPMENT;
  //setup dependency injector
  setupLocator();
  runZonedGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const MyApp());
  }, (dynamic error, dynamic stack) {
    if (kDebugMode) {
      print(error);
      print(stack);
    }
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: ScreenUtilInit(
        designSize: const Size(375, 832),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: getIt<NavigationService>().navigatorKey,
            scaffoldMessengerKey: getIt<NavigationService>().snackBarKey,
            title: AppStrings.appName,
            theme: BabThemeStyle.themeData(context),
            onGenerateRoute: AppRouter.generateRoute,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
