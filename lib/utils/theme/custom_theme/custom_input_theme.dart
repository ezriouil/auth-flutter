import 'package:flutter/material.dart';
import 'package:flutter_node_js/utils/constants/custom_colors.dart';

class CustomInputTheme {
  CustomInputTheme._();

  /// Text Field For Light Theme
  static InputDecorationTheme lightInputTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: CustomColors.GRAY_DARK,
    suffixIconColor: CustomColors.GRAY_DARK,
    labelStyle: const TextStyle().copyWith(fontSize: 8.0, color: CustomColors.GRAY_DARK, fontFamily: "Cal"),
    errorStyle: const TextStyle().copyWith(fontSize: 10,fontStyle: FontStyle.normal, color: CustomColors.PRIMARY_LIGHT, fontFamily: "Cal"),
    hintStyle: const TextStyle().copyWith(fontSize: 12.0, color: CustomColors.GRAY_LIGHT, fontFamily: "Cal"),
    floatingLabelStyle: const TextStyle().copyWith(color: CustomColors.BLACK.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: CustomColors.GRAY_DARK)),
    enabledBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: CustomColors.GRAY_DARK)),
    focusedBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(12.0),
        borderSide:  BorderSide(color: CustomColors.BLACK.withOpacity(0.8))),
    errorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: CustomColors.PRIMARY_DARK)),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(color: CustomColors.PRIMARY_DARK.withOpacity(0.5)),
    ),
  );

  /// Text Field For Dark Theme
  static InputDecorationTheme darkInputTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: CustomColors.GRAY_LIGHT,
    suffixIconColor: CustomColors.GRAY_LIGHT,
    labelStyle: const TextStyle().copyWith(fontSize: 8.0, color: CustomColors.GRAY_LIGHT, fontFamily: "Cal"),
    errorStyle: const TextStyle().copyWith(fontSize: 10, fontStyle: FontStyle.normal, color: CustomColors.PRIMARY_DARK, fontFamily: "Cal"),
    hintStyle: const TextStyle().copyWith(fontSize: 12.0, color: CustomColors.GRAY_DARK, fontFamily: "Cal"),
    floatingLabelStyle: const TextStyle().copyWith(color: CustomColors.BLACK.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: CustomColors.GRAY_DARK)),
    enabledBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: CustomColors.GRAY_DARK)),
    focusedBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: CustomColors.WHITE)),
    errorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: CustomColors.PRIMARY_LIGHT)),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: CustomColors.GRAY_LIGHT.withOpacity(0.5))),
  );
}
