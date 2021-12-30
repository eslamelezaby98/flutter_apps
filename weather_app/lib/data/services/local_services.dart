// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import 'package:weather_app/data/models/history_model.dart';
// import 'package:weather_app/helper/constants_manager.dart';

// class HistroyDB {
//   static final HistroyDB instance = HistroyDB.init();
//   HistroyDB.init();
//   static Database? _database;
//   HistroyDB.ensureInitialized();

//   Future<Database> get database async {
//     if (_database != null) {
//       return _database!;
//     }
//     _database = await initDB(ConstantsManager.dbName);
//     return _database!;
//   }

//   Future<Database> initDB(String fileName) async {
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, fileName);
//     return await openDatabase(path,
//         version: ConstantsManager.dbVersion, onCreate: _onCreate);
//   }

//   Future<void> _onCreate(Database db, int version) async {
//      await db.execute(
//         'CREATE TABLE ${ConstantsManager.tableName} (${ConstantsManager.id} INTEGER PRIMARY KEY AUTOINCREMENT, ${ConstantsManager.countryName} TEXT NOT NULL');
//   }

//   addItemToHistory(Histroy histroy) async {
//     Database db = await instance.database;
//     final int result =
//         await db.insert(ConstantsManager.tableName, histroy.toJson());
//     return result;
//   }

//   getAllItems() async {
//     Database db = await instance.database;
//     final List<Map<String, dynamic>> result =
//         await db.query(ConstantsManager.tableName);
//     print(result);
//     return result;
//   }

//   Future<int> deleteItem(int id) async {
//     Database db = await instance.database;
//     return db.delete(
//       ConstantsManager.tableName,
//       where: '${ConstantsManager.id} = ?',
//       whereArgs: [id],
//     );
//   }
// }
