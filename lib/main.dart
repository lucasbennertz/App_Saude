import 'package:flutter/material.dart';
import 'package:health_application/view/screens/infos_screens.dart';
import 'package:health_application/view/screens/entradas_log_screen.dart';
import 'package:health_application/view/screens/login_screen.dart';
import 'package:health_application/view/screens/logo_screen.dart';
import 'package:health_application/view/screens/main_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'view/screens/caminho_class.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  // Run your app after Supabase is initialized
  runApp(MainApp());
}

// ignore: must_be_immutable
class MainApp extends StatelessWidget {
  MainApp({super.key});
  CaminhoClass caminhos = CaminhoClass();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        caminhos.TELA_LOGO: (context) => LogoScreen(),
        caminhos.TELA_INICIAL: (context) => MainPage(),
        caminhos.TELA_ENTRADA_DADOS: (context) => EntradasLogScreen(),
        caminhos.TELA_INFORMACOES: (context) => InfosScreens(),
        caminhos.TELA_LOGIN: (context) => LoginScreen()
      },
    );
  }
}
