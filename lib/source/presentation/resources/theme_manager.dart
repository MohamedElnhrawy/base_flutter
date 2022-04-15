import 'package:base_flutter/source/presentation/resources/styles_manager.dart';
import 'package:base_flutter/source/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'color_manager.dart';
import 'fonts_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      fontFamily: FontConstants.fontFamily,

      // main color
      primaryColor: ColorManager.primaryColor,
      highlightColor: Colors.transparent,
      primaryColorLight: ColorManager.primaryColorLight,
      primaryColorDark: ColorManager.primaryColorDark,
      disabledColor: ColorManager.disableColor,
      // app bar theme

      // button theme
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.sz10)),
        disabledColor: ColorManager.disableColor,
        buttonColor: ColorManager.primaryColor,
        splashColor: ColorManager.primaryColorLight,
      ),
      // text theme
      textTheme: TextTheme(headline1: StylesManager.titleTextStyle)
      // input decoration theme
      );
}
