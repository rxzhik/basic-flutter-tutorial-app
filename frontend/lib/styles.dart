// Since we need to use certian styles multiple times we'll create a class here
// for a particular set of styles. So this is kind of like a utility class.

import 'package:flutter/material.dart';

class Styles {
  // Utility Attributes
  static const _textSizeLarge = 25.0;
  static const _textSizeDefault = 16.0;
  static const horizontalPaddingDefault = 25.0;
  static final Color _textColorStrong = _hexToColor('000000');
  static final Color _textColorDefault = _hexToColor('666666');
  static final Color textColorBright = _hexToColor('FFFFFF');
  // I have donwloaded the font files and changed the pubspec.yaml file.
  static final _fontNameDefault = 'Montserrat';

  static final navBarTitle = TextStyle(
    fontFamily: _fontNameDefault,
    fontWeight: FontWeight.w900,
    fontSize: _textSizeDefault,
    color: _textColorDefault,
  );

  static final headerLarge = TextStyle(
    fontFamily: _fontNameDefault,
    fontWeight: FontWeight.w600,
    fontSize: 25.0,
    color: Colors.black,
  );

  static final textDefault = TextStyle(
    fontFamily: _fontNameDefault,
    fontWeight: FontWeight.w300,
    fontSize: _textSizeDefault,
    color: _textColorDefault,
  );

  static final textCTAButton = TextStyle(
    fontFamily: _fontNameDefault,
    fontSize: _textSizeLarge,
    color: textColorBright,
  );

  static final locationTileTitleLight = TextStyle(
    fontFamily: _fontNameDefault,
    fontWeight: FontWeight.w600,
    fontSize: _textSizeLarge,
    color: _textColorStrong,
  );

  static final locationTileTitleDark = TextStyle(
    fontFamily: _fontNameDefault,
    fontSize: _textSizeLarge,
    color: textColorBright,
  );

  // Utility Method
  static Color _hexToColor(String code) {
    return Color(int.parse(code.substring(0, 6), radix: 16) + 0xFF000000);
  }
}
