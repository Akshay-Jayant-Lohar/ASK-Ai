import 'package:ask/configuration/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../../../../configuration/size.dart';
import '../../../../core/constants/color_resource.dart';
import '../../../../core/constants/image_icon_resource.dart';

class AskSpeedDial extends StatelessWidget {
  const AskSpeedDial({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpeedDial(
          overlayColor: AppColor.transparent,
          buttonSize: Size(CustomSize.hSize(context) * 0.02,
              CustomSize.wSize(context) * 0.13),
          foregroundColor: AppColor.blackColor,
          shape: Styles.customRoundedRectangleBorder(50),
          backgroundColor: AppColor.containerColor,
          children: [
            SpeedDialChild(
              child: UIconstants.icon.speedIcon1,
            ),
            SpeedDialChild(
              child: UIconstants.icon.speedIcon2,
            ),
          ],
          child: UIconstants.icon.dots),
    );
  }
}
