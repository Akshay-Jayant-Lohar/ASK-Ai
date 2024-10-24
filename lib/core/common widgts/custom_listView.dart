// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  final ScrollController? mController;
  final int? itemCount;
  final IndexedWidgetBuilder itemBuilder;
  const CustomListView(
      {super.key,
      required this.mController,
      this.itemCount,
      required this.itemBuilder});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      controller: mController,
      itemBuilder: itemBuilder,
      physics: const ScrollPhysics(),
      shrinkWrap: true,
    );
  }
}
