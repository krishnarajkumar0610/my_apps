import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/bloc/events.dart';
import 'package:instagram/bloc/states.dart';

class InstaBloc extends Bloc<InstaEvents, InstaStates> {
  InstaBloc() : super(InstaStates()) {
    on<ThemeEvent>((event, emit) {
      emit(InstaStates(themeStatus: true));
    });
  }
}
