import 'package:flutter/material.dart';
import 'package:uts_menu_bar_salsacamelia/screens/main_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
    );
  }
}