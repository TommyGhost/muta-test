import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, String fontFamily,
    FontWeight fontWeight, Color? color, double? height) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color,
      height: height);
}

TextStyle getLightStyle(
    // TODO: add const color for all, you can easily add scalling for fonts here too on the fontSize
    {double fontSize = FontSize.s12,
    Color? color,
    double? height, String? fontFamily}) {
  return _getTextStyle(fontSize, FontConstants.fontFamily,
      FontWeightManager.light, color, height);
}

TextStyle getRegularStyle(
    {double fontSize = FontSize.s14, Color? color, double? height}) {
  return _getTextStyle(fontSize.sp, FontConstants.fontFamily,
      FontWeightManager.regular, color, height);
}

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, Color? color, double? height}) {
  return _getTextStyle(fontSize.sp, FontConstants.fontFamily,
      FontWeightManager.medium, color, height);
}

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, Color? color, double? height}) {
  return _getTextStyle(fontSize.sp, FontConstants.fontFamily,
      FontWeightManager.semiBold, color, height);
}

TextStyle getBoldStyle(
    {double fontSize = FontSize.s12, Color? color, double? height}) {
  return _getTextStyle(fontSize.sp, FontConstants.fontFamily,
      FontWeightManager.bold, color, height);
}

TextStyle getExtraBoldStyle(
    {double fontSize = FontSize.s12, Color? color, double? height}) {
  return _getTextStyle(fontSize.sp, FontConstants.fontFamily,
      FontWeightManager.extraBold, color, height);
}

TextStyle getThickStyle(
    {double fontSize = FontSize.s12, Color? color, double? height}) {
  return _getTextStyle(fontSize.sp, FontConstants.fontFamily,
      FontWeightManager.thick, color, height);
}
