import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  final ImageProvider? backgroundImage;
  final Widget? child;
  final Color? backgroundColor;
  final ImageProvider? foregroundImage;
  final Color? foregroundColor;
  final double? radius;
  final double? minRadius;
  final double? maxRadius;
  const CustomCircleAvatar(
      {super.key,
      this.backgroundImage,
      this.child,
      this.backgroundColor,
      this.foregroundImage,
      this.foregroundColor,
      this.radius,
      this.minRadius,
      this.maxRadius});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: backgroundImage,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      foregroundImage: foregroundImage,
      maxRadius: maxRadius,
      minRadius: minRadius,
      radius: radius,
      child: child,
    );
  }
}
