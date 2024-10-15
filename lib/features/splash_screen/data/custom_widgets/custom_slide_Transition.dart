import 'package:flutter/material.dart';

class CustomSlideTransition extends StatefulWidget {
  final Animation<Offset> position;
  final TextDirection? textDirection;
  final Widget? child;
  const CustomSlideTransition({super.key, required this.position, this.textDirection, this.child});
  @override
  State<CustomSlideTransition> createState() => _CustomSlideTransitionState();
}

class _CustomSlideTransitionState extends State<CustomSlideTransition> {
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: widget.position,
      textDirection: widget.textDirection,
      child: widget.child,
    );
  }
}
