import 'package:flutter/material.dart';
import 'package:health_application/controller/database.dart';
import 'package:health_application/model/info_peso.dart';

class CardPesos extends StatelessWidget {
  final InfoPeso infoPeso;
  final DatabaseHelper banco;
  final Function() onDelete; // Adiciona um callback para atualizar a UI
  const CardPesos({
    super.key,
    required this.infoPeso,
    required this.banco,
    required this.onDelete, // Recebe o callback
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      child: ListTile(
        trailing: IconButton(
          onPressed: () {
            // Chama o método de exclusão no banco de dados
            banco.deleteInfoPeso(infoPeso.peso_ID);
            // Chama o callback para atualizar a lista
            onDelete();
          },
          icon: Icon(Icons.restore_from_trash),
        ),
        title: Text("Peso: ${infoPeso.peso} kg"),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Altura: ${infoPeso.altura} m"),
            Text("IMC: ${infoPeso.calcularIMC().toStringAsFixed(2)}"), // Chama o método para calcular o IMC
            Text("Data: ${infoPeso.data.toLocal().toString().split(' ')[0]}"), // Exibe apenas a data (sem a hora)
          ],
        ),
      ),
    );
  }
}
