import 'package:flutter/material.dart';
import 'package:flutter_utils/src/constants/app_routes.dart';
import 'package:flutter_utils/src/layout/screens/error_screen.dart';
import 'package:flutter_utils/src/layout/screens/home_screen.dart';
import 'package:flutter_utils/src/layout/screens/login_screen.dart';
import 'package:flutter_utils/src/patterns/singleton/features/task_list/task_list.dart';
import 'package:flutter_utils/src/patterns/singleton/features/task_list/viewmodel/task_list_view_model.dart';
import 'package:provider/provider.dart';

class Routes {
  static Route<dynamic>? generate(RouteSettings settings) {
    dynamic builder;

    try {
      switch (settings.name) {
        case AppRoutes.homeScreen:
          builder = const HomeScreen();
          break;
        case AppRoutes.singletonTaskListScreen:
          builder = const TasksScreen();
          break;
        default:
          builder = const LoginScreen();
      }
    } catch (e) {
      builder = const ErrorScreen();
    }
    return MaterialPageRoute(builder: (_) => builder);
  }

  static Route<dynamic>? getDefaultRoute() {
    return MaterialPageRoute(builder: (_) => Container());
  }

  static Widget getHome() {
    return const HomeScreen();
  }
}
