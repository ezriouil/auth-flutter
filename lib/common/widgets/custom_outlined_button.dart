import 'package:flutter/material.dart';

import '../../utils/constants/custom_sizes.dart';
import '../../utils/responsive/responsive.dart';

class CustomOutlinedButton extends Responsive {
  final String text;
  final GestureTapCallback onClick;
  final double? width, height;
  final bool withDefaultPadding;

  const CustomOutlinedButton(
      {super.key,
      required this.text,
      required this.onClick,
        this.width,
       this.height,
      this.withDefaultPadding = true});

  @override
  Widget execute(BuildContext context) {
    return SizedBox(
      height: height ?? 70,
        width: width ?? getWidth(context),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal:
                  withDefaultPadding ? CustomSizes.SPACE_BETWEEN_ITEMS / 2 : 0,
              vertical: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
          child: OutlinedButton(
            onPressed: () => onClick(),
            style: OutlinedButton.styleFrom().copyWith(
                side: MaterialStateProperty.all(BorderSide(color : darkLightColor(context)))),
            child: Text(text),
          ),
        ));
  }
}
