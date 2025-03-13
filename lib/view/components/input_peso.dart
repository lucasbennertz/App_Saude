import 'package:flutter/material.dart';

import 'package:health_application/controller/regras_validacao_form.dart';
import 'decoration/my_text_form_field_with_decoration_for_numbers.dart';

class InputPeso extends StatelessWidget {
  InputPeso({super.key,required this.alturaController,required this.pesoController});
  final RegrasValidacaoForm regritas = RegrasValidacaoForm();
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTextFormFieldWithDecorationForNumbers(
          validatorConstrutivo: (value) => regritas.validarPeso(value!),
          titulo: "Insira seu peso",
          formController: pesoController,
        ),
        const SizedBox(height: 12),
        MyTextFormFieldWithDecorationForNumbers(
            validatorConstrutivo: (value) => regritas.validarAltura(value!),
            titulo: "Insira sua altura",
            formController: alturaController),
        const SizedBox(height: 8,)
      ],
    );
  }
}
