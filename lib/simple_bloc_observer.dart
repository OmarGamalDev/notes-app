import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('change=$change');
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('change=$bloc closed');
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint('change=$bloc created');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('change=$bloc error=$error');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    debugPrint('change=$bloc event=$event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint('change=$bloc transition=$transition');
  }
}
