
import 'package:app_register/models/db/Modal.dart';

class Item extends Model {
  static String table = "item_table";

  int id;
  String name;
  Item({
    this.id,
    this.name,
  });
  

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  static Item fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Item(
      id: map['id'],
      name: map['name'],
    );
  }
}
