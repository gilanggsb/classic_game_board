part of 'tic_tac_bloc.dart';

abstract class TicTacEvent extends Equatable {
  const TicTacEvent();

  @override
  List<Object> get props => [];
}

class GetTicTacData extends TicTacEvent {
  @override
  List<Object> get props => [];
}

class DrawEvent extends TicTacEvent {
  final int index;
  const DrawEvent(this.index);
  @override
  List<Object> get props => [index];
}
class ResetScoreEvent extends TicTacEvent{}
class NewGameEvent extends TicTacEvent{}
