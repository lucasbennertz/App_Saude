import 'package:flutter/material.dart';

class CardBoasVindas extends StatelessWidget {
  const CardBoasVindas({super.key, required this.nome});
  final String nome;
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                          Text(nome, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Text("Em que podemos ajuda-lo hoje?"),
                    ],
                  ),
                ),
              ),
            );
  }
}