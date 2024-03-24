import 'package:flutter/material.dart';

class TestsUtils {

  static MaterialApp makeMaterialApp({required Widget homeWidget}) {
    return MaterialApp(
        theme: ThemeData(),
        debugShowCheckedModeBanner: false,
        home: homeWidget,
      );
  }
}