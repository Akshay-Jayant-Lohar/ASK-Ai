import 'package:ask/configuration/size.dart';
import 'package:ask/configuration/styles.dart';
import 'package:ask/core/common%20widgts/custom_padding.dart';
import 'package:ask/core/constants/image_icon_resource.dart';
import 'package:ask/features/HomeScreen/presentation/bloc/home_cubit.dart';
import 'package:ask/features/chatScreen/data/resource/custom_chat_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/color_resource.dart';
import '../../../core/constants/string_resource.dart';
import '../../HomeScreen/presentation/bloc/bottomBar_cubit.dart';
import '../../HomeScreen/presentation/bloc/bottomBar_state.dart';
import '../../HomeScreen/presentation/bloc/home_state.dart';
import '../../../core/common widgts/custom_listView.dart';
import '../../../core/common widgts/custom_circle_avtar.dart';
import '../../HomeScreen/presentation/pages/marquee_text.dart';

class ChatScreen extends StatelessWidget {
  final HomeState state;
  final double wSize;
  final double hSize;

  ChatScreen({
    super.key,
    required this.state,
    required this.hSize,
    required this.wSize,
  });

  final ScrollController scrollController = ScrollController();

  // @override
  // Widget build(BuildContext context) {
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     if (scrollController.hasClients) {
  //       scrollController.animateTo(
  //         scrollController.position.maxScrollExtent,
  //         duration: const Duration(milliseconds: 500),
  //         curve: Curves.easeInOut,
  //       );
  //     }
  //   });
  //   // WidgetsBinding.instance.addPostFrameCallback((_) {
  //   //   ScrollToBottom.scrollToBottom(scrollController);
  //   //   scrollController.jumpTo(scrollController.position.maxScrollExtent);
  //   // });
  //   // ScrollToBottom.scrollToBottom(scrollController);
  //   // final newMessageData = ModalRoute.of(context)?.settings.arguments as Map?;
  //   // if (newMessageData != null) {
  //   //   state.messages.add("Issue: ${newMessageData['issue']}");
  //   //   state.messages.add("Issue Description: ${newMessageData['issueDesc']}");
  //   //   state.messages.add("Model: ${newMessageData['model']}");
  //   //   state.messages.add("Language: ${newMessageData['language']}");
  //   // }
  //   return BlocBuilder<BottomBarCubit, BottomBarState>(
  //     builder: (context, bottomBarState) {
  //       // WidgetsBinding.instance.addPostFrameCallback((_) {
  //       //   scrollController.jumpTo(scrollController.position.maxScrollExtent);
  //       // });
  //       final cubit = BlocProvider.of<BottomBarCubit>(context);
  //       final homecubit = BlocProvider.of<HomeCubit>(context);
  //       return Column(
  //         children: [
  //           const SizedBox(
  //             height: 60,
  //           ),
  //           Container(
  //             height: 27,
  //             width: CustomSize.wSize(context),
  //             color: Colors.white,
  //             child: MarrqueeText(
  //               text: AppString().marqueeText,
  //             ),
  //           ),
  //           Expanded(
  //             child: CustomListView(
  //               mController: scrollController,
  //               itemCount: state.messages.length,
  //               itemBuilder: (context, index) {
  //                 bool isBotMessage =
  //                     state.messages[index] == 'This is an auto-reply.';
  //                 bool isPlaying = cubit.isPlaying[index] ?? false;
  //                 return Padding(
  //                   padding: EdgeInsets.symmetric(
  //                       horizontal: wSize * 0.03, vertical: hSize * 0.01),
  //                   child: Row(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     mainAxisAlignment: isBotMessage
  //                         ? MainAxisAlignment.start
  //                         : MainAxisAlignment.end,
  //                     children: [
  //                       if (isBotMessage)
  //                         CircleAvatar(
  //                           backgroundColor: AppColor.containerColor,
  //                           radius: 17,
  //                           child: SizedBox(
  //                             width: wSize * 0.3,
  //                             height: hSize * 0.1,
  //                             child: Image.asset(UIconstants.image.chatLogo),
  //                           ),
  //                         ),
  //                       SizedBox(width: wSize * 0.02),
  //                       Column(
  //                         crossAxisAlignment: isBotMessage
  //                             ? CrossAxisAlignment.start
  //                             : CrossAxisAlignment.end,
  //                         children: [
  //                           CustomChatContainer(
  //                             padding: const EdgeInsets.all(12),
  //                             constraints:
  //                                 BoxConstraints(maxWidth: wSize * 0.7),
  //                             decoration: Styles.customBoxDecoration(
  //                               AppColor.containerColor,
  //                               BorderRadius.only(
  //                                   topLeft: isBotMessage
  //                                       ? Radius.zero
  //                                       : Styles.customRadius(20),
  //                                   topRight: isBotMessage
  //                                       ? Styles.customRadius(20)
  //                                       : Radius.zero,
  //                                   bottomLeft: Styles.customRadius(20),
  //                                   bottomRight: Styles.customRadius(20)),
  //                             ),
  //                             child: Text(
  //                               state.messages[index],
  //                               style: Styles.textStyle(
  //                                   14, AppColor.blackColor, FontWeight.normal),
  //                             ),
  //                           ),
  //                           CustomPadding(
  //                             padding: const EdgeInsets.only(right: 9, top: 7),
  //                             child: Row(
  //                               mainAxisAlignment: isBotMessage
  //                                   ? MainAxisAlignment.start
  //                                   : MainAxisAlignment.end,
  //                               children: [
  //                                 const SizedBox(width: 7),
  //                                 GestureDetector(
  //                                   onTap: () {
  //                                     if (isPlaying) {
  //                                       cubit.stopSpeaking(index);
  //                                     } else {
  //                                       cubit.speak(
  //                                           state.messages[index], index);
  //                                     }
  //                                   },
  //                                   child: isPlaying
  //                                       ? UIconstants.icon.pauseIcon
  //                                       : UIconstants.icon.volumeIcon,
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                       SizedBox(width: wSize * 0.02),
  //                       if (!isBotMessage)
  //                         CustomCircleAvatar(
  //                           backgroundImage:
  //                               AssetImage(UIconstants.image.chatProfileImage),
  //                           radius: 17,
  //                         ),
  //                     ],
  //                   ),
  //                 );
  //               },
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, homeState) {
        return BlocBuilder<BottomBarCubit, BottomBarState>(
          builder: (context, bottomBarState) {
            final cubit = BlocProvider.of<BottomBarCubit>(context);
            // final homeCubit = BlocProvider.of<HomeCubit>(context);
            return Column(
              children: [
                const SizedBox(height: 60),
                Container(
                  height: 27,
                  width: CustomSize.wSize(context),
                  color: Colors.white,
                  child: MarrqueeText(text: AppString().marqueeText),
                ),
                Expanded(
                  child: CustomListView(
                    mController: scrollController,
                    itemCount: homeState.messages.length,
                    itemBuilder: (context, index) {
                      bool isBotMessage =
                          homeState.messages[index] == 'This is an auto-reply.';
                      bool isPlaying = cubit.isPlaying[index] ?? false;
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: wSize * 0.03, vertical: hSize * 0.01),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: isBotMessage
                              ? MainAxisAlignment.start
                              : MainAxisAlignment.end,
                          children: [
                            if (isBotMessage)
                              CircleAvatar(
                                backgroundColor: AppColor.containerColor,
                                radius: 17,
                                child: SizedBox(
                                  width: wSize * 0.3,
                                  height: hSize * 0.1,
                                  child:
                                      Image.asset(UIconstants.image.chatLogo),
                                ),
                              ),
                            SizedBox(width: wSize * 0.02),
                            Column(
                              crossAxisAlignment: isBotMessage
                                  ? CrossAxisAlignment.start
                                  : CrossAxisAlignment.end,
                              children: [
                                CustomChatContainer(
                                  padding: const EdgeInsets.all(12),
                                  constraints:
                                      BoxConstraints(maxWidth: wSize * 0.7),
                                  decoration: Styles.customBoxDecoration(
                                    AppColor.containerColor,
                                    BorderRadius.only(
                                      topLeft: isBotMessage
                                          ? Radius.zero
                                          : Styles.customRadius(20),
                                      topRight: isBotMessage
                                          ? Styles.customRadius(20)
                                          : Radius.zero,
                                      bottomLeft: Styles.customRadius(20),
                                      bottomRight: Styles.customRadius(20),
                                    ),
                                  ),
                                  child: Text(
                                    homeState.messages[index],
                                    style: Styles.textStyle(14,
                                        AppColor.blackColor, FontWeight.normal),
                                  ),
                                ),
                                CustomPadding(
                                  padding:
                                      const EdgeInsets.only(right: 9, top: 7),
                                  child: Row(
                                    mainAxisAlignment: isBotMessage
                                        ? MainAxisAlignment.start
                                        : MainAxisAlignment.end,
                                    children: [
                                      const SizedBox(width: 7),
                                      GestureDetector(
                                        onTap: () {
                                          if (isPlaying) {
                                            cubit.stopSpeaking(index);
                                          } else {
                                            cubit.speak(
                                                homeState.messages[index],
                                                index);
                                          }
                                        },
                                        child: isPlaying
                                            ? UIconstants.icon.pauseIcon
                                            : UIconstants.icon.volumeIcon,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: wSize * 0.02),
                            if (!isBotMessage)
                              CustomCircleAvatar(
                                backgroundImage: AssetImage(
                                    UIconstants.image.chatProfileImage),
                                radius: 17,
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
