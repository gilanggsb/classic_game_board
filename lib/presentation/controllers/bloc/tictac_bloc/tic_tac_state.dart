part of 'tic_tac_bloc.dart';

abstract class TicTacState extends Equatable {
  const TicTacState();

  @override
  List<Object> get props => [];
}


class DrawBoardState extends TicTacState {
  final TicTacEntities ticTacEntities;
  const DrawBoardState(this.ticTacEntities);
  @override
  List<Object> get props => [ticTacEntities];
}
class LoadingState extends TicTacState{}

class GameDrawState extends TicTacState{}