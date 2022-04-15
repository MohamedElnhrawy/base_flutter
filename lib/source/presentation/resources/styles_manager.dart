import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'fonts_manager.dart';
import 'values_manager.dart';

class StylesManager {
  static TextStyle titleTextStyle = TextStyle(
    fontSize: FontSize.font36,
    color: ColorManager.textTitleColor,
    fontWeight: FontWeightManager.bold,
    decoration: TextDecoration.none,
  );
  static TextStyle appBarTitleTextStyle = TextStyle(
    fontSize: FontSize.font18,
    color: ColorManager.textTitleColor,
    fontWeight: FontWeightManager.bold,
    decoration: TextDecoration.none,
  );
  static TextStyle whiteHeaderTextStyle = TextStyle(
    fontSize: FontSize.font20,
    color: ColorManager.white,
    fontWeight: FontWeightManager.bold,
  );
  static TextStyle whiteDescriptionTextStyle = TextStyle(
    fontSize: FontSize.font18,
    color: ColorManager.white,
    fontWeight: FontWeightManager.normal,
  );

  static TextStyle buttonTextStyle = TextStyle(
    color: ColorManager.white,
    fontWeight: FontWeightManager.bold,
    fontSize: FontSize.font18,
  );

  static TextStyle whiteTextStyle16 = TextStyle(
    fontSize: FontSize.font16,
    color: ColorManager.white,
    fontWeight: FontWeightManager.normal,
  );

  static TextStyle normalTextStyleGrey16 = TextStyle(
    fontSize: FontSize.font16,
    fontWeight: FontWeightManager.normal,
    color: ColorManager.lighGrey,
  );

  static TextStyle normalTextStyleBlue16 = TextStyle(
    fontSize: FontSize.font16,
    fontWeight: FontWeightManager.normal,
    color: ColorManager.lightBlue,
  );

  static TextStyle errorStyle14 = TextStyle(
    fontSize: FontSize.font14,
    fontWeight: FontWeightManager.light,
    color: ColorManager.red,
  );

  static TextStyle smallStyle10 = TextStyle(
    fontSize: 10,
    fontWeight: FontWeightManager.bold,
    color: ColorManager.lighGrey,
  );

  static TextStyle smallStyle12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeightManager.bold,
    color: ColorManager.lighGrey,
  );

  static TextStyle normalTextStyleGrey = TextStyle(
    fontSize: FontSize.font14,
    fontWeight: FontWeightManager.normal,
    color: ColorManager.lighGrey,
  );

  static TextStyle normalTextStyleBlack = TextStyle(
    fontSize: FontSize.font14,
    fontWeight: FontWeightManager.normal,
    color: ColorManager.black,
  );

  static TextStyle normalTextStyleBlue = TextStyle(
    fontSize: FontSize.font14,
    fontWeight: FontWeightManager.normal,
    color: ColorManager.lightBlue,
  );
}

class ButtonsManager {
  static MaterialButton materialButton(String text, VoidCallback? onPress) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(vertical: AppPadding.p20),
      minWidth: double.maxFinite, // set minWidth to maxFinite
      color: ColorManager.primaryColor,
      disabledColor: ColorManager.disableColor,
      onPressed: onPress,
      child: Text(
        text,
        style: StylesManager.buttonTextStyle,
      ),
    );
  }
}
