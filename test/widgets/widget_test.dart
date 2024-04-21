// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_utils/src/app.dart';
import 'package:flutter_utils/src/core/settings.dart';
import 'package:flutter_utils/src/layout/screens/login_screen.dart';


void main() {
  group("Tests for the BaseScaffold Widget", () {
    testWidgets("Should start app at login screen", (widgetTester) async {
      await widgetTester.pumpWidget(App(settings: Settings(),));

      
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
