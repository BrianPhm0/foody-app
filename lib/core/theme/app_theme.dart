import 'package:flutter/material.dart';
import 'package:foody/core/theme/app_color.dart';

class FoodAppTheme {
  static final lightTheme = ThemeData(
    primaryColor: AppColor.primary,
    scaffoldBackgroundColor: AppColor.lightBackground,
    iconTheme: const IconThemeData(color: AppColor.secondery),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.lightBackground,
      elevation: 0,
    ),
    brightness: Brightness.light,
    fontFamily: 'trebuc',
    // textTheme: const TextTheme(
    //   displayLarge: TextStyle(
    //       fontSize: 72.0, fontWeight: FontWeight.bold, color: Colors.black),
    //   titleLarge: TextStyle(
    //       fontSize: 36.0, fontStyle: FontStyle.italic, color: Colors.black),
    //   bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    // ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primary,
          textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    ),
  );

  static final darkTheme = ThemeData(
    primaryColor: AppColor.primary,
    scaffoldBackgroundColor: AppColor.royalBlue,
    brightness: Brightness.light,
    fontFamily: 'trebuc',
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 72.0, fontWeight: FontWeight.bold, color: Colors.white),
      titleLarge: TextStyle(
          fontSize: 36.0, fontStyle: FontStyle.italic, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primary,
          textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    ),
  );
}
