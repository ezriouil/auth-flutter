import 'package:flutter/material.dart';
import 'package:flutter_node_js/utils/responsive/responsive.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

class CustomOTPCode extends Responsive {
  final Function(String) onSubmit;
  const CustomOTPCode({super.key, required this.onSubmit});

  @override
  Widget execute(BuildContext context) {
    return OtpPinField(
        textInputAction: TextInputAction.none,
        otpPinFieldStyle: OtpPinFieldStyle(
          textStyle: TextStyle(color: darkLightColor(context), fontWeight: FontWeight.bold, backgroundColor: darkDarkLightLightColor(context)),
          activeFieldBorderColor: darkLightColor(context),
          defaultFieldBorderColor: darkLightColor(context),
        ),
        onSubmit: onSubmit,
        onChange: (text) {},
        maxLength: 4,
        showCursor: true,
        cursorColor: darkLightColor(context),
        showDefaultKeyboard: true,
        mainAxisAlignment: MainAxisAlignment.center,
        otpPinFieldDecoration: OtpPinFieldDecoration.defaultPinBoxDecoration);
  }
}