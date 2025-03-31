class RegrasValidacaoForm {


  //Validacao se o peso esta null
  validarPeso(String value){
    if(value.trim().isEmpty){
      return "Por favor, insira seu peso";
    }
    String numeroConvertido  = value.replaceAll(",", ".");
    if(double.tryParse(numeroConvertido) == null){
      return "O peso deve ser um número válido";
    }
    return null;
  }
  validarAltura(String value){
    if(value.trim().isEmpty){
      return "Por favor, insira sua altura";
    }
    String numeroConvertido  = value.replaceAll(",", ".");
    if(double.tryParse(numeroConvertido) == null){
      return "A altura deve ser um número válido";
    }
    return null;
  }
  //Validar se o Sintomas esta null
  validarSintoma(String value){
    if(value.trim().isEmpty){
      return "Por favor, insira seu sintoma";
    }
    return null;
  }
  //Validar se a senha esta null
  String? validarSenha(String value) {
  value = value.trim();
  print(value);
  // Verifica se a senha está vazia
  if (value.isEmpty) {
    return "Por favor, insira a sua senha";
  }

  // Verifica o comprimento da senha (pelo menos 6 caracteres, mas pode ser ajustado)
  if (value.length < 6) {
    return "A senha deve ter pelo menos 6 caracteres";
  }

  // Se você quiser verificar se a senha tem ao menos um número
  if (!RegExp(r'\d').hasMatch(value)) {
    return "A senha deve conter pelo menos um número";
  }

  // Se você quiser verificar se a senha tem pelo menos uma letra maiúscula
  if (!RegExp(r'[A-Z]').hasMatch(value)) {
    return "A senha deve conter pelo menos uma letra maiúscula";
  }

  // Se você quiser verificar se a senha tem pelo menos um caractere especial
  if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
    return "A senha deve conter pelo menos um caractere especial";
  }

  // Se a senha for válida, retorna null
  return null;
}





  String? validarEmail(String value) {
  // Remove espaços extras no começo e final
  value = value.trim();

  // Verificando se o campo está vazio
  if (value.isEmpty) {
    return "Por favor, insira seu e-mail";
  }

  // Definindo as regras para o e-mail
  String regrasEmail = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  RegExp regra = RegExp(regrasEmail);

  // Verificando se o e-mail corresponde à expressão regular
  if (!regra.hasMatch(value)) {
    return "Por favor, insira um e-mail válido";  // Mensagem de erro se não for válido
  }

  // Se a validação for bem-sucedida, retorna null
  return null;
}

  String? validarDatanasc(String value) {
  value = value.trim();

  // Verifica se o campo está vazio
  if (value.isEmpty) {
    return "Por favor, insira sua data de nascimento";
  }

  // Expressão regular para verificar se a data está no formato DD/MM/YYYY
  String regex = r'^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/\d{4}$';
  RegExp regExp = RegExp(regex);

  // Verifica se a data corresponde ao formato DD/MM/YYYY
  if (!regExp.hasMatch(value)) {
    return "Por favor, insira uma data de nascimento válida (DD/MM/YYYY)";
  }

  // Se a data for válida, retorna null
  return null;
}


  String? validarNome(String value) {
  value = value.trim();

  // Verifica se o campo está vazio
  if (value.isEmpty) {
    return "Por favor, insira seu nome";
  }

  // Verifica se o nome tem pelo menos 2 caracteres
  if (value.length < 2) {
    return "O nome deve ter pelo menos 2 caracteres";
  }

  // Verifica se o nome contém apenas letras e espaços (sem números ou caracteres especiais)
  String regex = r'^[a-zA-Z\s]+$';
  RegExp regExp = RegExp(regex);

  if (!regExp.hasMatch(value)) {
    return "O nome deve conter apenas letras e espaços";
  }

  // Se a validação for bem-sucedida, retorna null
  return null;
}

  //Validar senha e email
  validarregrasSenha(String value){

  }


}