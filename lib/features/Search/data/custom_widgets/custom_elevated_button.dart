import 'package:flutter/material.dart';

import '../../../../core/constants/color_resource.dart';

class CustomElevetedButton extends StatelessWidget {
  final Widget? child;
  final void Function()? onPressed;
  const CustomElevetedButton(
      {super.key, required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(backgroundColor: AppColor.buttonColor),
      child: child,
    );
  }
}
