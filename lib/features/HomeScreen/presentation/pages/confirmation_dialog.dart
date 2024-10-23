import 'package:flutter/material.dart';
import '../../../../configuration/styles.dart';
import '../../../../core/constants/color_resource.dart';
import '../../../../core/constants/string_resource.dart';
import '../../domain/usecase/make_api_call_usecase.dart';
import 'handle_api_call.dart';

void showConfirmationDialog(
    BuildContext context, MakeApiCallUseCase apiCallUseCase) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text(AppString().dialogMessage,
            style: Styles.textStyle(12, AppColor.blackColor, FontWeight.bold)),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(AppColor.buttonColor),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(AppString().noDialogMessage,
                    style: Styles.textStyle(
                        14, AppColor.containerColor, FontWeight.bold)),
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(AppColor.buttonColor),
                ),
                onPressed: () async {
                  // Navigator.of(context).pop();
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const HomeScreen()),
                  // );
                  await handleApiCall(context, apiCallUseCase);
                },
                child: Text(AppString().yesDialogMessage,
                    style: Styles.textStyle(
                        14, AppColor.containerColor, FontWeight.bold)),
              ),
            ],
          ),
        ],
      );
    },
  );
}


