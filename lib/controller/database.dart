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
  }

  // Inserir um novo InfoPeso no banco de dados
  Future<int> insertInfoPeso(InfoPeso infoPeso) async {
    final db = await database;
    infoPeso.calcularIMC();
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
      ) ..peso_ID = maps[i]['peso_id']
        ..IMC = maps[i]['IMC']
        ..data = DateTime.parse(maps[i]['data']);
    });
  }

  // Excluir um InfoPeso
  Future<int> deleteInfoPeso(int id) async {
    final db = await database;
    return await db.delete(
      'users',
      where: 'peso_id = ?',
      whereArgs: [id],
    );
  }
}
