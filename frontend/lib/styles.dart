// Since we need to use certian styles multiple times we'll create a class here
// for a particular set of styles. So this is kind of like a utility class.

import 'package:flutter/material.dart';

class Styles {
  // Utility Attributes
  static const _textSizeLarge = 25.0;
  static const _textSizeDefault = 16.0;
  static final Color _textColorStrong = _hexToColor('000000');
  static final Color _textColorDefault = _hexToColor('666666');
  // I have donwloaded the font files and changed the pubspec.yaml file.
  static final _fontNameDefault = 'CustomFont';

  static final headerLarge = TextStyle(
    fontFamily: _fontNameDefault,
    fontSize: 25.0,
    color: Colors.black,
  );

  static final textDefault = TextStyle(
    fontFamily: _fontNameDefault,
    fontSize: _textSizeDefault,
    color: _textColorDefault,
  );

  // Utility Method
  static Color _hexToColor(String code) {
    return Color(int.parse(code.substring(0, 6), radix: 16) + 0xFF000000);
  }
}
