import 'package:flutter/material.dart';

class EntradasLogScreen extends StatefulWidget {
  EntradasLogScreen({super.key});

  @override
  State<EntradasLogScreen> createState() => _EntradasLogScreenState();
}

class _EntradasLogScreenState extends State<EntradasLogScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF7FB5AF),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("assets/images/Instant_SOS.png", height: 55),
            Text("Acompanhe seu histórico"),
            CircleAvatar(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    labelText: "Insira seu peso",
                    focusColor: Color(0xFF7FB5AF),
                  ),
                ),
                SizedBox(height: 12),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    labelText: "Insira sua altura",
                    focusColor: Color(0xFF7FB5AF),
                  ),
                ),
                SizedBox(height: 12,),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 160),
                    )
                  ),
                  child: Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
