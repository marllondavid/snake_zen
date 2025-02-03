import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<ValueNotifier<bool>>().value;

    return IconButton(
      icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
      onPressed: () {
        context.read<ValueNotifier<bool>>().value = !isDarkMode;
      },
    );
  }
}
