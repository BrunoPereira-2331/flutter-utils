import 'package:flutter/material.dart';
import 'package:flutter_utils/src/core/shared/settings.dart';
import 'package:flutter_utils/src/patterns/singleton/features/task_list/viewmodel/task_list_view_model.dart';
import 'package:flutter_utils/src/routes/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.settings}) : super(key: key);

  final Settings settings;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: settings,
      builder: (BuildContext context, Widget? child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => TaskListViewModel(),
            ),
          ],
          child: MaterialApp(
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('pt', 'BR'),
              Locale('en', 'US'),
              Locale('es', 'ES'),
            ],
            onGenerateRoute: (RouteSettings settings) =>
                Routes.generate(settings),
            home: Routes.getHome(),
          ),
        );
      },
    );
  }
}
