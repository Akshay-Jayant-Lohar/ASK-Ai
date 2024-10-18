// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:ask/features/HomeScreen/presentation/bloc/home_state.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;

// class HomeCubit extends Cubit<HomeState> {
//   final stt.SpeechToText speech = stt.SpeechToText();
//   HomeCubit() : super(HomeInitial());

//   void addMessage(String message) {
//     final updatedMessages = List<String>.from(state.messages)..add(message);
//     emit(HomeUpdated(
//         messages: updatedMessages,
//         selectedValue: state.selectedValue,
//         recognizedText: state.recognizedText));
//   }

//   void updateDropdownValue(String? newValue) {
//     emit(state.copyWith(dropdownValue: newValue));
//   }

//   void autoReply() {
//     Future.delayed(const Duration(seconds: 2), () {
//       final updatedMessages = List<String>.from(state.messages)
//         ..add('This is an auto-reply.');
//       emit(HomeUpdated(
//           messages: updatedMessages, selectedValue: state.selectedValue));
//     });
//   }

//   void selectDropdown(String? value) {
//     emit(HomeUpdated(messages: state.messages, selectedValue: value));
//   }
//   void finishSplash() {
//     emit(SearchScreenVisible());
//   }

//   void showChatScreen() {
//     emit(ChatScreenVisible(messages: state.messages, recognizedText: state.recognizedText));
//   }
// }
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ask/features/HomeScreen/presentation/bloc/home_state.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class HomeCubit extends Cubit<HomeState> {
  final stt.SpeechToText speech = stt.SpeechToText();
  HomeCubit() : super(HomeInitial());

  // Adds a new message to the message list
  void addMessage(String message) {
    final updatedMessages = List<String>.from(state.messages)..add(message);
    print("New message added: $updatedMessages");
    emit(HomeUpdated(
      messages: updatedMessages,
      selectedValue: state.selectedValue,
      recognizedText: state.recognizedText,
    ));
  }

  // Updates the dropdown value and emits a new state
  void updateDropdownValue(String? newValue) {
    emit(state.copyWith(dropdownValue: newValue));
  }

  // Simulates an auto-reply after a delay
  void autoReply() {
    Future.delayed(const Duration(seconds: 2), () {
      final updatedMessages = List<String>.from(state.messages)
        ..add('This is an auto-reply.');
      emit(HomeUpdated(
        messages: updatedMessages,
        selectedValue: state.selectedValue,
        recognizedText: state.recognizedText,
        // Keep state consistent
      ));
    });
  }

  // Sets the selected dropdown value
  void selectDropdown(String? value) {
    emit(HomeUpdated(
      messages: state.messages,
      selectedValue: value,
      recognizedText: state.recognizedText, // Maintain other state fields
    ));
  }

  // Triggers transition to the search screen
  void finishSplash() {
    emit(SearchScreenVisible());
  }

  // Triggers transition to the chat screen
  void showChatScreen() {
    emit(ChatScreenVisible(
      messages: state.messages,
      recognizedText: state.recognizedText,
    ));
  }
}
