import 'package:flutter/material.dart';



extension CustomTextTheme on TextTheme {
  TextStyle get h1 => TextStyle(
      fontSize: 32.0, fontWeight: FontWeight.w900, color: Color(0xffEEEEEE));

  TextStyle get h2 => TextStyle(
      fontSize: 24.0, fontWeight: FontWeight.w900, color: Color(0xffEEEEEE));

  TextStyle get h3 => TextStyle(
      fontSize: 20.0, fontWeight: FontWeight.w900, color: Color(0xffEEEEEE));

  TextStyle get h4 => TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.w500, color: Color(0xffEEEEEE));

  TextStyle get h5 => TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.w500, color: Color(0xffEEEEEE));

  TextStyle get h6 => TextStyle(
      fontSize: 12.0, fontWeight: FontWeight.w500, color: Color(0xffEEEEEE));

  TextStyle get pageTitle => TextStyle(
      fontSize: 16.0, fontWeight: FontWeight.w700, height: 20.0 / 16.0);

  TextStyle get body1Regular => TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.w400, color: Color(0xffEEEEEE));

  TextStyle get body1Medium => TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.w500, height: 18.0 / 14.0);

  TextStyle get body1Bold => TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.w700, height: 18.0 / 14.0);

  TextStyle get body1Black => TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.w900, height: 18.0 / 14.0);

  TextStyle get body2Regular => TextStyle(
      fontSize: 12.0, fontWeight: FontWeight.w400, height: 16.0 / 12.0);

  TextStyle get body2Medium => TextStyle(
      fontSize: 12.0, fontWeight: FontWeight.w500, height: 16.0 / 12.0);

  TextStyle get body2Bold => TextStyle(
      fontSize: 12.0, fontWeight: FontWeight.w700, height: 16.0 / 12.0);

  TextStyle get body2Italic => TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      height: 16.0 / 12.0,
      fontStyle: FontStyle.italic);

  TextStyle get body3Medium =>
      TextStyle(fontSize: 16.0, height: 16 / 14, fontWeight: FontWeight.w500);

  TextStyle get raceButtonStyle => TextStyle(
      fontFamily: 'Lilita One',
      fontSize: 10.0,
      height: 57 / 50,
      fontWeight: FontWeight.w400);
}