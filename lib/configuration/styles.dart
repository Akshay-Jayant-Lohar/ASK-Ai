import 'package:ask/core/constants/color_resource.dart';
import 'package:flutter/material.dart';

class Styles {
  static TextStyle textStyle(double size, Color? color,  FontWeight? fontWeight) {
    return TextStyle(
      fontFamily: 'Georama',
      fontSize: size,
      color: color,
      fontWeight: fontWeight
    );
  }

  static BoxBorder customBorder(Color color, double width) {
    return Border.all(color: AppColor.blackColor, width: width);
  }

  static BorderRadiusGeometry customBorderRadius(double radius) {
    return BorderRadius.circular(radius);
  }

  static Radius customRadius(double size) {
    return Radius.circular(size);
  }

  static RoundedRectangleBorder customRoundedRectangleBorder(double size) {
    return RoundedRectangleBorder(
      borderRadius: Styles.customBorderRadius(size),
    );
  }

  static BoxDecoration customBoxDecoration(
    Color color,
    BorderRadiusGeometry? borderRadius,
    // BoxBorder border,
    // EdgeInsetsGeometry? padding,
  ) {
    return BoxDecoration(
      color: color,
      borderRadius: borderRadius,
      // border: border,
    );
  }
}
