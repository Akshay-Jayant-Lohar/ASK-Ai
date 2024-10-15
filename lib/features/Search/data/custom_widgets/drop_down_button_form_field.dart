import 'package:flutter/material.dart';

class CustomDropdownButtonFormField<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final String? hintText;
  final Function(T?)? onChanged;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final String? labelText;
  final String? helperText;
  final Widget? icon;
  final Widget? label;

  const CustomDropdownButtonFormField({
    Key? key,
    required this.items,
    this.value,
    this.hintText,
    this.onChanged,
    this.enabledBorder,
    this.focusedBorder,
    this.labelText,
    this.helperText,
    this.icon,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      decoration: InputDecoration(
        label: label,
        labelText: labelText,
        helperText: helperText,
        hintText: hintText,
        border: const OutlineInputBorder(),
        enabledBorder: enabledBorder ?? const OutlineInputBorder(),
        focusedBorder: focusedBorder ??
            const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blue,
                width: 2.0,
              ),
            ),
      ),
      icon: icon ?? const Icon(Icons.arrow_drop_down),
      items: items,
      onChanged: onChanged,
    );
  }
}
