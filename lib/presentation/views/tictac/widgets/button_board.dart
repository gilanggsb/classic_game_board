import 'package:flutter/material.dart';
import 'package:tictactoe/common/app_colors.dart';

class ButtonBoard extends StatelessWidget {
  final Function() onPress;
  final String title;
  const ButtonBoard({super.key, required this.onPress, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondaryColor1,
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.textColor,
          fontSize: 24,
        ),
      ),
    );
  }
}
