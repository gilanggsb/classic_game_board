import 'package:flutter/material.dart';
import 'package:tictactoe/common/app_colors.dart';
import 'package:tictactoe/common/app_navigation.dart';
import 'package:tictactoe/common/app_routes.dart';
import 'package:tictactoe/presentation/views/components/default_button_components.dart';
import 'package:tictactoe/presentation/views/tictac/tictac_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor2,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            DefaultButtonComponent(
                onPressed: () => AppNavigator.pushNamed(AppRoutes.tictactoe),
                title: 'Tic Tac Toe')
          ],
        ),
      ),
    );
  }
}
