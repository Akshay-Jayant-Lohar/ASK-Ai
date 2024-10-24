// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';
import 'package:ask/configuration/size.dart';
import 'package:ask/configuration/styles.dart';
import 'package:ask/core/common%20widgts/custom_icon_button.dart';
import 'package:ask/core/constants/color_resource.dart';
import 'package:ask/core/constants/string_resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import '../../../../core/common widgts/custom-container.dart';
import '../../../../core/common widgts/custom_padding.dart';
import '../../../../core/constants/image_icon_resource.dart';
import '../../data/model/model_class.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  HistoryTitleModel? _historyTitleModel;

  @override
  void initState() {
    super.initState();
    postHistoryTitle();
  }

  Future<void> postHistoryTitle() async {
    try {
      final tokenResponse = await http.post(
        Uri.parse('https://ai.mahindra.com/api/v1/department/askportal/token'),
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'department_name': 'askportal',
          'description': 'token for askportal',
          'expires_in': 36000,
        }),
      );

      if (tokenResponse.statusCode == 200) {
        final tokenData = jsonDecode(tokenResponse.body);
        final accessToken = tokenData['token'];

        final historyResponse = await http.post(
          Uri.parse(
              'https://ai.mahindra.com/api/v1/department/askportal/blob/shirke.mithilesh/histlist'),
          headers: {
            'accept': 'application/json',
            'Access-Token': accessToken,
          },
          body: jsonEncode({
            'History_title': [
              'SARPANCH-ENGINE OVERHEATING in tractor',
              'Bhoomiputra-engine overheating',
              'Bhoomiputra-Excessive Blow By'
            ]
          }),
        );

        if (historyResponse.statusCode == 200) {
          log('History Response: ${historyResponse.body}');

          setState(() {
            _historyTitleModel =
                HistoryTitleModel.fromJson(jsonDecode(historyResponse.body));
          });
        } else {
          log('Failed to post history: ${historyResponse.statusCode}');
        }
      } else {
        log('Failed to fetch token: ${tokenResponse.statusCode}');
      }
    } catch (error) {
      log('Error occurred: $error');
    }
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
                child: Column(children: [
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
                        style:
                            Styles.textStyle(14, Colors.white, FontWeight.bold),
                      ),
                      SizedBox(
                        width: CustomSize.wSize(context) * 0.4,
                      ),
                      Text(
                        AppString().clear,
                        style:
                            Styles.textStyle(12, Colors.white, FontWeight.bold),
                      ),
                    ],
                  ),
                  Expanded(
                    child: _historyTitleModel == null
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            itemCount: _historyTitleModel!.historyTitles.length,
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
                                    SizedBox(
                                        width:
                                            CustomSize.wSize(context) * 0.02),
                                    Text(
                                      _historyTitleModel!.historyTitles[index],
                                      // historyTitles[index],
                                      style: Styles.textStyle(
                                          12, Colors.black, FontWeight.bold),
                                    ),
                                    SizedBox(
                                        width: CustomSize.wSize(context) * 0.4),
                                    SvgPicture.asset(
                                        UIconstants.image.arrowIcon,
                                        height:
                                            CustomSize.hSize(context) * 0.023,
                                        width: CustomSize.wSize(context) * 0.1),
                                    SizedBox(
                                        width:
                                            CustomSize.wSize(context) * 0.02),
                                    SvgPicture.asset(
                                        UIconstants.image.deleteIcon,
                                        height:
                                            CustomSize.hSize(context) * 0.019,
                                        width: CustomSize.wSize(context) * 0.1),
                                  ],
                                ),
                              );
                            },
                          ),
                  ),
                ]))));
  }
}
