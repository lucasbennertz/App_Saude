import 'package:flutter/material.dart';
import 'package:health_application/model/info_saude.dart';
import 'package:health_application/view/screens/caminho_class.dart';

class CardSaude extends StatelessWidget {
  final InfoSaude saude;
  final CaminhoClass telas;
  const CardSaude({required this.saude, required this.telas, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (saude.idInfoSaude == 4) {
          Navigator.of(context).pushNamed(telas.TELA_ENTRADA_DADOS);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 90,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(),
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      saude.nomeInfoSaude,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      saude.descricao,
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Icon(Icons.info_outline, color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
