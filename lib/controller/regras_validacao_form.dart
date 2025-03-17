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
  //validar se o usuario  esta null
  validarUsuario(String value){
    if(value.trim().isEmpty){
      return "Por favor, insira seu usuario";
    }
    return null;
  }
  //Validar se a senha esta null
  validarSenha(String value){
    if(value.trim().isEmpty){
      return "Por favor, insira a sua senha";
    }
    return null;
  }

  validarEmail(String value){
    if(value.trim().isEmpty){
      return "Por favor, insira seu e-mail";

    }
    // Definindo as regras do Email
    String regrasEmail = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regra = RegExp(regrasEmail);
    //Verificando as regras
   // if( )
    return null;
  }
  validarDatanasc(String value){
    if(value.trim().isEmpty){
      return "Por favor, insira sua data de nascimento ";
    }
    return null;
  }

  validarNome(String value){
    if(value.trim().isEmpty){
      return "Por favor, insira seu nome";
    }
    return null;
  }

  //Validar senha e email
  validarregrasSenha(String value){

  }


}