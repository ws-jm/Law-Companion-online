import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color gray600 = fromHex('#7a7a7a');

  static Color gray601 = fromHex('#6e6e6e');

  static Color black9000a = fromHex('#0a000000');

  static Color gray500 = fromHex('#999999');

  static Color blue700 = fromHex('#036be8');

  static Color gray800 = fromHex('#3b3b3b');

  static Color whiteA7000a = fromHex('#0affffff');

  static Color gray900 = fromHex('#1a1a24');

  static Color gray200 = fromHex('#f0f0f0');

  static Color gray300 = fromHex('#e0e0e0');

  static Color gray201 = fromHex('#e8e8e8');

  static Color gray50 = fromHex('#fafafa');

  static Color gray100 = fromHex('#f5f5f5');

  static Color black900 = fromHex('#0f0f0f');

  static Color blue7000a = fromHex('#0a036be8');

  static Color black901 = fromHex('#000000');

  static Color whiteA700 = fromHex('#ffffff');



  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
