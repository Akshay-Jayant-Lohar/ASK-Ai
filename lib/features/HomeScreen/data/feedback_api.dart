import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../configuration/styles.dart';
import '../../../core/constants/color_resource.dart';
import '../../../core/constants/string_resource.dart';

void showConfirmationDialog(BuildContext context) {
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
                onPressed: () {
                  // Navigator.of(context).pop();
                  makeApiCall(context);
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

Future<void> makeApiCall(BuildContext context) async {
  String apiUrl =
      'https://ai.mahindra.com/api/v1/department/askportal/feedback';
  String token =
      "\$2a\$10\$3lt1eS9bvGDs.zyVfeeaFeki7Uv1SLrzBr4AqnuYK8.YpBqQfsn7m";

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Access-Token': token,
        'Content-Type': 'application/json',
      },
      body: '{"done": true}',
    );

    if (response.statusCode == 200) {
      print(response.body);
      print(response.statusCode);
      // ignore: use_build_context_synchronously
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
                title: const Text('Success'),
                content: const Text('Operation was successful.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('OK'),
                  ),
                ],
              ));
    } else {
      //
      // showDialog(
      //     context: Navigator.of(context, rootNavigator: true).context,
      //     barrierDismissible: false,
      //     builder: (context) => AlertDialog(
      //           title: const Text('Error'),
      //           content: Text('Failed with status code ${response.statusCode}'),
      //           actions: [
      //             TextButton(
      //               onPressed: () => Navigator.of(context).pop(),
      //               child: const Text('OK'),
      //             ),
      //           ],
      //         ));
    }
  } catch (e) {
    // showDialog(
    //     context: Navigator.of(context, rootNavigator: true).context,
    //     barrierDismissible: false,
    //     builder: (context) => AlertDialog(
    //           title: const Text('Error'),
    //           content: const Text('An error occurred. Please try again later.'),
    //           actions: [
    //             TextButton(
    //               onPressed: () => Navigator.of(context).pop(),
    //               child: const Text('OK'),
    //             ),
    //           ],
    //         ));
    print("Error: $e");
  }
}
