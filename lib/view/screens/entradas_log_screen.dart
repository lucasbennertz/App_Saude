import 'package:flutter/material.dart';
import 'package:health_application/controller/database.dart';
import 'package:health_application/controller/regras_validacao_form.dart';
import 'package:health_application/model/info_peso.dart';
import 'package:health_application/model/info_sintoma.dart';
import 'package:health_application/view/components/card_sintomas.dart';
import 'package:health_application/view/components/input_peso.dart';
import 'package:health_application/view/components/input_sintomas.dart';
import 'package:health_application/view/components/my_app_bar.dart';
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
  final TextEditingController _sintomaControlle = TextEditingController();

  DatabaseHelper banco = DatabaseHelper();
  List<InfoPeso> pesos = [];
  List<InfoSintoma> sintomas = [];

  @override
  void initState() {
    super.initState();
    carregarPesos();
    carregarSintomas(); // Carrega sintomas também
  }

  void carregarPesos() async {
    pesos = await banco.getInfoPesos();
    setState(() {
      pesos = pesos.reversed.toList();
    });
  }

  void carregarSintomas() async {
    sintomas = await banco.getInfoSintoma();
    setState(() {
      sintomas = sintomas.reversed.toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments.toString();
    bool telaPeso = id != "6";
    return Scaffold(
      appBar: MyAppBar(title: "Acompanhe ${telaPeso ? "seu peso" : "seus sintomas"}"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                telaPeso
                    ? InputPeso(alturaController: _alturaController, pesoController: _pesoController)
                    : InputSintomas(sintomaController: _sintomaControlle),
                SizedBox(height: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        if (telaPeso) {
                          double numeroConvertido = parseNumero(_pesoController.text);
                          double numeroConvertido2 = parseNumero(_alturaController.text);
                          var novoPeso = InfoPeso(numeroConvertido, numeroConvertido2);
                          pesos.add(novoPeso);
                          banco.insertInfoPeso(novoPeso);
                          carregarPesos();
                        } else {
                          var novoSintoma = InfoSintoma(_sintomaControlle.text);
                          sintomas.add(novoSintoma);
                          banco.insertInfoSintoma(novoSintoma);
                          carregarSintomas();
                        }
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Enviado com sucesso!"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  child: Text("Enviar dados"),
                ),
                SizedBox(height: 12),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.68,
                  child: ListView.builder(
                    itemCount: telaPeso ? pesos.length : sintomas.length,
                    itemBuilder: (context, index) {
                      return telaPeso ? CardPesos(infoPeso: pesos[index], banco: banco, onDelete: (){
                        setState(() {
                        carregarPesos();
                      });
                        }
                      )
                              : CardSintomas(infoSintoma: sintomas[index], banco: banco, onDelete: (){ setState(() {
                                carregarSintomas();
                              });});
                        },
                      )
                  ),
                ]),
            ),
          ),
        ),
      );
  }

  @override
  void dispose() {
    _pesoController.dispose();
    _alturaController.dispose();
    _sintomaControlle.dispose(); // Corrigido
    super.dispose();
  }

  double parseNumero(String valor) {
    return double.parse(valor.replaceAll(",", "."));
  }
}
