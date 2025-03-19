import 'package:health_application/model/user_model.dart';
import 'package:mysql1/mysql1.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
class MysqlDatabase{
var conn;

  initDatabase() async{
    await dotenv.load();
     var setting = ConnectionSettings(
       host: dotenv.env['DB_HOST']!,
       port: 26830,
       user: dotenv.env['DB_USER']!,
       password: dotenv.env['DB_PASS']!,
       db: dotenv.env['DB_DATABASE']!
     );
     conn = await MySqlConnection.connect(setting);
     print("estamos conectados");
     conn.query('''CREATE TABLE if NOT exists users(
         idUser INT AUTO_INCREMENT PRIMARY KEY,
         nameUser VARCHAR(40),
    emailUser VARCHAR(100) NOT NULL,
    passUser VARCHAR(16) NOT null,
    birthUser VARCHAR(12)
    );''');

  }
  insertUser(UserModel user) async{
   conn.query('''INSERT INTO users(nameUser, emailUser,passUser, birthUser) VALUES
     ('${user.nome}','${user.email}', '${user.senha}', '${user.dataNasc}');''');
   print("usuario cadastrado");
  }
}