import 'package:flutter/material.dart';
import 'package:health_application/controller/data.dart';
import 'package:health_application/model/user_model.dart';
import 'package:health_application/view/components/my_app_bar.dart';
import 'package:health_application/view/components/card_boas_vindas.dart';
import 'package:health_application/view/components/card_saude.dart';
import 'package:health_application/view/screens/caminho_class.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  static Data dados = Data();

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "InstantSOS"),
      body: Consumer<UserModel>(
        builder: (context, user, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                CardBoasVindas(nome: user.nome),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  child: Container(
                    width: double.infinity,
                    color: Colors.white, // Adicionando um fundo branco para contraste
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/Imagem-relaxante.png',
                          width: double.infinity,
                          height: 650, // Reduzi o tamanho da imagem para melhor disposição
                          fit: BoxFit.cover,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: MainPage.dados.informacoes.length,
                          itemBuilder: (context, index) {
                            var info = MainPage.dados.informacoes[index];
                            return CardSaude(
                              saude: info,
                              telas: CaminhoClass(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
