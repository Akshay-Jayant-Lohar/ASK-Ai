import 'package:flutter/material.dart';
import '../../domain/usecase/make_api_call_usecase.dart';

Future<void> handleApiCall(
    BuildContext context, MakeApiCallUseCase apiCallUseCase) async {
  try {
    await apiCallUseCase.execute();
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
    print("Error: $e");
  }
}