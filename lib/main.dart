import 'package:flutter/material.dart';
import 'package:flutter_utils/src/app.dart';
import 'package:flutter_utils/src/core/shared/settings.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();
  Settings settings = Settings();
  runApp(App(settings: settings));
}
