import 'package:health_application/model/user_model.dart';
import 'package:mysql1/mysql1.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MysqlDatabase {
  MySqlConnection? conn;
  Future<void> initDatabase() async {
    await dotenv.load();
    var settings = ConnectionSettings(
      host: dotenv.env['DB_HOST']!,
      port: int.parse(dotenv.env['DB_PORT']!),
      user: dotenv.env['DB_USER']!,
      password: dotenv.env['DB_PASS']!,
      db: dotenv.env['DB_DATABASE']!,
    );

    conn = await MySqlConnection.connect(settings);
    print("Database connected");

    await conn?.query('''
      CREATE TABLE IF NOT EXISTS users (
        idUser INT AUTO_INCREMENT PRIMARY KEY,
        nameUser VARCHAR(40),
        emailUser VARCHAR(100) NOT NULL UNIQUE,
        passUser VARCHAR(16) NOT NULL,
        birthUser VARCHAR(12)
      );
    ''');
  }

  Future<void> insertUser(UserModel user) async {
    if (conn == null) {
      print("Database connection not initialized");
      return;
    }

    await conn?.query(
      'INSERT INTO users (nameUser, emailUser, passUser, birthUser) VALUES (?, ?, ?, ?)',
      [user.nome, user.email, user.senha, user.dataNasc],
    );

    print("User registered");
  }

  Future<bool> verificarCredenciais(String email, String senha) async {
    if (conn == null) {
      print("Database connection not initialized");
      return false;
    }

    var result = await conn?.query(
      'SELECT passUser FROM users WHERE emailUser = ?',
      [email],
    );

    if (result != null && result.isNotEmpty) {
      var senhaBanco = result.first[0]; // Obtém a senha do banco

      if (senhaBanco == senha) {
        print("Login bem-sucedido!");
        return true;
      } else {
        print("Senha incorreta.");
        return false;
      }
    } else {
      print("Usuário não encontrado.");
      return false;
    }
  }
  Future<bool> verificarSeTemUsuario(String email) async {
  if (conn == null) {
    print("Database connection not initialized");
    return false;
  }

  var result = await conn?.query(
    'SELECT COUNT(*) FROM users WHERE emailUser = ?',
    [email],
  );

  if (result != null && result.isNotEmpty) {
    int count = result.first[0] as int; // Obtém o número de registros encontrados
    return count > 0;
  }

  return false;
}


  Future<void> closeDatabase() async {
    if (conn != null) {
      await conn?.close();
      print("Database connection closed");
    }
  }
  Future<UserModel?> buscarUsuarioPorEmail(String email) async {
  if (conn == null) {
    print("Database connection not initialized");
    return null;
  }

  try {
    var results = await conn!.query(
      'SELECT nameUser, emailUser, passUser, birthUser FROM users WHERE emailUser = ?',
      [email]
    );

    if (results.isNotEmpty) {
      var row = results.first;
      var newUser = UserModel.semId(
        row['nameUser'] ?? '',   // Garante que não seja null
        row['emailUser'] ?? '',  // Garante que não seja null
        row['passUser'] ?? '',   // Garante que não seja null
        row['birthUser'] ?? '',  // Garante que não seja null
      );
      return newUser;
    } else {
      return null; // Usuário não encontrado
    }
  } catch (e) {
    print("Erro ao buscar usuário por email: $e");
    return null;
  }
}


}
