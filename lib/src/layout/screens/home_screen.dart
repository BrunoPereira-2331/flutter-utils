import 'package:flutter/material.dart';
import 'package:flutter_utils/src/constants/app_routes.dart';
import 'package:flutter_utils/src/layout/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late double deviceAvaliableHeight;
  late double deviceAvaliableWidth;

  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    deviceAvaliableHeight = mediaQuery.size.height;
    deviceAvaliableWidth = mediaQuery.size.width;

    return Scaffold(
      body: Container(
        height: deviceAvaliableHeight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Home Screen"),
            TextButton(
              child: Text("Exit"),
              onPressed: () async {
                await Future.delayed(Duration(seconds: 1));
                Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
