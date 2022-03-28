import 'package:flutter/cupertino.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, Color color, FontWeight fontWeight) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
  );
}

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
    fontSize,
    color,
    FontWeightManager.regular,
  );
}

TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
    fontSize,
    color,
    FontWeightManager.light,
  );
}

TextStyle getMediumtStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
    fontSize,
    color,
    FontWeightManager.medium,
  );
}

TextStyle getSemiBoldtStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
    fontSize,
    color,
    FontWeightManager.semiBold,
  );
}

TextStyle getBoldtStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
    fontSize,
    color,
    FontWeightManager.bold,
  );
}
