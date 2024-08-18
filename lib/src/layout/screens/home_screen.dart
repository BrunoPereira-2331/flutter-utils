import 'package:flutter/material.dart';
import 'package:flutter_utils/src/constants/app_routes.dart';
import 'package:flutter_utils/src/layout/helpers/media_query_size_helper.dart';

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
    Size mediaQuerySize = MediaQuerySizeHelper(context).sizeProperties();
    deviceAvaliableHeight = mediaQuerySize.height;
    deviceAvaliableWidth = mediaQuerySize.width;

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: deviceAvaliableHeight,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                child: const Text(
                  "Patterns",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              SizedBox(
                height: deviceAvaliableHeight * 0.50,
                width: deviceAvaliableWidth,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue),
                        ),
                        onPressed: () => Navigator.pushNamed(
                            context, AppRoutes.singletonTaskListScreen),
                        child: const Text("Singleton", style: TextStyle(
                          color: Colors.white
                        ),),
                      );
                    }),
              ),
              // TextButton(
              //   child: Text("Login Screen"),
              //   onPressed: () async {
              //     Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
