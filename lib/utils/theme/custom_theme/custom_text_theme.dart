import 'package:flutter/material.dart';
import 'package:flutter_node_js/utils/constants/custom_colors.dart';

class CustomTextTheme{
  CustomTextTheme._();

  /// Text For Light Theme
  static final TextTheme lightTextTheme = TextTheme(
    headlineSmall: const TextStyle().copyWith(fontSize: 18.0, fontWeight: FontWeight.w600, color: CustomColors.BLACK, fontFamily: "Cal"),
    headlineMedium: const TextStyle().copyWith(fontSize: 24.0, fontWeight: FontWeight.w600, color: CustomColors.BLACK, fontFamily: "Cal"),
    headlineLarge: const TextStyle().copyWith(fontSize: 32.0, fontWeight: FontWeight.bold, color: CustomColors.BLACK, fontFamily: "Cal"),

    titleSmall: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w400, color: CustomColors.BLACK, fontFamily: "Cal"),
    titleMedium: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w500, color: CustomColors.BLACK, fontFamily: "Cal"),
    titleLarge: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.bold, color: CustomColors.BLACK, fontFamily: "Cal"),

    bodySmall: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color: CustomColors.BLACK.withOpacity(0.5), fontFamily: "Cal"),
    bodyMedium: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color: CustomColors.BLACK, fontFamily: "Cal"),
    bodyLarge: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.bold, color: CustomColors.BLACK, fontFamily: "Cal"),
  );

  /// Text For Dark Theme
  static final TextTheme darkTextTheme = TextTheme(
    headlineSmall: const TextStyle().copyWith(fontSize: 18.0, fontWeight: FontWeight.w600, color: CustomColors.WHITE, fontFamily: "Cal"),
    headlineMedium: const TextStyle().copyWith(fontSize: 24.0, fontWeight: FontWeight.w600, color: CustomColors.WHITE, fontFamily: "Cal"),
    headlineLarge: const TextStyle().copyWith(fontSize: 32.0, fontWeight: FontWeight.bold, color: CustomColors.WHITE, fontFamily: "Cal"),

    titleSmall: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w400, color: CustomColors.WHITE, fontFamily: "Cal"),
    titleMedium: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w500, color: CustomColors.WHITE, fontFamily: "Cal"),
    titleLarge: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.bold, color: CustomColors.WHITE, fontFamily: "Cal"),

    bodySmall: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color: CustomColors.WHITE.withOpacity(0.5), fontFamily: "Cal"),
    bodyMedium: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.bold, color: CustomColors.WHITE, fontFamily: "Cal"),
    bodyLarge: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color: CustomColors.WHITE, fontFamily: "Cal"),
  );
}
