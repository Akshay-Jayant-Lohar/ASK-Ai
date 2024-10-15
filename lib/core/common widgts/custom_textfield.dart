import 'package:flutter/material.dart';
import 'package:ask/configuration/styles.dart';
import 'package:ask/core/constants/color_resource.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? mcontroller;
  final String? text;
  final ValueChanged<String>? onTextChanged;
  final FocusNode? node;
  final void Function()? myOnTap;

  const CustomTextField({
    super.key,
    this.text,
    this.mcontroller,
    this.onTextChanged,
    this.node,
    this.myOnTap,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.node,
      controller: widget.mcontroller,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintStyle: Styles.textStyle(12, AppColor.textFieldColor,FontWeight.normal),
        hintText: widget.text,
      ),
      onChanged: (text) {
        widget.onTextChanged?.call(text);
      },
      onTap: widget.myOnTap,
    );
  }
}
