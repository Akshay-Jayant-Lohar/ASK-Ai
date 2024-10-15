import 'package:flutter/material.dart';

class CustomAnimtaedContainer extends StatelessWidget {
  final Duration duration;
  final double? height;
  final double? width;
  final Widget child;
  const CustomAnimtaedContainer(
      {super.key, required this.duration, this.height, this.width, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: duration,
      padding: const EdgeInsets.only(left: 20),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.black, width: 1.5),
      ),
      child: child,
    );
  }
}
