// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Decoration? decoration;
  final Decoration? foregroundDecoration;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? margin;
  final Matrix4? transform;
  final AlignmentGeometry? transformAlignment;
  final Widget? child;

  const CustomContainer(
      {super.key,
      this.alignment,
      this.padding,
      this.color,
      this.decoration,
      this.foregroundDecoration,
      this.width,
      this.height,
      this.constraints,
      this.margin,
      this.transform,
      this.transformAlignment,
      this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      color: color,
      constraints: constraints,
      decoration: decoration,
      foregroundDecoration: foregroundDecoration,
      height: height,
      margin: margin,
      padding: padding,
      transform: transform,
      width: width,
      transformAlignment: transformAlignment,
      child: child,
    );
  }
}
