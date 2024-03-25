import 'package:bloc/bloc.dart';
import 'package:tic_tac_toe/bloc/select_player/select_player_event.dart';
import 'package:tic_tac_toe/bloc/select_player/select_player_state.dart';

class SelectPlayerModeBloc
    extends Bloc<SelectPlayersModeEvents, SelectPlayersModeState> {
  SelectPlayerModeBloc() : super(DummyModeState()) {
    on<SinglePlayerEvent>((event, emit) {
      emit(SinglePlayerModeState());
    });
    on<DoublePlayerEvent>((event, emit) {
      emit(DoublePlayerModeState());
    });
  }
}
