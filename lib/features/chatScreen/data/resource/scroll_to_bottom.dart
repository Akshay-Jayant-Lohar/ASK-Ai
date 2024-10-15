import 'package:flutter/material.dart';

class ScrollToBottom {
  static void scrollToBottom(ScrollController scrollController) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 500),
      );
    });
  }
}
