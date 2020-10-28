import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum Fonts { SFProDisplay }

class Palette {
  static const Color primary = Color(0xFF232323);
  static const Color secondary = Color(0xFF12213F);
  static const Color lightBlue = Color(0xFF619CF5);
  static const Color grey = Color(0xFF979797);
  static const Color background = Color(0xFFF8F8F8);

  static const List<Color> defaultGradient = [
    Color(0xFF6A62EE),
    Color(0xFF56EDFF),
  ];
}

TextStyle kRegularTextStyle =
    TextStyle(fontFamily: describeEnum(Fonts.SFProDisplay));

TextStyle kMediumTextStyle = TextStyle(
  fontFamily: describeEnum(Fonts.SFProDisplay),
  fontWeight: FontWeight.w500,
);

TextStyle kSemiBoldTextStyle = TextStyle(
  fontFamily: describeEnum(Fonts.SFProDisplay),
  fontWeight: FontWeight.w600,
);

TextStyle kDefaultTextStyle = kSemiBoldTextStyle.copyWith(
  fontSize: 14.0,
  color: Palette.primary.withOpacity(0.8),
);
