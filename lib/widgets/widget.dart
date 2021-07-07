import 'package:flutter/material.dart';
import 'package:flutter_challenge/constants/color_constant.dart';

TextStyle boldTextStyle(
    {int size = 18,
      Color textColor = textPrimaryColor,
      FontWeight textWeight = FontWeight.bold,
      double letterSpacing,
      double wordSpacing}) {
  return TextStyle(
      fontSize: size.toDouble(),
      color: textColor,
      fontWeight: textWeight,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing);
}

TextStyle secondaryTextStyle(
    {int size = 14, Color textColor = textSecondaryColor}) {
  return TextStyle(
    fontSize: size.toDouble(),
    color: textColor,
  );
}


