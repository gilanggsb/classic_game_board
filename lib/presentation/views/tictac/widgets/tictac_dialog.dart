import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controllers/bloc/tictac_bloc/tic_tac_bloc.dart';

Future<void> showTicTacDialog(BuildContext blocContext, bool isDraw,
    {String content = ''}) {
  return showDialog<void>(
    context: blocContext,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Center(child: Text('Tic Tac Dialog')),
        content: Text(isDraw ? 'Game Draw!' : content),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('OK'),
            onPressed: () {
              BlocProvider.of<TicTacBloc>(blocContext).add(NewGameEvent());
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
