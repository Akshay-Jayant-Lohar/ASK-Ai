import 'package:ask/configuration/size.dart';
import 'package:ask/configuration/styles.dart';
import 'package:ask/core/constants/color_resource.dart';
import 'package:ask/core/constants/string_resource.dart';
import 'package:ask/features/history_Screen/data/custom_widget/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/common widgts/custom_padding.dart';
import '../../../../core/constants/image_icon_resource.dart';
import '../../data/list_data.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(UIconstants.image.backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: CustomSize.hSize(context) * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  UIconstants.icon.arrowIcon,
                  SizedBox(
                    width: CustomSize.wSize(context) * 0.6,
                  ),
                  SizedBox(
                    height: CustomSize.hSize(context) * 0.07,
                    width: CustomSize.wSize(context) * 0.18,
                    child: CustomPadding(
                      padding: const EdgeInsets.all(3),
                      child: Image.asset(UIconstants.image.appBarIconImage),
                    ),
                  ),
                ],
              ),
              SizedBox(height: CustomSize.hSize(context) * 0.01),
              Row(
                children: [
                  SizedBox(
                    width: CustomSize.wSize(context) * 0.04,
                  ),
                  Text(
                    AppString().searchHistory,
                    style: Styles.textStyle(14, Colors.white, FontWeight.bold),
                  ),
                  SizedBox(
                    width: CustomSize.wSize(context) * 0.5,
                  ),
                  Text(
                    AppString().clear,
                    style: Styles.textStyle(12, Colors.white, FontWeight.bold),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  padding: const EdgeInsets.only(top: 8),
                  itemBuilder: (context, index) {
                    return CustomContainer(
                      width: CustomSize.wSize(context) * 0.75,
                      margin: const EdgeInsets.all(10),
                      height: CustomSize.hSize(context) * 0.05,
                      decoration: Styles.customBoxDecoration(
                          AppColor.containerColor,
                          Styles.customBorderRadius(5)),
                      child: Row(
                        children: [
                          SizedBox(width: CustomSize.wSize(context) * 0.02),
                          Text(
                            ListData.data[index],
                            style: Styles.textStyle(
                                12, Colors.black, FontWeight.normal),
                          ),
                          SizedBox(width: CustomSize.wSize(context) * 0.5),
                          SvgPicture.asset(UIconstants.image.arrowIcon,
                              height: CustomSize.hSize(context) * 0.023,
                              width: CustomSize.wSize(context) * 0.1
                              // width: 13,
                              ),
                          SizedBox(width: CustomSize.wSize(context) * 0.02),
                          SvgPicture.asset(UIconstants.image.deleteIcon,
                              height: CustomSize.hSize(context) * 0.019,
                              width: CustomSize.wSize(context) * 0.1),
                        ],
                      ),
                    );
                    // return Card(
                    //   margin: const EdgeInsets.only(bottom: 20),
                    //   child: SizedBox(
                    //     height: 50,
                    //     child: Padding(
                    //       padding: const EdgeInsets.all(0),
                    //       child: ListTile(
                    //         // contentPadding: EdgeInsets.zero,
                    //         // titleAlignment: ,
                    //         // titleAlignment: ,
                    //         title: Text(
                    //           ListData.data[index],
                    //           style: Styles.textStyle(
                    //               12, Colors.black, FontWeight.normal),
                    //         ),
                    //         trailing: Row(
                    //           mainAxisSize: MainAxisSize.min,
                    //           children: [
                    //             SvgPicture.asset(
                    //               UIconstants.image.arrowIcon,
                    //               height: 13,
                    //               width: 13,
                    //             ),
                    //             SizedBox(
                    //                 width: CustomSize.wSize(context) * 0.02),
                    //             SvgPicture.asset(
                    //               UIconstants.image.deleteIcon,
                    //               height: 13,
                    //               width: 13,
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
