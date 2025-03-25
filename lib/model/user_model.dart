import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  int? id;
  String _nome ="";
  String _email;
  String _senha;
  String _dataNasc;

  // Construtores
  UserModel.semId(this._nome, this._email, this._senha, this._dataNasc);
  UserModel(this.id, this._nome, this._email, this._senha, this._dataNasc);

  // Getters
  String get nome => _nome;
  String get email => _email;
  String get senha => _senha;
  String get dataNasc => _dataNasc;

  // Setters que notificam mudanças
  set nome(String novoNome) {
    _nome = novoNome;
    notifyListeners();
  }

  set email(String novoEmail) {
    _email = novoEmail;
    notifyListeners();
  }

  set senha(String novaSenha) {
    _senha = novaSenha;
    notifyListeners();
  }

  set dataNasc(String novaData) {
    _dataNasc = novaData;
    notifyListeners();
  }

  // Método para atualizar todos os dados de uma vez
  void atualizarUsuario({
    required String novoNome,
    required String novoEmail,
    required String novaSenha,
    required String novaDataNasc,
  }) {
    _nome = novoNome;
    _email = novoEmail;
    _senha = novaSenha;
    _dataNasc = novaDataNasc;
    notifyListeners();
  }

  // Método para converter para Map
  Map<String, dynamic> toMap() {
    return {
      "idUser": id,
      "nameUser": _nome,
      "emailUser": _email,
      "passUser": _senha,
      "birthUser": _dataNasc,
    };
  }
}
