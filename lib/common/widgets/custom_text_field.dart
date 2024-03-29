import 'package:flutter/material.dart';
import 'package:flutter_node_js/utils/constants/custom_colors.dart';
import 'package:flutter_node_js/utils/responsive/responsive.dart';

class CustomTextField extends Responsive {
  final String hint;
  final bool obscureText, readOnly, autoFocus;
  final IconData? leadingIcon;
  final Widget? trailingIcon;
  final TextInputType textInputType;
  final TextEditingController controller;
  final String? Function(String? value)? validator;

  const CustomTextField(
      {super.key,
      required this.hint,
        this.validator,
      this.autoFocus = false,
      this.readOnly = false,
      this.obscureText = false,

      required this.controller,
      this.textInputType = TextInputType.text,
      this.trailingIcon,
      this.leadingIcon});

  @override
  Widget execute(BuildContext context) {
    return SizedBox(
      width:  getWidth(context),
      height:  validator != null ? 86 : 80,
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical:24),
            fillColor: CustomColors.TRANSPARENT,
            hintText: hint,
            prefixIcon: leadingIcon != null ? Icon(leadingIcon, color: grayColor(context)) : null,
            suffixIcon: trailingIcon,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(color: darkLightColor(context)))),
        minLines: 1,
        maxLines: 1,
        style: const TextStyle().copyWith(fontSize: 14.0, color: darkLightColor(context), fontFamily: "Cal", fontWeight: FontWeight.normal),
        autocorrect: false,
        autofocus: autoFocus,
        readOnly: readOnly,
        obscureText: obscureText,
        keyboardType: textInputType,
      ),
    );
  }
}
