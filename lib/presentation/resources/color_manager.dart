import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor("#ED9728");
  static Color darkGrey = HexColor("#525252");
  static Color grey = HexColor("#737477");
  static Color lightGrey = HexColor("#9E9E9E");
  static Color primaryOpacity70 = HexColor("#B3ED9728");

  // new colors
  static Color darkPrimary = HexColor("#d17d11");
  static Color grey1 = HexColor("#707070");
  static Color grey2 = HexColor("#797979");
  static Color white = HexColor("#FFFFFF");
  static Color error = HexColor("#e61f34");
  static Color black = HexColor("#000000"); 
}

class HexColor extends Color {

  static int _fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString";
    }
    return int.parse(hexColorString, radix: 16);
  }
  
  HexColor(final String color) : super(_fromHex(color));
  
}