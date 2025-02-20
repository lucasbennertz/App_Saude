import 'package:flutter/material.dart';
import 'package:health_application/controller/data.dart';
import 'package:health_application/view/components/card_saude.dart';

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
            Text("InstantSOS"),
            CircleAvatar()
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFDADCE0),
                  borderRadius: BorderRadius.circular(25),
                ),
                width: double.infinity,
                height: 180,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Seja bem vindo ", style: TextStyle(fontSize: 20)),
                          Text("Fulana(o)!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Text("Em que podemos ajuda-lo hoje?"),
                    ],
                  ),
                ),
              ),
            ),
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
                      physics: NeverScrollableScrollPhysics(), // Disables scrolling here since SingleChildScrollView already does it
                      itemCount: dados.informacoes.length, // The length of the data list
                      itemBuilder: (context, index) {
                        var info = dados.informacoes[index];
                        return CardSaude(saude: info,); // Assuming you want to display each item in a custom card
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
