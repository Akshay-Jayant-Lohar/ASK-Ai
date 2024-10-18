// import 'dart:developer';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_tts/flutter_tts.dart';
// import 'bottomBar_state.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;

// class BottomBarCubit extends Cubit<BottomBarState> {
//   final stt.SpeechToText speech = stt.SpeechToText();
//   Map<int, bool> isPlaying = {};
//   final FlutterTts flutterTts = FlutterTts();

//   BottomBarCubit() : super(SpeechInitial());
//   bool isTextFieldExpanded = false;
//   bool showAdditionalWidgets = true;

//   Future<void> startListening() async {
//     bool available = await speech.initialize(
//       onStatus: (val) => log("onStatus: $val"),
//       onError: (val) {
//         log("onError: $val");
//         emit(SpeechError(error: val.errorMsg));
//       },
//     );
//     if (available) {
//       log('Speech recognition available');
//       emit(const SpeechListening(recognizedText: ''));
//       speech.listen(onResult: (val) {
//         log("Recognized words: ${val.recognizedWords}");
//         emit(SpeechListening(recognizedText: val.recognizedWords));
//       });
//     } else {
//       log('Speech recognition not available');
//       emit(const SpeechError(error: 'Speech recognition not available'));
//     }
//   }

//   void stopListening() {
//     speech.stop();
//     emit(SpeechStopped());
//     log("Stopped Listening");
//   }

//   void toggleTextField(bool isExpanded) {
//     isTextFieldExpanded = isExpanded;
//     emit(TextFieldExpanded(isExpanded));
//     if (!isExpanded) {
//       toggleAdditionalWidgets();
//     } else {
//       isTextFieldExpanded = false;
//       // showAdditionalWidgets = false;
//     }
//   }

//   // void clearTextField() {
//   //   emit(const TextFieldExpanded(false));
//   //   toggleAdditionalWidgets();
//   // }

//   Future<void> speak(String text, int index) async {
//     isPlaying[index] = true;
//     emit(MessageSpeaking(index: index, isPlaying: true));

//     await flutterTts.setLanguage("en-US");
//     await flutterTts.setPitch(1.0);
//     await flutterTts.setSpeechRate(0.4);
//     await flutterTts.speak(text);

//     flutterTts.setCompletionHandler(() {
//       isPlaying[index] = false;
//       emit(MessageSpeaking(index: index, isPlaying: false));
//     });
//   }

//   void stopSpeaking(int index) {
//     flutterTts.stop();
//     isPlaying[index] = false;
//     emit(MessageSpeaking(index: index, isPlaying: false));
//   }

//   void toggleAdditionalWidgets() {
//     isTextFieldExpanded = !isTextFieldExpanded;
//     // showAdditionalWidgets = !showAdditionalWidgets;
//     emit(TextFieldExpanded(isTextFieldExpanded));
//   }
// }
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'bottomBar_state.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class BottomBarCubit extends Cubit<BottomBarState> {
  final stt.SpeechToText speech = stt.SpeechToText();
  Map<int, bool> isPlaying = {};
  final FlutterTts flutterTts = FlutterTts();

  bool isTextFieldExpanded = false;

  BottomBarCubit() : super(SpeechInitial());

  Future<void> startListening() async {
    bool available = await speech.initialize(
      onStatus: (val) => log("onStatus: $val"),
      onError: (val) {
        log("onError: $val");
        emit(SpeechError(error: val.errorMsg));
      },
    );
    if (available) {
      log('Speech recognition available');
      emit(const SpeechListening(recognizedText: ''));
      speech.listen(onResult: (val) {
        log("Recognized words: ${val.recognizedWords}");
        emit(SpeechListening(recognizedText: val.recognizedWords));
      });
    } else {
      log('Speech recognition not available');
      emit(const SpeechError(error: 'Speech recognition not available'));
    }
  }

  void stopListening() {
    speech.stop();
    emit(SpeechStopped());
    log("Stopped Listening");
  }

  void toggleTextField(bool isExpanded) {
    isTextFieldExpanded = isExpanded;
    emit(TextFieldExpanded(isExpanded));
  }

  Future<void> speak(String text, int index) async {
    isPlaying[index] = true;
    emit(MessageSpeaking(index: index, isPlaying: true));

    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.4);
    await flutterTts.speak(text);

    flutterTts.setCompletionHandler(() {
      isPlaying[index] = false;
      emit(MessageSpeaking(index: index, isPlaying: false));
    });
  }

  void stopSpeaking(int index) {
    flutterTts.stop();
    isPlaying[index] = false;
    emit(MessageSpeaking(index: index, isPlaying: false));
  }
}
