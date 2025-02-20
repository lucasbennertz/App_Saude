import 'package:flutter/material.dart';
import 'package:health_application/view/screens/main_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MainPage(),
      initialRoute: '/',
      routes: {
        '/' : (context) => MainPage(),
        
      },
    );
  }
}
