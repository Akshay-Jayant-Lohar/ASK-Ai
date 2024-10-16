import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  // final InputBorder? enabledBorder;
  // final InputBorder? disabledBorder;
  final String hintText;
  final TextEditingController? controller;
  // final Function(String)? onChanged;
  final String? labelText;
  final Widget? label;
  // final bool obscureText;

  const CustomTextField({
    Key? key,
    this.hintText = '',
    this.controller,
    // this.onChanged,
    // this.enabledBorder,
    // this.disabledBorder,
    this.labelText,
    this.label,
    // this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      // onChanged: onChanged,
      // obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        label: label,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        // focusedBorder: OutlineInputBorder(
        //   borderSide: BorderSide(
        //       color: Colors.black87), // Dark black border when focused
        // ),
        // hintText: hintText,
        // border: const OutlineInputBorder(),
        // enabledBorder: enabledBorder ?? InputBorder.none,
        // disabledBorder: disabledBorder ?? InputBorder.none,
      ),
    );
  }
}
