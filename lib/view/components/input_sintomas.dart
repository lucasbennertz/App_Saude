import 'package:flutter/material.dart';
import 'package:health_application/controller/regras_validacao_form.dart';

import 'decoration/my_text_form_field_with_decoration_for_text.dart';

// ignore: must_be_immutable
class InputSintomas extends StatelessWidget {
  InputSintomas({super.key, required this.sintomaController});
  final RegrasValidacaoForm regritas = RegrasValidacaoForm();
  TextEditingController sintomaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8),
        MyTextFormFieldWithDecorationForText(
            validatorConstrutivo: (value) => regritas.validarSintoma(value!),
            titulo: "Insira aqui seu sintoma",
            formController: sintomaController),
      ],
    );
  }
}
