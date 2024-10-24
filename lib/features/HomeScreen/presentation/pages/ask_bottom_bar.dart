import 'dart:developer';

import 'package:ask/configuration/size.dart';
import 'package:ask/core/common%20widgts/custom_circle_avtar.dart';
import 'package:ask/core/common%20widgts/custom_icon_button.dart';
import 'package:ask/core/constants/color_resource.dart';
import 'package:ask/features/HomeScreen/presentation/pages/speed_dial.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/common widgts/custom_animated_container.dart';
import '../../../../core/common%20widgts/custom_textfield.dart';
import '../../../../core/constants/image_icon_resource.dart';
import '../../../../core/constants/string_resource.dart';
import 'confirmation_dialog.dart';
import '../../data/repository/api_repository.dart';
import '../../domain/usecase/make_api_call_usecase.dart';
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

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final apiRepository = ApiRepositoryImpl();
    final makeApiCallUseCase = MakeApiCallUseCase(apiRepository);

    if (widget.text != null && widget.text!.isNotEmpty) {
      controller.text = widget.text!;
    }

    return BlocConsumer<BottomBarCubit, BottomBarState>(
      listener: (context, state) {
        if (state is TextFieldExpanded) {
          context.read<BottomBarCubit>().isTextFieldExpanded = state.isExpanded;
        }
      },
      builder: (context, micState) {
        // print("State is :$widget.state");
        bool isListening = false;
        bool isExpand = context.read<BottomBarCubit>().isTextFieldExpanded;
        if (micState is SpeechListening) {
          controller.text = micState.recognizedText;
          controller.selection = TextSelection.fromPosition(
            TextPosition(offset: controller.text.length),
          );
          isListening = true;
        }
        if (widget.state is HomeUpdated) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Message sent successfully!')),
          );
        }
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomAnimtaedContainer(
                    duration: const Duration(seconds: 5),
                    height: CustomSize.hSize(context) * 0.065,
                    width: isExpand
                        ? CustomSize.wSize(context) * 0.9
                        : CustomSize.wSize(context) * 0.65,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
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
                              context
                                  .read<BottomBarCubit>()
                                  .toggleTextField(false);
                              controller.clear();
                              focusNode.unfocus();
                            },
                          ),
                          CustomCircleAvatar(
                            backgroundColor: AppIcon.buttonIconColor,
                            child: CustomIconButton(
                              icon:
                                  SvgPicture.asset(UIconstants.image.sendIcon),
                              onPressed: () {
                                log("Send State is :$widget.state");
                                if (controller.text.isNotEmpty) {
                                  focusNode.unfocus();
                                  BlocProvider.of<HomeCubit>(context)
                                      .addMessage(controller.text);
                                  // if (widget.state is HomeUpdated ) {
                                  //   BlocProvider.of<HomeCubit>(context)
                                  //       .addMessage(controller.text);
                                  // } else {
                                  //   // BlocProvider.of<HomeCubit>(context)
                                  //   //     .addMessage(controller.text);
                                  // }
                                  // BlocProvider.of<HomeCubit>(context)
                                  //     .autoReply();
                                  controller.clear();
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
                ),
                SizedBox(
                  width: CustomSize.wSize(context) * 0.02,
                ),
                if (!isExpand) ...[
                  const AskSpeedDial(),
                  SizedBox(
                    width: CustomSize.wSize(context) * 0.02,
                  ),
                  CustomCircleAvatar(
                    radius: 23,
                    backgroundColor: AppColor.containerColor,
                    child: CustomIconButton(
                      icon: SvgPicture.asset(UIconstants.image.addIcon),
                      onPressed: () {
                        showConfirmationDialog(context, makeApiCallUseCase);
                      },
                    ),
                  ),
                ],
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }
}
