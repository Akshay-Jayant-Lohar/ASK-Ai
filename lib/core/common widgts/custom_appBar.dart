// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:ask/core/constants/color_resource.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? appBarTitle;
  final Widget? leadingData;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  const CustomAppBar(
      {super.key,
      this.appBarTitle,
      this.leadingData,
      this.bottom,
      this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: const Padding(padding: EdgeInsets.all(50)),
      actions: actions,
      title: Text(appBarTitle!),
      centerTitle: true,
      backgroundColor: AppColor.transparent,
      elevation: 0,
      leading: leadingData,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(bottom == null
      ? kToolbarHeight
      : kToolbarHeight + bottom!.preferredSize.height);
}
