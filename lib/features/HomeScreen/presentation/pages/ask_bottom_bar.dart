import 'package:ask/features/HomeScreen/data/data_source/api/dio_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ask/configuration/size.dart';
import 'package:ask/core/common%20widgts/custom_circle_avtar.dart';
import 'package:ask/core/common%20widgts/custom_icon_button.dart';
import 'package:ask/core/constants/color_resource.dart';
import 'package:ask/features/HomeScreen/presentation/pages/speed_dial.dart';
import 'package:ask/core/common%20widgts/custom_animated_container.dart';
import 'package:ask/core/common%20widgts/custom_textfield.dart';
import 'package:ask/core/constants/image_icon_resource.dart';
import 'package:ask/core/constants/string_resource.dart';
import '../../data/data_source/api/api_service.dart';
import '../bloc/bottomBar_cubit.dart';
import '../bloc/bottomBar_state.dart';
import 'confirmation_dialog.dart';
import '../../data/repository/api_repository_impl.dart';
import '../../domain/usecase/feedback_api_call_usecase.dart';
import '../bloc/home_cubit.dart';
import '../bloc/home_state.dart';

class AskBottomBar extends StatefulWidget {
  final HomeState state;
  final String? text;
  final ApiService? apiService;

  const AskBottomBar({
    super.key,
    required this.state,
    this.apiService,
    this.text,
  });

  @override
  State createState() => _AskBottomBarState();
}

class _AskBottomBarState extends State<AskBottomBar> {
  late final TextEditingController controller;
  late final FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.text);
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final apiRepository = ApiRepositoryImpl(apiService);
    final apiCallUseCase = ApiCallUseCase(apiRepository);

    return BlocConsumer<BottomBarCubit, BottomBarState>(
      listener: (context, state) {
        if (state is TextFieldExpanded) {
          context.read<BottomBarCubit>().isTextFieldExpanded = state.isExpanded;
        }
        if (state is ApiCallLoading) {
          // Show loading indicator
        } else if (state is ApiCallSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Success: ${state.responseData}')),
          );
        } else if (state is ApiCallFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${state.error}')),
          );
        }
      },
      builder: (context, micState) {
        bool isListening = micState is SpeechListening;
        bool isExpand = context.read<BottomBarCubit>().isTextFieldExpanded;

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
                const SizedBox(width: 10),
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
                                if (controller.text.isNotEmpty) {
                                  BlocProvider.of<HomeCubit>(context)
                                      .addMessage(controller.text);
                                  controller.clear();
                                }
                              },
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                if (!isExpand) ...[
                  const AskSpeedDial(),
                  CustomCircleAvatar(
                    radius: 23,
                    backgroundColor: AppColor.containerColor,
                    child: CustomIconButton(
                      icon: SvgPicture.asset(UIconstants.image.addIcon),
                      onPressed: () {
                        showConfirmationDialog(context, apiCallUseCase);
                      },
                    ),
                  ),
                ],
              ],
            ),
          ],
        );
      },
    );
  }
}
