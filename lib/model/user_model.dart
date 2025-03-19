class UserModel{
  int? id;
  String nome;
  String email;
  String senha;
  String dataNasc;
  UserModel.semId(this.nome, this.email, this.senha,this.dataNasc);
  UserModel(this.id, this.nome, this.email, this.senha, this.dataNasc);

  Map<String, dynamic> toMap(){
    return {
      "idUser" : id,
      "nameUser" : nome,
      "emailUser" : email,
      "passUser" : senha,
      "birthUser" : dataNasc
    };
  }

}