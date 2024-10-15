// import 'dart:async';
// import 'package:ask/core/common%20widgts/custom_padding.dart';
// import 'package:ask/core/constants/image_icon_resource.dart';
// import 'package:ask/features/Search/presentation/search_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:ask/features/HomeScreen/presentation/bloc/home_cubit.dart';
// import 'package:ask/features/HomeScreen/presentation/pages/ask_bottom_bar.dart';
// import 'package:ask/features/chatScreen/presentation/chat_screen.dart';
// import 'package:ask/configuration/size.dart';
// // import 'package:flutter_svg/svg.dart';
// import '../../../../core/common widgts/custom_appBar.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../bloc/bottomBar_state.dart';
// import '../../../splash_screen/presentation/splach_screen.dart';
// import '../bloc/home_state.dart';
// import '../../../chatScreen/data/resource/drop_down_data.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen>
//     with SingleTickerProviderStateMixin {
//   List<String> messages = [];
//   String? val;
//   String recText = "";
//   TextEditingController? controller = TextEditingController();
//   List<String>? dropDownItems = DropDownResource.getDropDownListItems();
//   late AnimationController _controller;
//   late Animation<double> animation;
//   bool showSplashScreen = true;
//   bool showSearchScreen = false;
//   bool showChatScreen = false;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     );
//     animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
//     _controller.forward();
//     Timer(const Duration(seconds: 2), () {
//       setState(() {
//         showSplashScreen = false;
//         showSearchScreen = true;
//       });
//       showDialog(
//         barrierDismissible: false,
//         barrierColor: Colors.transparent,
//         context: context,
//         builder: (context) => SearchScreen(
//           onCancel: () {
//             Navigator.pop(context);
//             setState(() {
//               showSearchScreen = false;
//               showChatScreen = true;
//             });
//           },
//         ),
//       );
//     });
//   }

//   @override
//   void dispose() {
//     controller?.dispose();
//     _controller.dispose();
//     super.dispose();
//   }

//   void sendMessage(String message) {
//     if (message.isNotEmpty) {
//       setState(() {
//         messages.add(message);
//         recText = "";
//         controller?.clear();
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: true,
//         extendBodyBehindAppBar: true,
//         appBar: CustomAppBar(
//           appBarTitle: '',
//           actions: [
//             CustomPadding(
//               padding: const EdgeInsets.all(3),
//               child: Image.asset(UIconstants.image.appBarIconImage),
//             ),
//           ],
//         ),
//         body: GestureDetector(
//           onTap: () {
//             FocusScope.of(context).unfocus();
//           },
//           child: Container(
//             height: CustomSize.hSize(context),
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(UIconstants.image.backgroundImage),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             child: Column(
//               children: [
//                 Expanded(
//                   child: showSplashScreen
//                       ? SplashScreen(animation: animation)
//                       : showSearchScreen
//                           ? Container() // Placeholder for search screen
//                           : showChatScreen
//                               ? BlocConsumer<HomeCubit, HomeState>(
//                                   listener: (context, state) {
//                                     if (state is SpeechListening) {
//                                       recText = state.recognizedText ?? "";
//                                     }
//                                   },
//                                   builder: (context, state) {
//                                     return Column(
//                                       children: [
//                                         Expanded(
//                                           child: ChatScreen(
//                                             state: state,
//                                             wSize: CustomSize.wSize(context),
//                                             hSize: CustomSize.hSize(context),
//                                           ),
//                                         ),
//                                         AskBottomBar(
//                                           state:
//                                               context.watch<HomeCubit>().state,
//                                           text: recText,
//                                         ),
//                                       ],
//                                     );
//                                   },
//                                 )
//                               : Container(),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:async';
import 'package:ask/core/common%20widgts/custom_padding.dart';
import 'package:ask/core/constants/image_icon_resource.dart';
import 'package:ask/features/Search/presentation/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:ask/features/HomeScreen/presentation/bloc/home_cubit.dart';
import 'package:ask/features/HomeScreen/presentation/pages/ask_bottom_bar.dart';
import 'package:ask/features/chatScreen/presentation/chat_screen.dart';
import 'package:ask/configuration/size.dart';
import '../../../../core/common widgts/custom_appBar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../splash_screen/presentation/pages/splach_screen.dart';
import '../bloc/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    controller.forward();

    Timer(const Duration(seconds: 3), () {
      context.read<HomeCubit>().finishSplash();
    });

    Future.delayed(const Duration(seconds: 3), () {
      showDialog(
        barrierDismissible: false,
        barrierColor: Colors.transparent,
        context: context,
        builder: (context) => SearchScreen(
          onCancel: () {
            Navigator.pop(context);
            context.read<HomeCubit>().showChatScreen();
          },
        ),
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
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
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            height: CustomSize.hSize(context),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(UIconstants.image.backgroundImage),
                fit: BoxFit.cover,
              ),
            ),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeInitial) {
                  return SplashScreen(animation: animation);
                } else if (state is SearchScreenVisible) {
                  return Container();
                } else if (state is ChatScreenVisible) {
                  return Column(
                    children: [
                      Expanded(
                        child: ChatScreen(
                          state: state,
                          wSize: CustomSize.wSize(context),
                          hSize: CustomSize.hSize(context),
                        ),
                      ),
                      AskBottomBar(
                        state: state,
                        text: state.recognizedText ?? "",
                      ),
                    ],
                  );
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}
