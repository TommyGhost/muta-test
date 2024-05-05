import 'package:babelos_app/presentation/screen/onboarding/__onboarding.dart';
import 'package:babelos_app/presentation/screen/onboarding/intro_screen/lang_select/language_selection_ui.dart';
import 'package:babelos_app/presentation/screen/onboarding/intro_screen/lang_learn_choice/want_learn_screen.dart';
import 'package:babelos_app/presentation/screen/onboarding/intro_screen/rate_prof/rate_profiency_ui.dart';
import 'package:babelos_app/presentation/screen/onboarding/sign_in/sign_in_details.dart';
import 'package:babelos_app/presentation/screen/onboarding/sign_up/sign_up_dets_ui.dart';
import 'package:flutter/material.dart';
import '../presentation/screen/bottom_nav/bottom_nav.ui.dart';

class AppRoutes {
  static const bottomNav = '/bottomNav';
  static const home = '/home';
  static const signIn = '/signIn';
  static const signUp = '/signUp';
  static const signUpDets = '/signUpDets';
  static const signInDets = '/signInDets';
  static const nav = '/nav';
  static const intro = '/intro';
  static const langSel = '/langSel';
  static const wantLearn = '/wantLearn';
  static const rateProf = '/rateProf';
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // E.g Navigator.of(context).pushNamed(AppRoutes.theScreenYouAreGoingTo);
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const Scaffold(),
          settings: settings,
        );
      case AppRoutes.nav:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const Nav(),
          settings: settings,
        );
      case AppRoutes.bottomNav:
        // final BottomNavArgs details = settings.arguments as BottomNavArgs;
        final index = settings.arguments as int;
        return MaterialPageRoute<dynamic>(
          builder: (_) => BottomNav(selectedIndex: index),
          settings: settings,
        );

      case AppRoutes.intro:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const IntroScreen(),
          settings: settings,
        );

      case AppRoutes.signUp:
        return MaterialPageRoute<dynamic>(
          builder: (_) => SignUp(),
          settings: settings,
        );

      case AppRoutes.signUpDets:
        final email = settings.arguments as String;
        return MaterialPageRoute<dynamic>(
          builder: (_) => SignUpDetails(email: email),
          settings: settings,
        );

      case AppRoutes.signIn:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const SignIn(),
          settings: settings,
        );

      case AppRoutes.signInDets:
        final email = settings.arguments as String;
        return MaterialPageRoute<dynamic>(
          builder: (_) => SignInDetails(email: email),
          settings: settings,
        );

      case AppRoutes.rateProf:
        final lang = settings.arguments as String;
        return MaterialPageRoute<dynamic>(
          builder: (_) => RateProficiency(language: lang),
          settings: settings,
        );

      // case AppRoutes.transDetails:
      //   final Map<String, dynamic> details =
      //       settings.arguments as Map<String, dynamic>;
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => TransactionDetails(
      //       amount: details['amount'],
      //       fee: details['fee'],
      //       transactionType: details['transactionType'],
      //       transactionNumber: details['transactionNumber'],
      //       cardNumber: details['cardNumber'],
      //       cardType: details['cardType'],
      //       time: details['time'],
      //       narration: details['narration'],
      //     ),
      //     settings: settings,
      //   );

      case AppRoutes.langSel:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const LangSelection(),
          settings: settings,
        );

      case AppRoutes.wantLearn:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const WantLearn(),
          settings: settings,
        );

      // case AppRoutes.signUpDets:
      //   final email = settings.arguments as String;
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => const (),
      //     settings: settings,
      //   );
      //
      // case AppRoutes.:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => const (),
      //     settings: settings,
      //   );

      //  case AppRoutes.:
      // return MaterialPageRoute<dynamic>(
      //   builder: (_) => const (),
      //   settings: settings,
      // );

      // case AppRoutes.:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => const (),
      //     settings: settings,
      //   );
      //
      // case AppRoutes.:
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => const (),
      //     settings: settings,
      //   );

      //  case AppRoutes.:
      // return MaterialPageRoute<dynamic>(
      //   builder: (_) => const (),
      //   settings: settings,
      // );

      default:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const Scaffold(),
          settings: settings,
        );
    }
  }
}
