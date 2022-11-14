import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:tictactoe/domain/entities/tictac_entities.dart';

part 'tic_tac_event.dart';
part 'tic_tac_state.dart';

class TicTacBloc extends Bloc<TicTacEvent, TicTacState> {
  static final List winCondition = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];
  TicTacEntities ticTacEntities = TicTacEntities(
      displayElement: ['', '', '', '', '', '', '', '', ''],
      isXWin: false,
      isOWin: false,
      isDraw: false,
      oScore: 0,
      xScore: 0);
  bool oTurn = true;
  bool isDraw = false;
  List<int> getOBox = [];
  List<int> getXBox = [];
  TicTacBloc()
      : super(DrawBoardState(TicTacEntities(
            displayElement: ['', '', '', '', '', '', '', '', ''],
            isXWin: false,
            isOWin: false,
            isDraw: false,
            oScore: 0,
            xScore: 0))) {
    on<DrawEvent>((event, emit) {
      drawBoard(event.index, emit);
    });

    on<ResetScoreEvent>((event, emit) {
      resetScore(emit);
    });

    on<NewGameEvent>(((event, emit) {
      newGame(emit);
    }));
  }
  void drawBoard(int index, emit) {
    if (!isWinner()) {
      emit(LoadingState());
      if (oTurn && ticTacEntities.displayElement[index] == '') {
        ticTacEntities.displayElement[index] = 'O';
        oTurn = !oTurn;
      }

      if (!oTurn && ticTacEntities.displayElement[index] == '') {
        ticTacEntities.displayElement[index] = 'X';
        oTurn = !oTurn;
      }
      checkWinner(emit);
    }
  }

  void checkWinner(emit) {
    clearOXBox();
    for (int i = 0; i < ticTacEntities.displayElement.length; i++) {
      if (ticTacEntities.displayElement[i] == 'O') {
        getOBox.add(i);
      } else if (ticTacEntities.displayElement[i] == 'X') {
        getXBox.add(i);
      }
    }

    //check isGame Draw
    if (getOBox.length == 5 && !isWinner()) {
      changeProperties(ticTacEntities.copyWith(isDraw: true));
    }
    //check isGame Win
    for (List<int> element in winCondition) {
      if (!isWinner()) {
        int score = ticTacEntities.xScore;
        bool isXWin = listEquals(
          element,
          getXBox,
        );
        changeProperties(ticTacEntities.copyWith(
          isXWin: isXWin,
          xScore: isXWin ? score += 1 : score,
        ));
      }
      if (!isWinner()) {
        int score = ticTacEntities.oScore;
        bool isOWin = listEquals(
          element,
          getOBox,
        );
        changeProperties(ticTacEntities.copyWith(
          isOWin: isOWin,
          oScore: isOWin ? score += 1 : score,
        ));
      }
    }
    emit(DrawBoardState(ticTacEntities));
  }

  void newGame(emit) {
    // emit(LoadingState());
    ticTacEntities.displayElement.clear();
    isDraw = false;
    clearOXBox();
    for (int i = 0; i <= 9; i++) {
      ticTacEntities.displayElement.add('');
    }
    changeProperties(ticTacEntities.copyWith(
      isXWin: false,
      isOWin: false,
      isDraw: false,
    ));
    oTurn = true;
    emit(DrawBoardState(ticTacEntities));
  }

  void resetScore(emit) {
    changeProperties(ticTacEntities.copyWith(
      oScore: 0,
      xScore: 0,
    ));
    emit(DrawBoardState(ticTacEntities));
  }

  void changeProperties(TicTacEntities entities) {
    ticTacEntities = entities;
  }

  bool isWinner() => ticTacEntities.isXWin || ticTacEntities.isOWin;
  void clearOXBox() {
    getOBox.clear();
    getXBox.clear();
  }
}
