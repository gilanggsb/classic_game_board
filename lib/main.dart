import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'common/app_navigation.dart';
import 'common/app_routes.dart';
import 'presentation/controllers/bloc/tictac_bloc/tic_tac_bloc.dart';
import 'presentation/views/main_screen.dart';
import 'presentation/views/tictac/tictac_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TicTacBloc(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: navigationKey,
        routes: {
          AppRoutes.tictactoe: (context) => const TicTacScreen(),
        },
        home: const MainScreen(),
      ),
    );
  }
}
