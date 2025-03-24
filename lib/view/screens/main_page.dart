import 'package:flutter/material.dart';
import 'package:health_application/controller/data.dart';
import 'package:health_application/model/user_model.dart';
import 'package:health_application/view/components/my_app_bar.dart';
import 'package:health_application/view/components/card_boas_vindas.dart';
import 'package:health_application/view/components/card_saude.dart';
import 'package:health_application/view/screens/caminho_class.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  static Data dados = Data();
  
  @override
  Widget build(BuildContext context) {
    return Consumer<UserModel>(builder: (context, value, child) {
      return Scaffold(
      appBar: MyAppBar(title: "InstantSOS"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardBoasVindas(nome: value.nome,),
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
                          telas: CaminhoClass(),
                        );
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
    },);
  }
}
