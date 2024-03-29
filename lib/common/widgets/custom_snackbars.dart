import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_node_js/utils/constants/custom_colors.dart';

class CustomSnackBars {
  CustomSnackBars._();

  // - - - - - - - - - - - - - - - - - - SUCCESS SNACK BAR - - - - - - - - - - - - - - - - - -  //
  static success(
      {required String title, required String message, int duration = 3}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: CustomColors.BLACK,
        backgroundColor: CustomColors.GREEN,
        duration: Duration(seconds: duration),
        margin: const EdgeInsets.all(8),
        overlayBlur: 1,
        icon: const Icon(
          Iconsax.check,
          color: CustomColors.BLACK,
        ));
  }

  // - - - - - - - - - - - - - - - - - - ERROR SNACK BAR - - - - - - - - - - - - - - - - - -  //
  static error(
      {required String title,
      required String message,
      int duration = 3,
      IconData? icon}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: CustomColors.WHITE,
        backgroundColor: CustomColors.RED_LIGHT,
        overlayBlur: 1,
        duration: Duration(seconds: duration),
        margin: const EdgeInsets.all(8),
        icon: Icon(icon ?? Icons.error_outline, color: CustomColors.WHITE));
  }

  // - - - - - - - - - - - - - - - - - - WARNING SNACK BAR - - - - - - - - - - - - - - - - - -  //
  static warning(
      {required String title, required String message, int duration = 3}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: CustomColors.BLACK,
        backgroundColor: CustomColors.RED_DARK,
        overlayBlur: 1,
        duration: Duration(seconds: duration),
        margin: const EdgeInsets.all(8),
        icon: const Icon(Iconsax.check, color: CustomColors.BLACK));
  }
}
