import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/common widgts/custom_container.dart';
import '../../../../core/constants/color_resource.dart';
import '../../../../core/constants/image_icon_resource.dart';
import '../../../../core/constants/string_resource.dart';
import '../bloc/home_cubit.dart';
import '../../../chatScreen/data/resource/drop_down_data.dart';

List<String>? dropDownItems = DropDownResource.getDropDownListItems();
String? val;
Future<void> showCustomDialog(
    BuildContext context, double hSize, double wSize) async {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            shape: Border.all(
              color: AppColor.blackColor,
            ),
            contentPadding: const EdgeInsets.all(0),
            content: CustomContainer(
                myHeight: hSize * 0.18,
                myWidth: wSize,
                myColor: AppColor.containerColor,
                mChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: hSize * 0.03,
                          left: wSize * 0.04,
                        ),
                        child: const Text(
                          AppString.dropDownmsg,
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: hSize * 0.1,
                            width: wSize * 0.04,
                          ),
                          //create custom dropdown widget
                          CustomContainer(
                            myHeight: hSize * 0.06,
                            myWidth: wSize * 0.45,
                            myColor: AppColor.containerColor,
                            mChild: DropdownButton<String>(
                              padding: const EdgeInsets.only(left: 14),
                              value: val,
                              icon: UIconstants.icon.dropDownIcon,
                              underline: Container(
                                height: 2,
                              ),
                              onChanged: (String? newValue) {
                                BlocProvider.of<HomeCubit>(context)
                                    .updateDropdownValue(newValue);
                              },
                              items: dropDownItems?.map((String item) {
                                return DropdownMenuItem<String>(
                                    value: item, child: Text(item));
                              }).toList(),
                            ),
                          ),
                          SizedBox(
                            width: wSize * 0.04,
                          ),
                          ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  AppColor.buttonColor),
                            ),
                            onPressed: () {},
                            child: const Text(AppString.buttonText),
                          ),
                        ],
                      ),
                    ])),
          ));
}
