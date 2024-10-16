import 'package:ask/configuration/styles.dart';
import 'package:ask/core/constants/color_resource.dart';
import 'package:ask/core/constants/string_resource.dart';
import 'package:ask/features/splash_screen/data/custom_widgets/custom_slide_Transition.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  final Animation<double> animation;

  const SplashScreen({
    Key? key,
    required this.animation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomSlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1.0, 0.0),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            )),
            child: Text(
              AppString().animatedWelcomeText,
              style: Styles.textStyle(
                  50, AppColor.containerColor, FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          CustomSlideTransition(
            position: Tween<Offset>(begin: const Offset(4, 0), end: Offset.zero)
                .animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            )),
            child: Text(
              AppString().animatedToText,
              style: Styles.textStyle(
                  40, AppColor.containerColor, FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          CustomSlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1.0, 0.0),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            )),
            child: Text(
              AppString().animatedAskAIText,
              style: Styles.textStyle(
                  50, AppColor.containerColor, FontWeight.bold),
            ),
          ),
          SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                // end: const Offset(0, -0.5),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              )),
              child: Image.asset("assets/images/bot.png")),
        ],
      ),
    );
  }
}

