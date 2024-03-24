// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_utils/main.dart';
import 'package:flutter_utils/src/screens/login_screen.dart';

import '../utils/test_utils.dart';

void main() {
  group("Tests for the BaseScaffold Widget", () {
    testWidgets("Should start app at login screen", (widgetTester) async {
      await widgetTester.pumpWidget(const MainApp());

      
      final findLoginScreen = find.byWidget(LoginScreen());;

      expect(findLoginScreen, findsOneWidget);
    });
    // testWidgets("Should have a SafeArea widget", (widgetTester) async {
    //   // await widgetTester.pumpWidget(BaseScaffold(
    //   //     showAppBar: true, baseAppBar: CustomAppBar(), bodyWidget: Container()));
    //   await widgetTester.pumpWidget(TestsUtils.makeMaterialApp(
    //       homeWidget: Scaffold(
    //     body: Container(),
    //   )));
    //   final findCustomAppBar = find.byType(SafeArea);

    //   expect(findCustomAppBar, findsWidgets);
    // });
  });
}
