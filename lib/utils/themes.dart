import 'package:flutter/material.dart';
import 'package:video_conference_app/utils/colors.dart';
import 'package:video_conference_app/utils/elevated_button_theme.dart';
import 'package:video_conference_app/utils/outline_button_theme.dart';
import 'package:video_conference_app/utils/text_theme.dart';

class AppTextFormFieldTheme {
  AppTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme =
      const InputDecorationTheme(
    border: OutlineInputBorder(),
    prefixIconColor: secondary,
    suffixIconColor: secondary,
    floatingLabelStyle: TextStyle(color: secondary),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: secondary),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme =
      const InputDecorationTheme(
    border: OutlineInputBorder(),
    prefixIconColor: primaryColor,
    suffixIconColor: primaryColor,
    floatingLabelStyle: TextStyle(color: primaryColor),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: primaryColor),
    ),
  );
}

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: AppTextTheme.lightTextTheme,
    outlinedButtonTheme: AppOutlineButtonTheme.lightOutlineButtonTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: AppTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: AppTextTheme.darkTextTheme,
    outlinedButtonTheme: AppOutlineButtonTheme.darkOutlineButtonTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: AppTextFormFieldTheme.darkInputDecorationTheme,
  );
}
