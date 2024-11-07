import 'dart:developer';
import 'package:flutter/material.dart';
import '../../domain/usecase/feedback_api_call_usecase.dart';

Future<void> feedBackSubmit(
    BuildContext context, ApiCallUseCase apiCallUseCase) async {
  try {
    // await apiCallUseCase.execute();// move to cubit
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
      ),
    );
  } catch (e) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: const Text('An error occurred. Please try again later.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
    log("Error: $e");
  }
}