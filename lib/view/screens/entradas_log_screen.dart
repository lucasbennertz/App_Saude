import 'package:flutter/material.dart';
import 'package:health_application/controller/database.dart';
import 'package:health_application/controller/regras_validacao_form.dart';
import 'package:health_application/model/info_peso.dart';
import 'package:health_application/view/components/MyAppBar.dart';
import 'package:health_application/view/components/card_pesos.dart';
import 'package:health_application/view/components/decoration/MyTextFormFieldWithDecorationForNumbers.dart';

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


  DatabaseHelper banco = DatabaseHelper();
  // Lista de pesos (inicializada como vazia)
  late List<InfoPeso> pesos =  [];
  @override
  void initState(){
    super.initState();
    carregarPesos();
  }

  void carregarPesos() async{
    pesos = await banco.getInfoPesos();
    print("pesos carregados");
    setState(() {
    pesos = pesos.reversed.toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Acompanhe seu peso"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                
                // Campo de Peso
                MyTextFormFieldWithDecorationForNumbers(
                  validatorConstrutivo: (value) => regritas.validarPeso(value!),
                  titulo: "Insira seu peso",
                  FormController: _pesoController,
                ),

                SizedBox(height: 12),

                // Campo de Altura
                MyTextFormFieldWithDecorationForNumbers(
                    validatorConstrutivo: (value) => regritas.validarAltura(value!),
                    titulo: "Insira sua altura",
                    FormController: _alturaController),

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
                        double numeroConvertido = parseNumero(_pesoController.text);
                        double numeroConvertido2 = parseNumero(_alturaController.text);
                        var novoPeso = InfoPeso(numeroConvertido, numeroConvertido2);
                        pesos.add(novoPeso);
                        banco.insertInfoPeso(novoPeso);
                        carregarPesos();
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
                  height: MediaQuery.of(context).size.height * 0.68, // Defina a altura fixa ou use MediaQuery para dinamicamente adaptar
                  child: ListView.builder(
                    itemCount: pesos.length,
                    itemBuilder: (context, index) {
                      return CardPesos(infoPeso: pesos[index], banco: banco,  onDelete: (){
                        setState(() {
                          carregarPesos();
                        });
                      },);
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
  double parseNumero(String valor){
    return double.parse(valor.replaceAll(",", "."));
  }
}
