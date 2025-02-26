import 'package:flutter/material.dart';
import 'package:health_application/controller/regras_validacao_form.dart';
import 'package:health_application/model/info_peso.dart';
import 'package:health_application/view/components/card_pesos.dart';

class EntradasLogScreen extends StatefulWidget {
  const EntradasLogScreen({super.key});

  @override
  State<EntradasLogScreen> createState() => _EntradasLogScreenState();
}

class _EntradasLogScreenState extends State<EntradasLogScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  RegrasValidacaoForm regritas = RegrasValidacaoForm();

  // Controladores para gerenciar o valor dos campos
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();

  // Lista de pesos (inicializada como vazia)
  late List<InfoPeso> pesos = [];

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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Campo de Peso
                TextFormField(
                  controller: _pesoController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    labelText: "Insira seu peso",
                    focusColor: Color(0xFF7FB5AF),
                  ),
                  validator: (value) => regritas.validarPeso(value!),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 12),

                // Campo de Altura
                TextFormField(
                  controller: _alturaController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    labelText: "Insira sua altura",
                    focusColor: Color(0xFF7FB5AF),
                  ),
                  validator: (value) => regritas.validarAltura(value!),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 12),

                // Botão de Enviar
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        // Simulação de adição de dados à lista de pesos
                        String numeroConvertido = _pesoController.text.replaceAll(",", ".");
                        String numeroConvertido2 = _alturaController.text.replaceAll(",", ".");
                        pesos.add(InfoPeso(double.parse(numeroConvertido), double.parse(numeroConvertido2)));
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Enviado com sucesso!")),
                      );
                    }
                  },
                  child: Text("Enviar dados"),
                ),
                SizedBox(height: 12), // Adiciona um espaço entre o botão e a lista de dados

                // Usando ListView.builder para exibir os dados
                Container(
                  height: 300, // Defina a altura fixa ou use MediaQuery para dinamicamente adaptar
                  child: ListView.builder(
                    itemCount: pesos.length,
                    itemBuilder: (context, index) {
                      return CardPesos(infoPeso: pesos[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pesoController.dispose();
    _alturaController.dispose();
    super.dispose();
  }
}
