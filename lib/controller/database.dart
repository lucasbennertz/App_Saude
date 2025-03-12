import 'package:health_application/model/info_sintoma.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import '../model/info_peso.dart'; // Importe sua classe InfoPeso

class DatabaseHelper {
  static Database? _database;
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  // Obtém a instância do banco de dados
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  // Inicializa o banco de dados
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'info_peso.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  // Criação da tabela no banco de dados
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        peso_id INTEGER PRIMARY KEY AUTOINCREMENT,
        peso REAL,
        altura REAL,
        data TEXT,
        IMC REAL
      )
    ''');
    await db.execute('''
    CREATE TABLE sintomas (
      sintoma_id INTEGER PRIMARY KEY AUTOINCREMENT,
      sintoma TEXT,
      dataSintoma TEXT
    )
    ''');
  }

  Future<int> insertInfoSintoma(InfoSintoma infoSintoma) async{
    final db = await database;
    return await db.insert('sintomas',
        infoSintoma.toMap()
    );
  }
  Future<List<InfoSintoma>> getInfoSintoma() async{
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('sintomas');
    
    return List.generate(maps.length,
        (i){
      return InfoSintoma(
        maps[i]['sintoma'],
      ) ..sintomaId = maps[i]['sintoma_id']
        ..sintoma = maps[i]['sintoma']
        ..data = DateTime.parse(maps[i]['dataSintoma']);
        });
  }
  Future<int> deleteInfoSintoma(int? id) async {
    final db = await database;
    return await db.delete(
      'sintomas',
      where: 'sintoma_id = ?',
      whereArgs: [id],
    );
  }

  // Inserir um novo InfoPeso no banco de dados
  Future<int> insertInfoPeso(InfoPeso infoPeso) async {
    final db = await database;
    infoPeso.calcularimc();
    return await db.insert(
      'users',
      infoPeso.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Obter todos os registros de InfoPeso
  Future<List<InfoPeso>> getInfoPesos() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('users');

    return List.generate(maps.length, (i) {
      return InfoPeso(
        maps[i]['peso'],
        maps[i]['altura'],
      ) ..pesoID = maps[i]['peso_id']
        ..imc = maps[i]['IMC']
        ..data = DateTime.parse(maps[i]['data']);
    });
  }

  // Excluir um InfoPeso
  Future<int> deleteInfoPeso(int? id) async {
    final db = await database;
    return await db.delete(
      'users',
      where: 'peso_id = ?',
      whereArgs: [id],
    );
  }
}
