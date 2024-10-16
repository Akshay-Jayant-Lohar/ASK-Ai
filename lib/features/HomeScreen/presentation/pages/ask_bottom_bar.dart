import 'package:ask/configuration/size.dart';
import 'package:ask/core/common%20widgts/custom_circle_avtar.dart';
import 'package:ask/core/common%20widgts/custom_icon_button.dart';
import 'package:ask/core/constants/color_resource.dart';
import 'package:ask/features/HomeScreen/presentation/pages/speed_dial.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../configuration/styles.dart';
import '../../../../core/common widgts/custom_animated_container.dart';
import '../../../../core/common%20widgts/custom_textfield.dart';
import '../../../../core/constants/image_icon_resource.dart';
import '../../../../core/constants/string_resource.dart';
import '../bloc/home_cubit.dart';
import '../bloc/home_state.dart';
import '../bloc/bottomBar_cubit.dart';
import '../bloc/bottomBar_state.dart';

// ignore: must_be_immutable
class AskBottomBar extends StatefulWidget {
  final HomeState state;
  String? text = '';

  AskBottomBar({
    super.key,
    required this.state,
    this.text,
  });

  @override
  State createState() => _AskBottomBarState();
}

class _AskBottomBarState extends State<AskBottomBar> {
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  bool isExpand = false;
  bool showAdditionalWidgets = true;

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.text != null && widget.text!.isNotEmpty) {
      controller.text = widget.text!;
    }

    return BlocConsumer<BottomBarCubit, BottomBarState>(
      listener: (context, state) {
        if (state is TextFieldExpanded) {
          // isExpand = state.isExpanded;
          context.read<BottomBarCubit>().isTextFieldExpanded = state.isExpanded;
        }
      },
      builder: (context, micState) {
        bool isListening = false;
        bool isExpand = context.read<BottomBarCubit>().isTextFieldExpanded;
        bool showAdditionalWidgets =
            context.read<BottomBarCubit>().showAdditionalWidgets;
        if (micState is SpeechListening) {
          controller.text = micState.recognizedText;
          controller.selection = TextSelection.fromPosition(
            TextPosition(offset: controller.text.length),
          );
        }
        if (micState is SpeechListening) {
          isListening = true;
        }

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomAnimtaedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 50,
                  width: isExpand ? CustomSize.wSize(context) * 0.9 : 220,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            context
                                .read<BottomBarCubit>()
                                .toggleTextField(!isExpand);
                            if (isExpand) {
                              context
                                  .read<BottomBarCubit>()
                                  .toggleAdditionalWidgets();
                            }
                          },
                          child: CustomTextField(
                            mcontroller: controller,
                            node: focusNode,
                            text: AppString().title,
                            myOnTap: () {
                              BlocProvider.of<BottomBarCubit>(context)
                                  .toggleTextField(true);
                              focusNode.requestFocus();
                            },
                          ),
                        ),
                      ),
                      CustomIconButton(
                        icon: isListening
                            ? UIconstants.icon.micListeningIcon
                            : SvgPicture.asset(UIconstants.image.mic),
                        onPressed: () {
                          if (isListening) {
                            BlocProvider.of<BottomBarCubit>(context)
                                .stopListening();
                          } else {
                            BlocProvider.of<BottomBarCubit>(context)
                                .startListening();
                          }
                        },
                      ),
                      if (isExpand) ...[
                        CustomIconButton(
                          icon: UIconstants.icon.clearIcon,
                          onPressed: () {
                            BlocProvider.of<BottomBarCubit>(context)
                                .clearTextField();
                            controller.clear();
                            focusNode.unfocus();
                          },
                        ),
                        CustomCircleAvatar(
                          backgroundColor: AppIcon.buttonIconColor,
                          child: CustomIconButton(
                            icon: UIconstants.icon.sendIcon,
                            onPressed: () {
                              if (controller.text.isNotEmpty) {
                                BlocProvider.of<HomeCubit>(context)
                                    .addMessage(controller.text);
                                BlocProvider.of<HomeCubit>(context).autoReply();
                                controller.clear();
                                focusNode.unfocus();
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          width: CustomSize.wSize(context) * 0.01,
                        ),
                      ],
                    ],
                  ),
                ),
                SizedBox(
                  width: CustomSize.wSize(context) * 0.02,
                ),
                if (showAdditionalWidgets) ...[
                  const AskSpeedDial(),
                  SizedBox(
                    width: CustomSize.wSize(context) * 0.02,
                  ),
                  CustomCircleAvatar(
                    radius: 23,
                    backgroundColor: AppColor.containerColor,
                    child: CustomIconButton(
                      icon: UIconstants.icon.add,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Text(AppString().dialogMessage,
                                  style: Styles.textStyle(12,
                                      AppColor.blackColor, FontWeight.bold)),
                              actions: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                      style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                AppColor.buttonColor),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(AppString().noDialogMessage,
                                          style: Styles.textStyle(
                                              14,
                                              AppColor.containerColor,
                                              FontWeight.bold)),
                                    ),
                                    ElevatedButton(
                                      style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                AppColor.buttonColor),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(AppString().yesDialogMessage,
                                          style: Styles.textStyle(
                                              14,
                                              AppColor.containerColor,
                                              FontWeight.bold)),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }
}
