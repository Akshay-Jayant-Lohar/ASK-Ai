import 'package:ask/configuration/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../configuration/size.dart';
import '../../../../core/constants/color_resource.dart';
import '../../../../core/constants/image_icon_resource.dart';
import '../../../history_screen/presentation/Pages/history_Scree.dart';

class AskSpeedDial extends StatelessWidget {
  const AskSpeedDial({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpeedDial(
          overlayOpacity: 0,
          overlayColor: AppColor.transparent,
          buttonSize: Size(CustomSize.hSize(context) * 0.02,
              CustomSize.wSize(context) * 0.13),
          foregroundColor: AppColor.blackColor,
          shape: Styles.customRoundedRectangleBorder(50),
          backgroundColor: AppColor.containerColor,
          // elevation: 0.2,
          // activeBackgroundColor: Colors.transparent,
          // spacing: 10,
          // spaceBetweenChildren: 6,
          // childMargin: EdgeInsets.only(bottom: 100),
          children: [
            SpeedDialChild(
              onTap: () => Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const HistoryScreen();
                },
              )),
              child: SvgPicture.asset(UIconstants.image.historyIcon),
            ),
            SpeedDialChild(
              child: SvgPicture.asset(UIconstants.image.speakIcon),
            ),
          ],
          child: UIconstants.icon.dots),
    );
  }
}
