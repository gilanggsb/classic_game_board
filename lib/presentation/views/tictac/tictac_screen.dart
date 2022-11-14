import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoe/common/app_colors.dart';
import 'package:tictactoe/domain/entities/tictac_entities.dart';
import 'package:tictactoe/presentation/views/tictac/widgets/button_board.dart';
import 'package:tictactoe/presentation/views/tictac/widgets/tictac_dialog.dart';

import '../../controllers/bloc/tictac_bloc/tic_tac_bloc.dart';
import 'widgets/score_board.dart';
import 'widgets/tictac_board.dart';

class TicTacScreen extends StatelessWidget {
  const TicTacScreen({super.key});
  bool isBothScoreZero(TicTacEntities entities) =>
      entities.oScore == 0 && entities.xScore == 0;

  void showSnackbar(context, state) {
    if (state is DrawBoardState) {
      if (state.ticTacEntities.isXWin &&
          !isBothScoreZero(state.ticTacEntities)) {
        showTicTacDialog(context, false, content: 'X Win');
      }
      if (state.ticTacEntities.isOWin &&
          !isBothScoreZero(state.ticTacEntities)) {
        showTicTacDialog(context, false, content: 'O Win');
      }
      if (state.ticTacEntities.isDraw ) {
        showTicTacDialog(context, true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tic Tac Toe"),
        toolbarHeight: 50.2,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20)),
        ),
        backgroundColor: AppColors.primaryColor2,
      ), //AppB
      backgroundColor: AppColors.secondaryColor2,
      body: Container(
        margin: const EdgeInsets.only(top: 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<TicTacBloc, TicTacState>(
              builder: (context, state) {
                return ScoreBoard(
                  xScore: (state as DrawBoardState).ticTacEntities.xScore,
                  oScore: state.ticTacEntities.oScore,
                );
              },
            ),
            const SizedBox(
              height: 50,
            ),
            BlocConsumer<TicTacBloc, TicTacState>(
              listener: (context, state) {
                showSnackbar(context, state);
              },
              builder: (context, state) {
                return TicTacBoard(
                    displayElement: (state as DrawBoardState)
                        .ticTacEntities
                        .displayElement);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonBoard(
                    title: 'Reset Score',
                    onPress: () => BlocProvider.of<TicTacBloc>(context)
                        .add(ResetScoreEvent())),
                const SizedBox(
                  width: 20,
                ),
                ButtonBoard(
                    title: 'New Game',
                    onPress: () => BlocProvider.of<TicTacBloc>(context)
                        .add(NewGameEvent())),
              ],
            )
          ],
        ),
      ),
    );
  }
}
