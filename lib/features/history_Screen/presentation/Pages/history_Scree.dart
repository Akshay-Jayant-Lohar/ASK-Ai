import 'package:ask/configuration/size.dart';
import 'package:ask/configuration/styles.dart';
import 'package:ask/core/common%20widgts/custom_icon_button.dart';
import 'package:ask/core/constants/color_resource.dart';
import 'package:ask/core/constants/string_resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/common widgts/custom-container.dart';
import '../../../../core/common widgts/custom_padding.dart';
import '../../../../core/constants/image_icon_resource.dart';
import 'package:ask/features/history_screen/data/api/get_api.dart';
import 'package:ask/features/history_Screen/data/model/model_class.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late Future<ModelClass?> historyData;

  @override
  void initState() {
    super.initState();
    historyData = GetApiData().fetchHistory(); // as Future<ModelClass?>;
  }

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
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIconButton(
                    icon: UIconstants.icon.arrowIcon,
                    onPressed: () {
                      Navigator.pop(context);
                    },
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    AppString().searchHistory,
                    style: Styles.textStyle(14, Colors.white, FontWeight.bold),
                  ),
                  SizedBox(
                    width: CustomSize.wSize(context) * 0.4,
                  ),
                  Text(
                    AppString().clear,
                    style: Styles.textStyle(12, Colors.white, FontWeight.bold),
                  ),
                ],
              ),
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: 3,
              //     padding: const EdgeInsets.only(top: 8),
              //     itemBuilder: (context, index) {
              //       return CustomContainer(
              //         width: CustomSize.wSize(context) * 0.75,
              //         margin: const EdgeInsets.all(10),
              //         height: CustomSize.hSize(context) * 0.05,
              //         decoration: Styles.customBoxDecoration(
              //             AppColor.containerColor,
              //             Styles.customBorderRadius(5)),
              //         child: Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Row(
              //             children: [
              //               // SizedBox(width: CustomSize.wSize(context) * 0.02),
              //               Text(
              //                 ListData.data[index],
              //                 style: Styles.textStyle(
              //                     12, Colors.black, FontWeight.bold),
              //               ),
              //               SizedBox(width: CustomSize.wSize(context) * 0.48),
              //               SvgPicture.asset(UIconstants.image.arrowIcon,
              //                   height: CustomSize.hSize(context) * 0.023,
              //                   width: CustomSize.wSize(context) * 0.1),
              //               SizedBox(width: CustomSize.wSize(context) * 0.02),
              //               SvgPicture.asset(UIconstants.image.deleteIcon,
              //                   height: CustomSize.hSize(context) * 0.019,
              //                   width: CustomSize.wSize(context) * 0.1),
              //             ],
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              Expanded(
                child: FutureBuilder<ModelClass?>(
                  future: historyData,
                  builder: (context, snapshot) {
                    print(snapshot.connectionState);
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(
                          child: Text(
                        'Error: ${snapshot.error}',
                        style:
                            const TextStyle(fontSize: 25, color: Colors.white),
                      ));
                    } else if (!snapshot.hasData ||
                        snapshot.data!.historyTitle.isEmpty) {
                      return const Center(
                          child: Text(
                        'No history found.',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ));
                    } else {
                      final historyTitles = snapshot.data!.historyTitle;
                      return ListView.builder(
                        itemCount: historyTitles.length,
                        itemBuilder: (context, index) {
                          return ListTile(title: Text(historyTitles[index]));
                        },
                      );
                      // return ListView.builder(
                      //   itemCount: historyTitles.length,
                      //   padding: const EdgeInsets.only(top: 8),
                      //   itemBuilder: (context, index) {
                      //     return CustomContainer(
                      //       width: CustomSize.wSize(context) * 0.75,
                      //       margin: const EdgeInsets.all(10),
                      //       height: CustomSize.hSize(context) * 0.05,
                      //       decoration: Styles.customBoxDecoration(
                      //           AppColor.containerColor,
                      //           Styles.customBorderRadius(5)),
                      //       child: Row(
                      //         children: [
                      //           SizedBox(
                      //               width: CustomSize.wSize(context) * 0.02),
                      //           Text(
                      //             historyTitles[index],
                      //             style: Styles.textStyle(
                      //                 12, Colors.black, FontWeight.bold),
                      //           ),
                      //           SizedBox(
                      //               width: CustomSize.wSize(context) * 0.5),
                      //           SvgPicture.asset(UIconstants.image.arrowIcon,
                      //               height: CustomSize.hSize(context) * 0.023,
                      //               width: CustomSize.wSize(context) * 0.1),
                      //           SizedBox(
                      //               width: CustomSize.wSize(context) * 0.02),
                      //           SvgPicture.asset(UIconstants.image.deleteIcon,
                      //               height: CustomSize.hSize(context) * 0.019,
                      //               width: CustomSize.wSize(context) * 0.1),
                      //         ],
                      //       ),
                      //     );
                      //   },
                      // );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
