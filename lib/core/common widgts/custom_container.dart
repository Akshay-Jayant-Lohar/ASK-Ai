import 'package:ask/core/constants/color_resource.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double? myHeight;
  final double? myWidth;
  final Color? myColor;
  final Widget? mChild;
  final EdgeInsetsGeometry? padding;
  final Decoration? decoration;

  const CustomContainer(
      {super.key,
      this.myHeight,
      this.myWidth,
      this.myColor,
      this.mChild,
      this.padding,
      this.decoration});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: myHeight,
      width: myWidth,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: myColor,
        border: Border.all(color: AppColor.blackColor),
      ),
      child: mChild,
    );
  }
}
