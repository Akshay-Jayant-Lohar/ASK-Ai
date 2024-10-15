import 'package:flutter/material.dart';

class CustomPadding extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final Widget? child;
  const CustomPadding({super.key, required this.padding, this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: child,
    );
  }
}
