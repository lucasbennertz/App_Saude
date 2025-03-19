import 'package:flutter/material.dart';
import 'package:health_application/view/screens/infos_screens.dart';
import 'package:health_application/view/screens/entradas_log_screen.dart';
import 'package:health_application/view/screens/login_screen.dart';
import 'package:health_application/view/screens/logo_screen.dart';
import 'package:health_application/view/screens/main_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'view/screens/caminho_class.dart';

const supabaseKey = String.fromEnvironment();

void main() async{
  await Supabase.initialize(
    url: 'https://jemzndqjndokhwkxklwf.supabase.co',
    anonKey: 'public-anon-key',
  );
  runApp(MainApp());
}
final supabase = Supabase.instance.client;
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
