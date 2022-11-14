import 'package:flutter/material.dart';
import 'package:tictactoe/common/app_utils.dart';

final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

class AppNavigator {
  static pushNamed(String routeName, {Object? arguments}) {
    AppUtils.debugPrint(routeName);
    navigationKey.currentState?.pushNamed(routeName, arguments: arguments);
  }

  static pushReplacementNamed(String routeName, {Object? arguments}) {
    navigationKey.currentState
        ?.pushReplacementNamed(routeName, arguments: arguments);
  }

  static pushNamedAndRemoveUntil(String routeName, {Object? arguments}) {
    navigationKey.currentState?.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  static pop() => navigationKey.currentState?.pop();
}
