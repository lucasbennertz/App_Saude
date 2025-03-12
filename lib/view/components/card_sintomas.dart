import 'package:flutter/material.dart';
import 'package:health_application/controller/database.dart';
import 'package:health_application/model/info_sintoma.dart';
import 'package:intl/intl.dart';

class CardSintomas extends StatelessWidget {
  final InfoSintoma infoSintoma;
  final DatabaseHelper banco;
  final Function() onDelete; // Adiciona um callback para atualizar a UI
  const CardSintomas({
    super.key,
    required this.infoSintoma,
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
            banco.deleteInfoSintoma(infoSintoma.sintomaId);
            // Chama o callback para atualizar a lista
            onDelete();
          },
          icon: Icon(Icons.restore_from_trash),
        ),
        title: Text("${infoSintoma.sintoma}"),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Data: ${DateFormat('dd/MM/yyyy').format(infoSintoma.data)}"), // Exibe apenas a data (sem a hora)
          ],
        ),
      ),
    );
  }
}
