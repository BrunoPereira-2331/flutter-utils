import 'package:flutter/material.dart';
import 'package:flutter_utils/src/core/shared/settings.dart';
import 'package:flutter_utils/src/layout/screens/home_screen.dart';
import 'package:flutter_utils/src/routes/routes.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.settings}) : super(key: key);

  final Settings settings;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: settings,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          onGenerateRoute: (RouteSettings settings) =>
              Routes.generate(settings),
          home: const Scaffold(
            body: HomeScreen(),
          ),
        );
      },
    );
  }
}
