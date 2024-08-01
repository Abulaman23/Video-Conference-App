import 'package:flutter/material.dart';
import 'package:video_conference_app/utils/colors.dart';

class AppElevatedButtonTheme {
  AppElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      foregroundColor: Colors.white,
      backgroundColor: secondary,
      side: const BorderSide(color: secondary),
      padding: const EdgeInsets.symmetric(vertical: 15),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      foregroundColor: secondary,
      backgroundColor: Colors.white,
      side: const BorderSide(color: Colors.white),
      padding: const EdgeInsets.symmetric(vertical: 15),
    ),
  );
}
