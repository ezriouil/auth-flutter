import 'package:flutter/material.dart';
import 'package:flutter_node_js/utils/constants/custom_colors.dart';
import 'package:flutter_node_js/utils/device/device_utility.dart';

abstract class Responsive extends StatelessWidget {
  const Responsive({super.key});

  @override
  Widget build(BuildContext context) {
    isDark(context);
    darkLightColor(context);
    darkDarkLightLightColor(context);
    isMobile(context);
    isTablet(context);
    return execute(context);
  }

  /// BUILD METHODE
  Widget execute(BuildContext context);

  /// INFO
  double getWidth(BuildContext context) => DeviceUtility.getDeviceWidth(context);
  double getHeight(BuildContext context) => DeviceUtility.getDeviceHeight(context);

  bool isDark(BuildContext context) => DeviceUtility.isDark(context);

  Color darkLightColor(BuildContext context) => isDark(context) ? CustomColors.WHITE : CustomColors.BLACK;
  Color darkDarkLightLightColor(BuildContext context) => isDark(context) ? CustomColors.BLACK : CustomColors.WHITE;
  Color primaryColor(BuildContext context) => isDark(context) ? CustomColors.PRIMARY_DARK : CustomColors.PRIMARY_LIGHT;
  Color grayColor(BuildContext context) => isDark(context) ? CustomColors.GRAY_DARK : CustomColors.GRAY_LIGHT;

  bool isTablet(BuildContext context) => getWidth(context) >= 650 && getWidth(context) < 1100;
  bool isMobile(BuildContext context) => getWidth(context) < 650;

}
