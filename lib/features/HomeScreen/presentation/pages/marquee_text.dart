import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

import '../../../../configuration/styles.dart';

class MarrqueeText extends StatefulWidget {
  final String text;
  const MarrqueeText({super.key, required this.text});

  @override
  State<MarrqueeText> createState() => MarrqueeTextState();
}

class MarrqueeTextState extends State<MarrqueeText> {
  @override
  Widget build(BuildContext context) {
    return Marquee(
      text: widget.text,
      style: Styles.textStyle(17, Colors.black, FontWeight.bold),
      scrollAxis: Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.start,
      blankSpace: 50,
      velocity: 100.0,
      pauseAfterRound: const Duration(seconds: 1),
      startPadding: 10,
      accelerationDuration: const Duration(seconds: 1),
      accelerationCurve: Curves.linear,
      decelerationDuration: const Duration(milliseconds: 500),
      decelerationCurve: Curves.easeOut,
    );
  }
}
