import 'package:equatable/equatable.dart';

abstract class SelectPlayersModeState extends Equatable {}

class SinglePlayerModeState extends SelectPlayersModeState {
  @override
  List<Object?> get props => [];
}

class DoublePlayerModeState extends SelectPlayersModeState {
  @override
  List<Object?> get props => [];
}

class DummyModeState extends SelectPlayersModeState {
  @override
  List<Object?> get props => [];
}
