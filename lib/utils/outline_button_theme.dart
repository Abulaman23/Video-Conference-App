import 'package:flutter/material.dart';
import 'package:video_conference_app/utils/colors.dart';

class AppOutlineButtonTheme {
  AppOutlineButtonTheme._();

  static final lightOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      foregroundColor: secondary,
      side: const BorderSide(color: secondary),
      padding: const EdgeInsets.symmetric(vertical: 15),
    ),
  );

  static final darkOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      foregroundColor: Colors.white,
      side: const BorderSide(color: Colors.white),
      padding: const EdgeInsets.symmetric(vertical: 15),
    ),
  );
}
