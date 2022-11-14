import 'package:flutter/material.dart';
import 'package:tictactoe/common/app_colors.dart';

class ScoreBoard extends StatelessWidget {
  final int xScore;
  final int oScore;
  const ScoreBoard({
    Key? key,
    required this.xScore,
    required this.oScore,
  }) : super(key: key);
  Widget buildNameAndScore(bool isX, int score) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: isX,
            child: Row(
              children: [
                const Text(
                  "X",
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 20,
                  ),
                ),
                Text(
                  ' : $score',
                  style:
                      const TextStyle(color: AppColors.textColor, fontSize: 20),
                ),
              ],
            ),
          ),
          Visibility(
            visible: !isX,
            child: Row(
              children: [
                Text(
                  "$score : ",
                  style:
                      const TextStyle(color: AppColors.textColor, fontSize: 20),
                ),
                const Text(
                  "O",
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor1,
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      child: IntrinsicWidth(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "SCORE",
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 20,
              ),
            ),
            const Divider(
              height: 10,
              thickness: 1,
              indent: 1,
              endIndent: 1,
              color: AppColors.textColor,
            ),
            IntrinsicHeight(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildNameAndScore(true, xScore),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: const VerticalDivider(
                      color: AppColors.textColor,
                      thickness: 1,
                      width: 12,
                    ),
                  ),
                  buildNameAndScore(false, oScore),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
