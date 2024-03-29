import 'package:flutter/material.dart';
import 'package:flutter_node_js/utils/constants/custom_colors.dart';

class CustomElevatedButtonTheme {
  CustomElevatedButtonTheme._();

  /// Elevated Button For Light Theme
  static ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shadowColor: CustomColors.PRIMARY_LIGHT,
              elevation: 4,
              backgroundColor: CustomColors.PRIMARY_DARK,
              foregroundColor: CustomColors.WHITE,
              disabledBackgroundColor: CustomColors.GRAY_DARK,
              disabledForegroundColor: CustomColors.GRAY_DARK,
              side: BorderSide(color: CustomColors.PRIMARY_DARK.withOpacity(0.8)),
              padding: const EdgeInsets.symmetric(vertical: 18),
              textStyle:
                  const TextStyle(
                      fontSize: 16,
                      color: Colors.white, fontFamily: "Cal",
                      fontWeight: FontWeight.w600),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))));

  /// Elevated Button For Dark Theme
  static ElevatedButtonThemeData darkElevatedButtonTheme =
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: 4,
              shadowColor: CustomColors.PRIMARY_DARK,
              backgroundColor: CustomColors.PRIMARY_LIGHT,
              foregroundColor: CustomColors.WHITE,
              disabledBackgroundColor: CustomColors.GRAY_LIGHT,
              disabledForegroundColor: CustomColors.GRAY_LIGHT,
              side: BorderSide(color: CustomColors.PRIMARY_LIGHT.withOpacity(0.8)),
              padding: const EdgeInsets.symmetric(vertical: 18),
              textStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.white, fontFamily: "Cal",
                  fontWeight: FontWeight.w600),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))));
}
