import 'package:flutter/material.dart';
import 'package:webtoon/screen/home_screen.dart';
import 'package:webtoon/service/api_service.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
