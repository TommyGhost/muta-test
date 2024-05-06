import 'package:babelos_app/utils/font_manager.dart';
import 'package:babelos_app/utils/pallet.dart';
import 'package:babelos_app/utils/style_manager.dart';
import 'package:babelos_app/utils/value_manager.dart';
import 'package:flutter/material.dart';

class BabThemeStyle {
  static ThemeData themeData(BuildContext context) {
    return ThemeData(
      indicatorColor: Colors.grey,
      focusColor: Pallet.primary,
      errorColor: Pallet.white,
      cardColor: Colors.black,
      canvasColor: Pallet.white,
      highlightColor: Pallet.green.withOpacity(0.1),
      hoverColor: Pallet.green,
      primaryColor: Pallet.primary,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Pallet.bg,
      backgroundColor: Colors.black,
      primaryColorLight: Pallet.white,
      primaryColorDark: Colors.black,
      disabledColor: Colors.black,
      splashColor: Pallet.green.withOpacity(0.2),
      cardTheme: CardTheme(
        color: Pallet.white,
        shadowColor: Pallet.primary.withOpacity(0.3),
        elevation: AppSize.s4,
      ),
      appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: AppSize.s4,
          backgroundColor: Pallet.white,
          titleTextStyle: getLightStyle(
            color: Colors.black,
            fontSize: FontSize.s12,
          )),
      buttonTheme: const ButtonThemeData(
          shape: StadiumBorder()),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getLightStyle(color: Pallet.white),
            backgroundColor: Pallet.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12))),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Pallet.white,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Pallet.bg, ),
      textTheme: TextTheme(
          displayLarge:
              getSemiBoldStyle(color: Colors.black, fontSize: FontSize.s16),
          titleMedium:
              getMediumStyle(color: Colors.black, fontSize: FontSize.s14),
          titleSmall:
              getMediumStyle(color: Pallet.primary, fontSize: FontSize.s14),
          bodySmall: getRegularStyle(color: Colors.grey),
          bodyLarge: getRegularStyle(color: Colors.grey)),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        hintStyle: getLightStyle(color: Colors.grey, fontSize: FontSize.s16),
        labelStyle: getLightStyle(color: Colors.black, fontSize: FontSize.s16),
        errorStyle: getLightStyle(color: Colors.red, fontSize: FontSize.s16),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: AppSize.s1_5),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: AppSize.s1_5),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Pallet.primary, width: AppSize.s1_5),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: AppSize.s1_5),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Pallet.primary, width: AppSize.s1_5),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
        ),
      ),
    );
  }
}
