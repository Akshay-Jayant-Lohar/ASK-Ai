import 'package:flutter/material.dart';

class CustomChatContainer extends StatelessWidget {
  final BoxConstraints? constraints;
  final Decoration? decoration;
  final EdgeInsetsGeometry? padding;
  final Widget child;
  const CustomChatContainer(
      {super.key, this.constraints, this.decoration, this.padding, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: constraints,
      decoration: decoration,
      padding: padding,
      child: child,
    );
  }
}
