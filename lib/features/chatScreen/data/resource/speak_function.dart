import 'package:flutter_tts/flutter_tts.dart';

Future<void> speak(String text, FlutterTts flutterTts) async {
  await flutterTts.setLanguage("en-US");
  await flutterTts.setPitch(1.0);
  await flutterTts.setSpeechRate(0.4);
  await flutterTts.speak(text);
}

Future<void> stopSpeaking(FlutterTts flutterTts) async {
  await flutterTts.stop();
}
