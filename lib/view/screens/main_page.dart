import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7FB5AF),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.toc)),
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
            SizedBox(height: 12,),
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              child: Image.asset(
                'assets/images/Imagem-relaxante.png',
                width: double.infinity,
                height: 650,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
