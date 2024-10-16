import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Decoration? decoration;
  final EdgeInsetsGeometry? padding;
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final Color? color;
  const CustomContainer(
      {super.key,
      this.decoration,
      this.padding,
      required this.child,
      this.margin,
      this.width,
      this.height,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      padding: padding,
      margin: margin,
      height: height,
      width: width,
      child: child,
    );
  }
}
