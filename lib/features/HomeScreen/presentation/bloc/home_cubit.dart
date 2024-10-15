import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ask/features/HomeScreen/presentation/bloc/home_state.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class HomeCubit extends Cubit<HomeState> {
  final stt.SpeechToText speech = stt.SpeechToText();
  HomeCubit() : super(HomeInitial());

  void addMessage(String message) {
    final updatedMessages = List<String>.from(state.messages)..add(message);
    emit(HomeUpdated(
        messages: updatedMessages,
        selectedValue: state.selectedValue,
        recognizedText: state.recognizedText));
  }

  void updateDropdownValue(String? newValue) {
    emit(state.copyWith(dropdownValue: newValue));
  }

  void autoReply() {
    Future.delayed(const Duration(seconds: 2), () {
      final updatedMessages = List<String>.from(state.messages)
        ..add('This is an auto-reply.');
      emit(HomeUpdated(
          messages: updatedMessages, selectedValue: state.selectedValue));
    });
  }

  void selectDropdown(String? value) {
    emit(HomeUpdated(messages: state.messages, selectedValue: value));
  }
  void finishSplash() {
    emit(SearchScreenVisible());
  }

  void showChatScreen() {
    emit(ChatScreenVisible(messages: state.messages, recognizedText: state.recognizedText));
  }
}
