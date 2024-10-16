import 'package:ask/configuration/size.dart';
import 'package:ask/configuration/styles.dart';
import 'package:ask/core/constants/string_resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/common widgts/custom_appBar.dart';
import '../../../../core/common widgts/custom_padding.dart';
import '../../../../core/constants/image_icon_resource.dart';
import '../../data/list_data.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        appBarTitle: '',
        actions: [
          CustomPadding(
            padding: const EdgeInsets.all(3),
            child: Image.asset(UIconstants.image.appBarIconImage),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(UIconstants.image.backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: CustomSize.hSize(context) * 0.15),
            Row(
              children: [
                SizedBox(
                  width: CustomSize.wSize(context) * 0.1,
                ),
                Text(
                  AppString().searchHistory,
                  style: Styles.textStyle(14, Colors.white, FontWeight.bold),
                ),
                SizedBox(
                  width: CustomSize.wSize(context) * 0.38,
                ),
                Text(
                  AppString().clear,
                  style: Styles.textStyle(14, Colors.white, FontWeight.bold),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                padding: const EdgeInsets.only(top: 8),
                itemBuilder: (context, index) {
                  return Card(
                    margin:
                        const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                    child: ListTile(
                      title: Text(
                        ListData.data[index],
                        style:
                            Styles.textStyle(14, Colors.black, FontWeight.bold),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(UIconstants.image.arrowIcon),
                          SizedBox(width: CustomSize.wSize(context) * 0.02),
                          SvgPicture.asset(UIconstants.image.deleteIcon),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
