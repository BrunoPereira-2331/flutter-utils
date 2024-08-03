import 'package:flutter/material.dart';
import 'package:flutter_utils/src/layout/screens/error_screen.dart';
import 'package:flutter_utils/src/layout/screens/home_screen.dart';
import 'package:flutter_utils/src/layout/screens/login_screen.dart';

class Routes {

  static Route<dynamic>? generate(RouteSettings settings) {
    dynamic screen;

    try {
      switch (settings.name) {
        case "/home":
          screen = const HomeScreen();
          break;
        default:
          screen = const LoginScreen();
      }
    } catch (e) {
      screen = const ErrorScreen();
    }
    return MaterialPageRoute(builder: (_) => const HomeScreen());
  }

  static Route<dynamic>? getDefaultRoute() {
    return MaterialPageRoute(builder: (_) => Container());
  }

  static Widget getHome() {
    return const LoginScreen();
  }
}
