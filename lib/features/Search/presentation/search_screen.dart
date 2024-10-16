import 'package:ask/configuration/size.dart';
import 'package:ask/configuration/styles.dart';
import 'package:ask/core/common%20widgts/custom_padding.dart';
import 'package:ask/core/constants/color_resource.dart';
import 'package:ask/core/constants/string_resource.dart';
import 'package:ask/features/Search/data/custom_widgets/custom_elevated_button.dart';
import 'package:ask/features/Search/data/custom_widgets/custom_oulinedButton.dart';
import 'package:ask/features/Search/data/custom_widgets/drop_down_button_form_field.dart';
import 'package:flutter/material.dart';
import 'package:ask/features/Search/data/drop_down_data.dart';
import 'package:ask/features/Search/data/custom_widgets/custom_textfield.dart';
import '../../../core/common widgts/custom-container.dart';

class SearchScreen extends StatelessWidget {
  final VoidCallback onCancel;

  const SearchScreen({super.key, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: CustomSize.hSize(context) * 0.1,
          ),
          Dialog(
            insetPadding: EdgeInsets.zero,
            alignment: Alignment.topCenter,
            shape: RoundedRectangleBorder(
                borderRadius: Styles.customBorderRadius(5)),
            child: CustomContainer(
              padding: const EdgeInsets.all(10),
              height: CustomSize.hSize(context) * 0.6,
              width: CustomSize.wSize(context) * 0.9,
              decoration: Styles.customBoxDecoration(
                  AppColor.containerColor, Styles.customBorderRadius(5)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppString().search,
                      style: Styles.textStyle(
                          18, AppColor.blackColor, FontWeight.bold),
                      textAlign: TextAlign.right,
                    ),
                    CustomPadding(
                      padding: EdgeInsets.all(CustomSize.hSize(context) * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomTextField(
                            label: Text(AppString().issue,
                                style: Styles.textStyle(
                                    14, AppColor.blackColor, FontWeight.bold)),
                          ),
                          SizedBox(height: CustomSize.hSize(context) * 0.03),
                          CustomDropdownButtonFormField(
                            label: Text(AppString().model,
                                style: Styles.textStyle(
                                    14, AppColor.blackColor, FontWeight.bold)),
                            // labelText: AppString.model,
                            items: DropDownData.models
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,
                                    style: Styles.textStyle(14,
                                        AppColor.blackColor, FontWeight.bold)),
                              );
                            }).toList(),
                            onChanged: (value) {},
                          ),
                          SizedBox(height: CustomSize.hSize(context) * 0.03),
                          CustomDropdownButtonFormField(
                            label: Text(AppString().issueDec,
                                style: Styles.textStyle(
                                    14, AppColor.blackColor, FontWeight.bold)),
                            // labelText: AppString.issueDec,
                            items: DropDownData.issueDec
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,
                                    style: Styles.textStyle(14,
                                        AppColor.blackColor, FontWeight.bold)),
                              );
                            }).toList(),
                            onChanged: (value) {},
                          ),
                          const SizedBox(height: 16),
                          CustomDropdownButtonFormField(
                            label: Text(AppString().language,
                                style: Styles.textStyle(
                                    14, AppColor.blackColor, FontWeight.bold)),
                            // labelText: AppString.language,
                            items: DropDownData.languages
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,
                                    style: Styles.textStyle(14,
                                        AppColor.blackColor, FontWeight.bold)),
                              );
                            }).toList(),
                            onChanged: (value) {},
                          ),
                          SizedBox(height: CustomSize.hSize(context) * 0.02),
                          Row(
                            children: [
                              Expanded(
                                child: CustomOutlinedButton(
                                  onPressed: onCancel,
                                  child: Text(
                                    AppString().cancel,
                                    style: Styles.textStyle(14,
                                        AppColor.blackColor, FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(width: CustomSize.wSize(context) * 0.07),
                              Expanded(
                                child: CustomElevetedButton(
                                  onPressed: () {},
                                  child: Text(AppString().proceed,
                                      style: Styles.textStyle(
                                          14,
                                          AppColor.containerColor,
                                          FontWeight.bold)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
