import 'package:flutter/cupertino.dart';

class ColorManager {
  static Color primary = Color.fromARGB(255, 255, 60, 0);
  static Color grey = HexColor.fromHex("#737477");
  static Color lightGrey = HexColor.fromHex("#9E9E9E");
  static Color grey1 = Color.fromARGB(255, 185, 184, 184);
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color error = HexColor.fromHex("#e61f34");
  static Color black = HexColor.fromHex("#000000"); // red color
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = 'FF' + hexColorString; //8 char with opacity 100

    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
