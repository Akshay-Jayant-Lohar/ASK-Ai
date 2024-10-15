import 'package:flutter/material.dart';

class CustomSize {
  static double hSize(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double wSize(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static MediaQueryData size(BuildContext context) {
    return MediaQuery.of(context);
  }
}
