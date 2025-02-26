import 'package:flutter/material.dart';
import 'package:health_application/model/info_peso.dart';

class CardPesos extends StatelessWidget {
  final InfoPeso infoPeso;
  const CardPesos({super.key, required this.infoPeso});
  
  @override
  Widget build(BuildContext context) {
    infoPeso.calcularIMC;
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      child: ListTile(
        title: Text("Peso: ${infoPeso.peso} kg"),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Altura: ${infoPeso.altura} m"),
            Text("IMC: ${infoPeso.calcularIMC().toStringAsFixed(2)}"),
            Text("Data: ${infoPeso.data.toLocal().toString().split(' ')[0]}"), // Exibe apenas a data (sem a hora)
          ],
        ),
      ),
    );
  }
}
