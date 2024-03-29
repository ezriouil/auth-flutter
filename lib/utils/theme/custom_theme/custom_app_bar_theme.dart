import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_node_js/utils/constants/custom_colors.dart';

class CustomAppBarTheme {
  CustomAppBarTheme._();

  /// App Bar For Light Theme
  static AppBarTheme lightAppBarTheme = const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      scrolledUnderElevation: 0.0,
      backgroundColor: CustomColors.TRANSPARENT,
      surfaceTintColor: CustomColors.TRANSPARENT,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: CustomColors.WHITE,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: CustomColors.WHITE,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: CustomColors.WHITE
      ),
      iconTheme: IconThemeData(color: CustomColors.BLACK, size: 24),
      actionsIconTheme: IconThemeData(color: CustomColors.BLACK, size: 24),
      titleTextStyle: TextStyle(
          fontSize: 18.0, fontFamily: "Cal",
          fontWeight: FontWeight.w600,
          color: CustomColors.BLACK));

  /// App Bar For Dark Theme
  static AppBarTheme darkAppBarTheme = const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      scrolledUnderElevation: 0.0,
      backgroundColor: CustomColors.TRANSPARENT,
      surfaceTintColor: CustomColors.TRANSPARENT,
      iconTheme: IconThemeData(color: CustomColors.WHITE, size: 24),
      actionsIconTheme: IconThemeData(color: CustomColors.WHITE, size: 24),
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: CustomColors.BLACK,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: CustomColors.BLACK,
          systemNavigationBarIconBrightness: Brightness.light,
          systemNavigationBarDividerColor: CustomColors.BLACK
      ),
      titleTextStyle: TextStyle(
          fontSize: 18.0, fontFamily: "Cal",
          fontWeight: FontWeight.w600,
          color: CustomColors.WHITE));
}
