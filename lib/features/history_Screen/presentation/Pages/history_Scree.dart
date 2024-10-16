import 'package:ask/core/common%20widgts/custom_listView.dart';
import 'package:flutter/material.dart';
import '../../../../configuration/size.dart';
import '../../../../core/constants/image_icon_resource.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController? controller;
    return Scaffold(
      body: Container(
        height: CustomSize.hSize(context),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(UIconstants.image.backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Search"),
                  Text("Search"),
                ],
              ),
              CustomListView(
                itemCount: 3,
                mController: controller,
                itemBuilder: (context, index) {
                  return const Card(
                    child: ListTile(
                        title: Text("Battery Issue"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.arrow_back_ios_new_outlined),
                            Icon(Icons.delete_forever),
                          ],
                        )),
                  );
                },
              )
              // Card(
              //   color: Colors.amber,
              //   child: Text("Card1"),
              // ),
              // Card(),
              // Card()
            ],
          ),
        ),
      ),
    );
  }
}
