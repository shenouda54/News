import 'package:flutter/material.dart';
import 'package:news/app_colors.dart';

class MyThemeData {
  static final ThemeData LightTheme = ThemeData(
    primaryColor: AppColor.primaryLightColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.primaryLightColor,
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: AppColor.whiteColor,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColor.blackColor,
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColor.blackColor,
      ),
    ),
  );
}
