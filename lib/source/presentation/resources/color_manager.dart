import 'package:flutter/material.dart';

class ColorManager {
  static Color primaryColor = HexColor.fromHex('#02A6E1');
  static Color primaryColorLight = primaryColor.withOpacity(0.7);
  static Color primaryColorDark = primaryColor;
  static Color disableColor = HexColor.fromHex('#ADADAD');
  static Color Snow = HexColor.fromHex('#F1F4FD');
  static Color white = HexColor.fromHex('#FFFFFF');
  static Color black = HexColor.fromHex('#000000');
  static Color LightBlue = HexColor.fromHex('#1EA6E0');
  static const Color blue = Colors.blue;
  static Color red = Colors.red;
  static Color unselectedTabTextColor = HexColor.fromHex('#111719');
  static Color textTitleColor = HexColor.fromHex('#575757');
  static Color headerTextColor = HexColor.fromHex('#313131');
  static Color fieldHintColor = HexColor.fromHex('#777777');
  static Color grey40 = HexColor.fromHex('#999999');
  static Color lightBlue = HexColor.fromHex('#85A6BF');
  static Color lighGrey = HexColor.fromHex('#979797');
  static Color ordersBG = HexColor.fromHex('#E7E7E7');
  static Color DarkGrey = HexColor.fromHex('#000000B3');
  static Color blueBorder = HexColor.fromHex('#C9DDFF');
  static Color otpActive = HexColor.fromHex('#1EA6E0');
  static Color blueActive = HexColor.fromHex('#1EA6E0');
  static Color otpInActive = HexColor.fromHex('#D2D2D2');
  static Color otpHintColor = HexColor.fromHex('#242A2E');
  static Color divider = HexColor.fromHex('#C9C9C9');
  static Color green = HexColor.fromHex('#65B173');
  static Color textFieldTitle = HexColor.fromHex('#707070');
  static Color description = HexColor.fromHex('#9B9EA9');
  static Color calculationsHeader = HexColor.fromHex('##40434D');
  static const Color Liver = Color(0xff4B4B4B);
  static const Color ERRORS_RED = Color(0xffD50000);
  static const Color OFF_WHITE = Color(0xffF8F8F8);
  static const Color Platinum = Color(0xffe5e5e4);
  static const Color lightGrey = Color(0xffe5e5e4);
  static const Color transparent = Colors.transparent;
  static const Color outer_space = Color(0xff424242);
  static const Color Olive_Drab = Color(0xff6eb02f);
  static const Color DARK_SPRING_GREEN = Color(0xff007a40);

}

extension HexColor on Color {
  static Color fromHex(String hexColor) {
    hexColor = hexColor.replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return Color(int.parse(hexColor, radix: 16));
  }
}
