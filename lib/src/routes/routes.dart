import 'package:flutter/material.dart';
import 'package:flutter_utils/src/constants/app_routes.dart';
import 'package:flutter_utils/src/screens/error_screen.dart';
import 'package:flutter_utils/src/screens/home_screen.dart';

class Routes {
  static Route<dynamic>? generate(RouteSettings settings) {
    dynamic screen;

    try {
      switch (settings.name) {
        case AppRoutes.homeScreenRoute:
          screen =  const HomeScreen();
          break;
        default:
          screen =  const HomeScreen();
      }
    } catch (e) {
      screen = const ErrorScreen();
    }
    return MaterialPageRoute(builder: (_) => screen);

  }
}
