import 'package:app_register/Util/db.dart';
import 'package:app_register/models/db/Modal.dart';
import 'dart:async';

class ItemRepository {
  static Future<int> insert(String table, Model model) async =>
      await DB.db().insert(table, model.toMap());

  static Future<List<Map<String, dynamic>>> query(String table) async =>
      DB.db().query(table);
      
}
