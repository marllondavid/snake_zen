import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:snake_zen/src/pages/game_snake_page.dart';
import 'package:snake_zen/src/utils/constants/global_theme_data.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<ValueNotifier<bool>>().value;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode
          ? GlobalThemeData.darkThemeData
          : GlobalThemeData.lightThemeData,
      routes: {
        '/': (context) => const GameSnakePage(),
      },
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
    );
  }
}
