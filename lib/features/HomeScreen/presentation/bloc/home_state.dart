
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final List<String> messages;
  final String? selectedValue;
  final String? recognizedText;
  final String? dropdownValue;

  const HomeState({
    this.messages = const [],
    this.recognizedText,
    this.selectedValue,
    this.dropdownValue,
  });

  @override
  List get props => [messages, recognizedText, selectedValue, dropdownValue];
  HomeState copyWith({
    String? dropdownValue,
    List<String>? messages,
    String? recognizedText,
    String? selectedValue,
  }) {
    return HomeState(
      dropdownValue: dropdownValue ?? this.dropdownValue,
      selectedValue: selectedValue ?? this.selectedValue,
      recognizedText: recognizedText ?? this.recognizedText, // Fixed this line
      messages: messages ?? this.messages,
    );
  }
}

// Various HomeState subclasses
class HomeInitial extends HomeState {}

class HomeUpdated extends HomeState {
  const HomeUpdated({
    required List<String> messages,
    String? selectedValue,
    String? recognizedText,
  }) : super(
          messages: messages,
          selectedValue: selectedValue,
          recognizedText: recognizedText,
        );
}

class SearchScreenVisible extends HomeState {}

// class MessageReadyState extends HomeState {}

class ChatScreenVisible extends HomeState {
  const ChatScreenVisible({
    List<String> messages = const [],
    String? recognizedText,
  }) : super(messages: messages, recognizedText: recognizedText);
}
