import 'package:flutter/material.dart';

class CardInfos extends StatelessWidget {
  final int cardNumber;
  final String descricao;
  const CardInfos({super.key, required this.cardNumber, required this.descricao});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Text("${cardNumber + 1}"),
        title: Text(descricao),
      ),
    );
  }
}
