class RegrasValidacaoForm {

  validarPeso(String value){
    if(value.isEmpty){
      return "Por favor, insira seu peso";
    }
    String numeroConvertido  = value.replaceAll(",", ".");
    if(double.tryParse(numeroConvertido) == null){
      return "O peso deve ser um número válido";
    }
    return null;
  }
  validarAltura(String value){
    if(value.isEmpty){
      return "Por favor, insira sua altura";
    }
    String numeroConvertido  = value.replaceAll(",", ".");
    if(double.tryParse(numeroConvertido) == null){
      return "A altura deve ser um número válido";
    }
    return null;
  }
  validarSintoma(String value){
    if(value.isEmpty){
      return "Por favor, insira seu sintoma";
    }
    return null;
  }
}