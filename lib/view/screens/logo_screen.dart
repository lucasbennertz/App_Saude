import 'package:flutter/material.dart';
import 'package:health_application/view/screens/caminho_class.dart';

class LogoScreen extends StatefulWidget {
  LogoScreen({super.key});
  CaminhoClass tela = CaminhoClass();

  @override
  State<LogoScreen> createState() => _LogoScreenState();

  Future<void> direcionarTela(BuildContext context) async {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).popAndPushNamed(tela.TELA_INICIAL);
    });
  }
}

class _LogoScreenState extends State<LogoScreen> {
  @override
  void initState() {
    super.initState();
    widget.direcionarTela(context); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFF7FB5AF),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset("assets/images/Instant_SOS.png"),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
