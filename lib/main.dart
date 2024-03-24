import 'package:flutter/material.dart';
import 'package:flutter_utils/src/routes/routes.dart';
import 'package:flutter_utils/src/screens/login_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      onGenerateRoute: (RouteSettings settings) => Routes.generate(settings),
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}
