import 'package:e_commerce_app/config/theme.dart';
import 'package:flutter/material.dart';

Widget heading1(String txt, {TextStyle? customStyle}) {
  final TextStyle defaultStyle = TextStyle(
      color: Pallete.primary, fontSize: 40, fontWeight: FontWeight.bold);
  final TextStyle mergedStyle =
      customStyle != null ? defaultStyle.merge(customStyle) : defaultStyle;
  return Text(
    txt,
    style: mergedStyle,
  );
}

Widget heading2(String txt, {TextStyle? customStyle}) {
  final TextStyle defaultStyle = TextStyle(
      color: Pallete.primary, fontSize: 35, fontWeight: FontWeight.bold);
  final TextStyle mergedStyle =
      customStyle != null ? defaultStyle.merge(customStyle) : defaultStyle;
  return Text(
    txt,
    style: mergedStyle,
  );
}

Widget heading3(String txt, {TextStyle? customStyle}) {
  final TextStyle defaultStyle = TextStyle(
      color: Pallete.primary, fontSize: 22, fontWeight: FontWeight.bold);
  final TextStyle mergedStyle =
      customStyle != null ? defaultStyle.merge(customStyle) : defaultStyle;
  return Text(
    txt,
    style: mergedStyle,
  );
}

Widget body1(String txt, {TextStyle? customStyle, bool isCentered = false}) {
  final TextStyle defaultStyle = TextStyle(
    color: Pallete.textPrimary,
    fontSize: 18,
  );
  final TextStyle mergedStyle =
      customStyle != null ? defaultStyle.merge(customStyle) : defaultStyle;
  return Text(
    txt,
    textAlign: isCentered ? TextAlign.center: TextAlign.start,
    style: mergedStyle,
  );
}

Widget body2(String txt, {TextStyle? customStyle, bool isCentered = false}) {
  final TextStyle defaultStyle = TextStyle(
    color: Pallete.textPrimary,
    fontSize: 14,
  );
  final TextStyle mergedStyle =
      customStyle != null ? defaultStyle.merge(customStyle) : defaultStyle;
  return Text(
    txt,
     textAlign: isCentered ? TextAlign.center: TextAlign.start,
    style: mergedStyle,
  );
}

Widget caption(String txt, {TextStyle? customStyle}) {
  final TextStyle defaultStyle = TextStyle(
    color: Pallete.textPrimary,
    fontSize: 12,
  );
  final TextStyle mergedStyle =
      customStyle != null ? defaultStyle.merge(customStyle) : defaultStyle;
  return Text(
    txt,
    style: mergedStyle,
  );
}
