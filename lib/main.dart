import 'package:flutter/material.dart';
import 'package:health_application/view/screens/entradas_log_screen.dart';
import 'package:health_application/view/screens/logo_screen.dart';
import 'package:health_application/view/screens/main_page.dart';
import 'view/screens/caminho_class.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  Telas telas = Telas();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        telas.TELA_LOGO: (context) => LogoScreen(),
        telas.TELA_INICIAL: (context) => MainPage(),
        telas.TELA_ENTRADA_DADOS: (context) => EntradasLogScreen(),
      },
    );
  }
}
