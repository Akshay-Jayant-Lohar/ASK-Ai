import 'dart:async';
import 'package:bloc/bloc.dart';

class SplashCubit extends Cubit<bool> {
  SplashCubit() : super(false);

  void showBotImage() {
    emit(true);
  }

  void showBotImageAfterDelay() {
    Timer(const Duration(seconds: 3), () {
      emit(true);  
    });
  }
}
