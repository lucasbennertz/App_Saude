import 'package:flutter/material.dart';

class MyTextFormFieldWithDecorationForText extends StatelessWidget {
  final String? Function(String?) validatorConstrutivo;
  final String titulo;
  final TextEditingController formController;
  const MyTextFormFieldWithDecorationForText({
    super.key,
    required this.validatorConstrutivo,
    required this.titulo,
    required this.formController
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        labelText: titulo,
        focusColor: const Color(0xFF7FB5AF),
      ),
      validator: validatorConstrutivo,
      controller: formController,
    );
  }
}
