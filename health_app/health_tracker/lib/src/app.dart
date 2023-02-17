// Flutter imports:
import 'package:flutter/material.dart';
import 'package:health_tracker/src/presentation/pages/main_page.dart';
import 'package:localizations/localizations.dart';
import 'package:theme_data/theme_data.dart';

class App extends StatelessWidget {
  final MainPageFactory mainPageFactory;

  const App({
    Key? key,
    required this.mainPageFactory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemeData.getTheme(),
        // ignore: prefer_const_literals_to_create_immutables, always_specify_types
        localizationsDelegates: [
          Strings.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        // ignore: prefer_const_literals_to_create_immutables
        supportedLocales: <Locale>[
          const Locale('en', ''),
        ],
        home: mainPageFactory());
  }
}
