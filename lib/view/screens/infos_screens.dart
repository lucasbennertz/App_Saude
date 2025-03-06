import 'package:flutter/material.dart';
import 'package:health_application/model/info_saude.dart';
import 'package:health_application/view/components/my_app_bar.dart';
import 'package:health_application/view/components/card_infos.dart';

class InfosScreens extends StatelessWidget {
  const InfosScreens({super.key});

  @override
  Widget build(BuildContext context) {
    // Extracting data passed via Navigator
    InfoSaude saude = ModalRoute.of(context)!.settings.arguments as InfoSaude;
    String saudeTitle = saude.nomeInfoSaude;
    List<String> saudePassos = saude.passos;

    return Scaffold(
      appBar: MyAppBar(title: saudeTitle),
      body: Column(
        children: [
          // Wrapping ListView.builder with Expanded ensures it gets proper layout constraints
          Expanded(
            child: ListView.builder(
              itemCount: saudePassos.length,
              itemBuilder: (context, index) {
                return CardInfos(
                  cardNumber: index,
                  descricao: saudePassos[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
