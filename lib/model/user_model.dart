import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier{
  int? id;
  String nome;
  String email;
  String senha;
  String dataNasc;
 String get getNome => this.nome;

 set setNome(String nome) => this.nome = nome;
 set setEmail( email) => this.email = email;
 set setSenha( senha) => this.senha = senha;
 set setDataNasc( dataNasc) => this.dataNasc = dataNasc;
 
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