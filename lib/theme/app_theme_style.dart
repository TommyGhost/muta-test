import 'package:babelos_app/utils/font_manager.dart';
import 'package:babelos_app/utils/pallet.dart';
import 'package:babelos_app/utils/style_manager.dart';
import 'package:babelos_app/utils/value_manager.dart';
import 'package:flutter/material.dart';

class BabThemeStyle {
  static ThemeData themeData(BuildContext context) {
    return ThemeData(
      indicatorColor: Pallet.grey,
      dialogBackgroundColor: Pallet.grey.withOpacity(0.3),
      focusColor: Pallet.border1,
      errorColor: Pallet.white,
      cardColor: Pallet.black,
      canvasColor: Pallet.white,
      highlightColor: Pallet.green.withOpacity(0.1),
      hoverColor: Pallet.green,
      dividerColor: Pallet.borderLight,
      primaryColor: Pallet.primary,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Pallet.bg,
      backgroundColor: Pallet.black,
      primaryColorLight: Pallet.white,
      primaryColorDark: Pallet.black,
      disabledColor: Pallet.black,
      splashColor: Pallet.green.withOpacity(0.2),
      cardTheme: CardTheme(
        color: Pallet.white,
        shadowColor: Pallet.primary.withOpacity(0.3),
        elevation: AppSize.s4,
      ),
      appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: AppSize.s4,
          shadowColor: Pallet.shadowGreen,
          backgroundColor: Pallet.white,
          titleTextStyle: getLightStyle(
            color: Pallet.black,
            fontSize: FontSize.s12,
          )),
      buttonTheme: const ButtonThemeData(
          shape: StadiumBorder(), disabledColor: Pallet.grey1),
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
          backgroundColor: Pallet.bg, unselectedItemColor: Pallet.lightBlue),
      textTheme: TextTheme(
          displayLarge:
              getSemiBoldStyle(color: Pallet.black, fontSize: FontSize.s16),
          titleMedium:
              getMediumStyle(color: Pallet.black, fontSize: FontSize.s14),
          titleSmall:
              getMediumStyle(color: Pallet.primary, fontSize: FontSize.s14),
          bodySmall: getRegularStyle(color: Pallet.grey1),
          bodyLarge: getRegularStyle(color: Pallet.grey)),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        hintStyle: getLightStyle(color: Pallet.grey1, fontSize: FontSize.s16),
        labelStyle: getLightStyle(color: Pallet.black, fontSize: FontSize.s16),
        errorStyle: getLightStyle(color: Pallet.error, fontSize: FontSize.s16),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Pallet.grey, width: AppSize.s1_5),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Pallet.grey, width: AppSize.s1_5),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Pallet.primary, width: AppSize.s1_5),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Pallet.error, width: AppSize.s1_5),
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
