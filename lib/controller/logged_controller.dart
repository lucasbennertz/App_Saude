import 'package:health_application/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LoggedController {
  // ✅ Salvar o Usuário
  static Future<void> saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    // Converte o objeto UserModel para um Map
    String userJson = jsonEncode(user.toMap());

    // Salva no SharedPreferences
    await prefs.setString('user_data', userJson);
  }

  // ✅ Recuperar o Usuário
  static Future<UserModel?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('user_data');

    // Converte o JSON de volta para o Map e depois para um UserModel
    Map<String, dynamic> userMap = jsonDecode(userJson!);
    UserModel user = UserModel(
      userMap['idUser'], // ID do usuário
      userMap['nameUser'],
      userMap['emailUser'],
      userMap['passUser'],
      userMap['birthUser'],
    );
    return user;
  }

  // ✅ Logout (Remover Dados)
  static Future<void> logoutUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_data');
  }
}
