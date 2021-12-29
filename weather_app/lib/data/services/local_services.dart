import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class HistroyDB {
  static const String dbName = 'history';
  final int dbVersion = 1;
  String tableName = 'history_table';
  String countryName = 'countryName';
  String columnId = 'columnId';

  HistroyDB.__privateConstructor();
  static final HistroyDB instance = HistroyDB.__privateConstructor();

  static late Database _database;
  Future<Database> get database async {
    // if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, dbName);
    return await openDatabase(path, version: dbVersion, onCreate: _onCreate);
  }

  _onCreate(Database database, int version) async {
    await database.execute(
      'CREATE TABLE $tableName ($columnId INTEGER PRIMARY KEY, $countryName TEXT)',
    );
  }

  insert(Map<String, Object?> countryRow) async {
    Database database = await instance.database;
    return await database.insert(tableName, countryRow);
  }

  deleteAll() async {
    Database database = await instance.database;
    return await database.delete(tableName);
  }

  deleteById(int id) async {
    Database database = await instance.database;
    return await database
        .delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }
}
