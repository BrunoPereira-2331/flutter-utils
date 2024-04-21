import 'package:flutter/material.dart';
import 'package:flutter_utils/src/constants/app_routes.dart';
import 'package:flutter_utils/src/layout/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            TextFormField(
              key: Key("usernameTextField"),
              controller: usernameTextController,
              decoration: const InputDecoration(hintText: "Username"),
            ),
            TextFormField(
              key: Key("passwordTextField"),
              controller: passwordTextController,
              decoration: const InputDecoration(hintText: "Password"),
            ),
            TextButton(
              key: Key("signUpButton"),
            child: Text("Sign up"),
              onPressed: () async {
                await Future.delayed(Duration(seconds: 1));
                Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
      
            }, 
            ),
          ],
        ),
      ),
    );
  }
}
