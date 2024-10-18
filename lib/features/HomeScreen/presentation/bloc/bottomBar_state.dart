// import 'package:equatable/equatable.dart';

// abstract class BottomBarState extends Equatable {
//   const BottomBarState();

//   @override
//   List<Object?> get props => [];
// }

// class SpeechInitial extends BottomBarState {}

// class SpeechListening extends BottomBarState {
//   final String recognizedText;

//   const SpeechListening({required this.recognizedText});

//   @override
//   List<Object?> get props => [recognizedText];
// }

// class SpeechError extends BottomBarState {
//   final String error;

//   const SpeechError({required this.error});

//   @override
//   List<Object?> get props => [error];
// }

// class SpeechStopped extends BottomBarState {}

// class MessageSpeaking extends BottomBarState {
//   final int index;
//   final bool isPlaying;

//   const MessageSpeaking({required this.index, required this.isPlaying});

//   @override
//   List<Object?> get props => [index, isPlaying];
// }

// class TextFieldExpanded extends BottomBarState {
//   final bool isExpanded;

//   const TextFieldExpanded(this.isExpanded);

//   @override
//   List<Object?> get props => [isExpanded];
// }

// class AdditionalWidgetsToggled extends BottomBarState {
//   final bool showAdditionalWidgets;
//   const AdditionalWidgetsToggled(this.showAdditionalWidgets);
//   @override
//   List<Object?> get props => [showAdditionalWidgets];
// }
import 'package:equatable/equatable.dart';

abstract class BottomBarState extends Equatable {
  const BottomBarState();

  @override
  List<Object?> get props => [];
}

class SpeechInitial extends BottomBarState {}

class SpeechListening extends BottomBarState {
  final String recognizedText;

  const SpeechListening({required this.recognizedText});

  @override
  List<Object?> get props => [recognizedText];
}

class SpeechError extends BottomBarState {
  final String error;

  const SpeechError({required this.error});

  @override
  List<Object?> get props => [error];
}

class SpeechStopped extends BottomBarState {}

class MessageSpeaking extends BottomBarState {
  final int index;
  final bool isPlaying;

  const MessageSpeaking({required this.index, required this.isPlaying});

  @override
  List<Object?> get props => [index, isPlaying];
}

class TextFieldExpanded extends BottomBarState {
  final bool isExpanded;

  const TextFieldExpanded(this.isExpanded);

  @override
  List<Object?> get props => [isExpanded];
}
