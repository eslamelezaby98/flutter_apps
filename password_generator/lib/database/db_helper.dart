import 'package:password_generator/constants/constants.dart';
import 'package:password_generator/models/site.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DbHelper {
  static final DbHelper instance = DbHelper._instance();
  static Database _db;
  DbHelper._instance();

//  Site Table
//  id | siteName | lettersNums | symbolsNums / numbersNums
//  0  | facebook |     5       |    5        |  5
//  1  | google   |     3       |    5        |   5
//  2  | test     |     5            5        |   5

  DbHelper.ensureInitialized();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return _db;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), kDatabaseName);
    final siteDatabase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          "create table $kTableName($kId integer primary key autoincrement, $kSiteName text not null, $kLettersNums text not null, $kSymbolsNums text not null, $kNumbersNums text not null , $kSitePassword text not null)");
    });
    return siteDatabase;
  }

// create site
  createSite(Site site) async {
    Database db = await instance.db;
    final int result = await db.insert(kTableName, site.toMap());
    return result;
  }

// get all site
Stream<dynamic>  getSites() async* {
    Database db = await this.db;
    final List<Map<String, dynamic>> result = await db.query(kTableName);
    yield result;
  }

  Future<List<Site>> getSiteList() async {
    final List<Site> siteMapList = await getSiteList();
    return siteMapList;
  }

// delete site
  deleteSite(int id) async {
    Database db = await this.db;
    return db.delete(kTableName, where: 'id = ?', whereArgs: [id]);
  }

 
}
