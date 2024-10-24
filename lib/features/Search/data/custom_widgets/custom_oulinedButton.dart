// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../../../core/constants/color_resource.dart';

class CustomOutlinedButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget? child;
  const CustomOutlinedButton({super.key, this.onPressed, this.child});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: AppColor.cancelButtonColor),
      ),
      child: child,
    );
  }
}
