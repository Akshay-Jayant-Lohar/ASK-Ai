import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'bottomBar_state.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class BottomBarCubit extends Cubit<BottomBarState> {
  final stt.SpeechToText speech = stt.SpeechToText(); 
  Map<int, bool> isPlaying = {};
  final FlutterTts flutterTts = FlutterTts();
  BottomBarCubit() : super(SpeechInitial());
  bool isTextFieldExpanded = false;
  bool showAdditionalWidgets = true;

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
        // Emit the recognized words
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
    //mit(TextFieldExpanded(isExpanded));
    isTextFieldExpanded = isExpanded;
    emit(TextFieldExpanded(isExpanded));
    if (!isExpanded) {
      // When collapsing the text field, hide the additional widgets
      toggleAdditionalWidgets();
    }
  }

  void clearTextField() {
    emit(const TextFieldExpanded(false));
  }

  Future<void> speak(String text, int index) async {
    // Set the playing state for the specific message
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

  void toggleAdditionalWidgets() {
    showAdditionalWidgets = !showAdditionalWidgets;
    emit(TextFieldExpanded(isTextFieldExpanded));
  }
}