import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tictactoe/common/app_colors.dart';

import '../../../controllers/bloc/tictac_bloc/tic_tac_bloc.dart';

class TicTacBoard extends StatelessWidget {
  final List<String> displayElement;
  const TicTacBoard({
    Key? key,
    required this.displayElement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          itemCount: 9,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                BlocProvider.of<TicTacBloc>(context).add(DrawEvent(index));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor1,
                  border: Border.all(color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    displayElement[index],
                    style: const TextStyle(color: Colors.white, fontSize: 35),
                  ),
                ),
              ),
            );
          },
        ),
        // Container(
        //   color: Colors.red,
        //   height: 200,
        // ),
      ],
    );
  }
}
