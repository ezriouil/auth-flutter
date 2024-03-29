import 'package:flutter/material.dart';
import 'package:flutter_node_js/utils/constants/custom_colors.dart';

class CustomOutlinedButtonTheme {
  CustomOutlinedButtonTheme._();

  /// Outlined Button Light Theme
  static final OutlinedButtonThemeData lightOutlinedButtonTheme =
      OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              foregroundColor: CustomColors.BLACK,
              elevation: 0,
              side: const BorderSide(color: CustomColors.BLACK),
              textStyle: const TextStyle(
                  fontSize: 16.0,
                  color: CustomColors.BLACK,
                  fontFamily: "Cal",
                  fontWeight: FontWeight.w600),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16))));

  /// Outlined Button Dark Theme
  static final OutlinedButtonThemeData darkOutlinedButtonTheme =
      OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              elevation: 0,
              foregroundColor: CustomColors.WHITE,
              side: const BorderSide(color: CustomColors.WHITE),
              textStyle: const TextStyle(
                  fontSize: 16.0,
                  color: CustomColors.WHITE,
                  fontFamily: "Cal",
                  fontWeight: FontWeight.w600),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16))));
}
