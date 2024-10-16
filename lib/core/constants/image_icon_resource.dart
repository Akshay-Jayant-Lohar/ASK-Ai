import 'package:flutter/material.dart';
import 'color_resource.dart';

mixin UIconstants {
  static ImageResource get image => ImageResource();
  static AppIcon get icon => AppIcon();
}

class ImageResource {
  String backgroundImage = "assets/images/background.jpg";
  String chatProfileImage = "assets/images/appBar_person_logo.png";
  String mic = "assets/images/micIcon.svg";
  String chatLogo = 'assets/images/chat_ask_AI_logo.png';
  String micIconImage = 'assets/images/micImage.png';
  String appBarIconImage = 'assets/images/icon.png';
  String arrowIcon = 'assets/images/arro_icon.svg';
  String deleteIcon = 'assets/images/delete_icon.svg';
}

class AppIcon {
  static Color buttonIconColor = AppColor.buttonColor;
  static Color containerIconColor = AppColor.containerColor;
  Icon sendIcon = Icon(Icons.send_sharp, color: containerIconColor);
  Icon micIcon = const Icon(Icons.mic_none_sharp);
  Icon pauseIcon = Icon(
    Icons.pause,
    color: containerIconColor,
  );
  Icon clearIcon = const Icon(Icons.clear);
  Icon micListeningIcon = const Icon(Icons.mic_external_on_outlined);
  Icon optionIcon = const Icon(Icons.pending_outlined);
  Icon dropDownIcon = const Icon(Icons.arrow_drop_down_outlined);
  Icon floatingIcon = Icon(
    Icons.add_circle_outline,
    color: buttonIconColor,
  );
  static var menuCloseIcon = AnimatedIcons.menu_close;
  Icon speedIcon1 = Icon(Icons.sync_problem, color: buttonIconColor);
  Icon speedIcon2 = Icon(Icons.volume_down_rounded, color: buttonIconColor);
  Icon speedIcon3 = Icon(Icons.translate_rounded, color: buttonIconColor);
  Icon speedIcon4 = Icon(Icons.info_rounded, color: buttonIconColor);
  Icon volumeIcon = Icon(Icons.volume_up_rounded, color: containerIconColor);
  Icon copyIcon = Icon(Icons.copy, size: 19, color: containerIconColor);
  Icon person = const Icon(Icons.person);
  Icon add = Icon(
    Icons.add_comment_sharp,
    color: buttonIconColor,
    size: 20,
  );
  Icon dots = const Icon(Icons.more_vert);
}
