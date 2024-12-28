import 'package:flutter/material.dart';

class AppColor {
  static const primary = Color(0xFF003B73);
  static const secondery = Color(0xFF010E16);
  static const lightBackground = Color(0xFFF5F5F5);
  static const darkBackground = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF003B73),
      Color(0xFF0074B7),
      Color(0xFF60A3D9),
    ],
  );
  static const grey = Color(0xFFBDBDBD);
  static const royalBlue = Color(0xFF0074B7);
  static const blueGrotto = Color(0xFF60A3D9);
  static const navy = Color(0xFF003B73);

  static var secondaryColor;
}
