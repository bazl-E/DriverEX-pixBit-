import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_manager.dart';
import 'styles_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primaryColor: ColorManager.primary,
    disabledColor: ColorManager.grey1,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getSemiBoldtStyle(
          color: ColorManager.white,
          fontSize: 14,
        ),
        primary: ColorManager.primary,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
      ),
    ),
    textTheme: TextTheme(
      headline1: getSemiBoldtStyle(
        color: ColorManager.black,
        fontSize: FontSize.s16,
      ),
      subtitle1: getMediumtStyle(
        color: ColorManager.lightGrey,
        fontSize: FontSize.s14,
      ),
      caption: getRegularStyle(
        color: ColorManager.grey1,
      ),
      bodyText1: getRegularStyle(
        color: ColorManager.grey,
      ),
    ),
  );
}
