class UserModel{
  int? id;
  String name;
  String email;
  String dataNasc;
  String senha;
  UserModel(this.id, this.name, this.email, this.dataNasc, this.senha);
  UserModel.semId( this.name, this.email, this.dataNasc, this.senha);
  Map<String, dynamic> toMap(){
    return {
      "nameuser" : name,
      "emailuser" : email,
      "datanasc" : dataNasc,
      "passuser" : senha
    };
  }
}