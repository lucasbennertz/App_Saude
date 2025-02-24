import 'package:flutter/material.dart';
import 'package:health_application/controller/data.dart';
import 'package:health_application/view/components/card_boas_vindas.dart';
import 'package:health_application/view/components/card_saude.dart';
import 'package:health_application/view/screens/caminho_class.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  static Data dados = Data();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7FB5AF),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("assets/images/Instant_SOS.png", height: 55),
            Text("InstantSOS"),
            CircleAvatar(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardBoasVindas(),
            SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/Imagem-relaxante.png',
                    width: double.infinity,
                    height: 750,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics:
                          NeverScrollableScrollPhysics(), // Disables scrolling here since SingleChildScrollView already does it
                      itemCount:
                          dados
                              .informacoes
                              .length, // The length of the data list
                      itemBuilder: (context, index) {
                        var info = dados.informacoes[index];
                        return CardSaude(
                          saude: info,
                          telas: Telas(),
                        ); // Assuming you want to display each item in a custom card
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
