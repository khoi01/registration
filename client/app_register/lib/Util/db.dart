import 'dart:async';
import 'package:app_register/models/db/item/item.dart';
import 'package:sqflite/sqflite.dart';

abstract class DB {
  static Database _db;
  static int get _version => 1;

  static Future<void> init() async {
    if (_db != null) {
      return;
    }

    try {
      String _path = await getDatabasesPath() + "exampleDB";
      _db = await openDatabase(_path, version: _version, onCreate: onCreate);
    } catch (ex) {
      print(ex);
    }
  }

  static Database db() {
    init();
    return _db;
  }

  static void onCreate(Database db, int version) async {
    print("Database:Initialize Table..");
    print("Database: Version $_version");
    await db.execute(
        'CREATE TABLE ${Item.table} (id INTEGER PRIMARY KEY NOT NULL, name STRING)');
  }
}
