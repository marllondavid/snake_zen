import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snake_zen/src/app_widget.dart';
import 'package:snake_zen/src/models/game_state.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => GameState()),
      ChangeNotifierProvider(create: (_) => ValueNotifier<bool>(false)),
    ],
    child: const AppWidget(),
  ));
}
