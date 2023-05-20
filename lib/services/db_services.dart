import 'package:sqflite/sqflite.dart';

import '../modles/db_model.dart';

class DBService {
  static Database? db;

  static const int version = 1;
  static const String _tableName = 'download';

  static Future<void> initDb() async {
    if (db != null) {
      return;
    }
    try {
      String path = '${await getDatabasesPath()}fav.db';
      db = await openDatabase(
        path,
        version: version,
        onCreate: (db, version) {
          // print("creating a new one");
          return db.execute("CREATE TABLE $_tableName("
              "id INTEGER PRIMARY KEY AUTOINCREMENT,"
              "city STRING,"
              "country STRING,"
              "lat VARCHAR(256),"
              "long VARCHAR(256),"
              "time_created STRING)");
        },
      );
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert(DB? newdb) async {
    return await db?.insert(_tableName, newdb!.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    return await db!.query(_tableName);
  }

  static delete(id) async {
    return await db!.delete(_tableName, where: 'id=?', whereArgs: [id]);
  }

  static deleteAll() async {
    return await db!.delete(_tableName);
  }

  static Future<List> check(String id) async {
    var result =
        await db!.rawQuery(''' SELECT * FROM $_tableName WHERE id == $id''');

    return result.toList();
  }
}
